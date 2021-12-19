//
//  SignInViewModel.swift
//  iChat
//
//  Created by Jackson Matheus dos Santos on 18/12/21.
//

import Foundation
import FirebaseAuth



class SignInViewModel: ObservableObject {
    var email = ""
    var password = ""
    
    
    @Published var isLoading = false

    @Published var formInvalid = false
    var alertText = ""
    
    func signIn(){
        print("email : \(email)")
        print("senha : \(password)")
        self.isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password){
            result, err in
            
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                self.isLoading = false

                return
            }
            self.isLoading = false

            print("usuario \(user.uid) cadastrado com sucesso")
        }
    }
   
}
