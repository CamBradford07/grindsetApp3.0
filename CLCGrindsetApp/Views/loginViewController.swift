//
//  loginViewController.swift
//  CLCGrindsetApp
//
//  Created by DANIEL HUSEBY on 4/22/25.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import CryptoKit
import AuthenticationServices
import GoogleSignIn

class loginViewController: UIViewController, UITextFieldDelegate, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    @IBOutlet weak var emailTextOutlet: UITextField!
    @IBOutlet weak var passwordFieldOutlet: UITextField!
    
    fileprivate var currentNonce: String?
    
    var alreadyLoggedIn = false
    
    // peter's goofy ahh better stop autoclicking now.

    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordFieldOutlet.delegate = self
        emailTextOutlet.delegate = self
        passwordFieldOutlet.text = ""
        emailTextOutlet.text = ""
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if newAccountViewController.createdNew{
            alreadyLoggedIn = true
            performSegue(withIdentifier: "loginSuccess", sender: nil)
            newAccountViewController.createdNew = false
            
            
        } else {
            alreadyLoggedIn = false
        }
    }
    

    @IBAction func emailLoginAction(_ sender: Any) {
        if alreadyLoggedIn {
            return
        }
        
        
        let email = emailTextOutlet.text ?? ""
        let password = passwordFieldOutlet.text ?? ""
        
        if email == "" || password == ""{
            createAlert(alertTitle: "Invalid Input", alertDesc: "Email and Password cannot be blank")
        }
        else{
            var userFound = false
            
            for id in AppData.ids{
                if id == email{
                    userFound = true
                    break
                }
            }
//            print(userFound)
            
            if userFound == true {
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                    guard let self = self else { return }

                    if let error = error {
                        self.createAlert(alertTitle: "Incorrect Password", alertDesc: "Password is incorrect")
                        print("Sign in failed: \(error.localizedDescription)")
                        return
                    }

                    // sign-in was successful
                    guard let userIndex = AppData.ids.firstIndex(of: email) else {
                        print("Email not found in AppData")
                        return
                    }

                    AppData.currentStudent = AppData.students[userIndex]
                    AppData.saveUserAndPass()
                    AppData.loadSelectedClasses()
                    self.alreadyLoggedIn = true

                    // Navigate to correct screen after login
                    if AppData.currentStudent.isStudent {
                        firstViewController.justRegistered = false
                        self.performSegue(withIdentifier: "studentLogIn", sender: self)
                    } else {
                        firstViewController.justRegistered = false
                        self.performSegue(withIdentifier: "teacherLogIn", sender: self)
                    }
                }
            } //chat fixed sign in and crash error for this section
            else {
                let alert = UIAlertController(title: "Account Not Found", message: "No account was found with that information", preferredStyle: .alert)
                let action = UIAlertAction(title: "Create Account", style: .default) {(action) in
                    self.performSegue(withIdentifier: "makeNew", sender: nil)
                            }
                alert.addAction(action)
                alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                
                self.present(alert, animated: true)
//                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//                    print("User Creation")
//                    var newStudent = Student(id: email, gradeLevel: 9, selectedClasses: [String](), takenClasses: [String]())
//                    newStudent.addToFirebase(docRef: AppData.ref)
//                    AppData.currentStudent = newStudent
//                    AppData.saveUserAndPass()
//                   AppData.loadSelectedClasses()
//                    self.performSegue(withIdentifier: "loginSuccess", sender: self)
//                }
            }
            
            
        }
    }
    
    
    @IBAction func googleLoginAction(_ sender: UIButton) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
          guard error == nil else {
//            print(error)
              return
          }

          guard let user = result?.user,
            let idToken = user.idToken?.tokenString
          else {
           return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: user.accessToken.tokenString)

            var userFound = false
            for id in AppData.ids{
                if user.userID! == id{
                    userFound = true
                    break
                }
            }
            
            if userFound{
                var userIndex = AppData.ids.firstIndex(of: user.userID!)!
                var currentStudent = AppData.students[userIndex]
                AppData.saveUserAndPass()
                   AppData.loadSelectedClasses()
                self.performSegue(withIdentifier: "loginSuccess", sender: self)
            }else{
                var newStudent = Student(id:user.profile?.name, gradeLevel: 9, selectedClasses: [String](), takenClasses: [String]())
                newStudent.addToFirebase(docRef: AppData.ref)
                AppData.currentStudent = newStudent
                AppData.saveUserAndPass()
                   AppData.loadSelectedClasses()
                self.performSegue(withIdentifier: "loginSuccess", sender: self)
            }
            
        }
    }
    
    
    @IBAction func appleLoginAction(_ sender: UIButton) {
        startSignInWithAppleFlow()
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func createAlert(alertTitle: String, alertDesc: String){
            let alert = UIAlertController(title: alertTitle, message: alertDesc, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    
   
    private func randomNonceString(length: Int = 32) -> String {
      precondition(length > 0)
      var randomBytes = [UInt8](repeating: 0, count: length)
      let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
      if errorCode != errSecSuccess {
        fatalError(
          "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
        )
      }

      let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")

      let nonce = randomBytes.map { byte in
        // Pick a random character from the set, wrapping around if needed.
        charset[Int(byte) % charset.count]
      }

      return String(nonce)
    }
    private func sha256(_ input: String) -> String {
      let inputData = Data(input.utf8)
      let hashedData = SHA256.hash(data: inputData)
      let hashString = hashedData.compactMap {
        String(format: "%02x", $0)
      }.joined()

      return hashString
    }

    func startSignInWithAppleFlow() {
      let nonce = randomNonceString()
      currentNonce = nonce
      let appleIDProvider = ASAuthorizationAppleIDProvider()
      let request = appleIDProvider.createRequest()
      request.requestedScopes = [.fullName, .email]
      request.nonce = sha256(nonce)

      let authorizationController = ASAuthorizationController(authorizationRequests: [request])
      authorizationController.delegate = self
      authorizationController.presentationContextProvider = self
      authorizationController.performRequests()
    }
    
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
          guard let nonce = currentNonce else {
            fatalError("Invalid state: A login callback was received, but no login request was sent.")
          }
          guard let appleIDToken = appleIDCredential.identityToken else {
//            print("Unable to fetch identity token")
            return
          }
          guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
//            print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
            return
          }
          // Initialize a Firebase credential, including the user's full name.
          let credential = OAuthProvider.appleCredential(withIDToken: idTokenString,
                                                            rawNonce: nonce,
                                                            fullName: appleIDCredential.fullName)
          // Sign in with Firebase.
          Auth.auth().signIn(with: credential) { (authResult, error) in
              if (error != nil) {
              // Error. If error.code == .MissingOrInvalidNonce, make sure
              // you're sending the SHA256-hashed nonce as a hex string with
              // your request to Apple.
//                  print(error?.localizedDescription)
              return
            }
              var user = appleIDCredential.user
              
              var userFound = false
              for id in AppData.ids{
                  if id == user{
                      userFound = true
                      break
                  }
              }
              
              if userFound{
                  var userIndex = AppData.ids.firstIndex(of: user)!
                  AppData.currentStudent = AppData.students[userIndex]
                  AppData.saveUserAndPass()
                   AppData.loadSelectedClasses()
                  self.performSegue(withIdentifier: "loginSuccess", sender: self)
              }else{
                  var newStudent = Student(id: "\(appleIDCredential.fullName!)", gradeLevel: 9, selectedClasses: [String](), takenClasses: [String]())
                  newStudent.addToFirebase(docRef: AppData.ref)
                  AppData.currentStudent = newStudent
                  AppData.saveUserAndPass()
                   AppData.loadSelectedClasses()
                  self.performSegue(withIdentifier: "loginSuccess", sender: self)
              }

          }
        }
      }

      func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
//          print(error)
      }

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        ASPresentationAnchor()
    }

}
