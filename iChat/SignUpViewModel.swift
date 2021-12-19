//
//  SignUpViewModel.swift
//  iChat
//
//  Created by Jackson Matheus dos Santos on 18/12/21.
//

import Foundation
import FirebaseAuth

import FirebaseStorage

class SignUpViewModel: ObservableObject {
    var email = ""
    var password = ""
    var name = ""
    var alertText = ""

    @Published var isLoading = false
    @Published var image = UIImage()

    @Published var formInvalid = false
    
    func signUp(){
        print("nome : \(name)")
        print("email : \(email)")
        print("senha : \(password)")
        
        
        if(image.size.width <= 1){
            formInvalid = true
            alertText = "Selecione uma foto"
            
            return
            
        }
        
        self.isLoading = true

        Auth.auth().createUser(withEmail: email, password: password){
            result, err in
            
            guard let user = result?.user, err == nil else {
                self.formInvalid = true
                self.alertText = err!.localizedDescription
                self.isLoading = false

                return
            }
            self.isLoading = false

            print("usuario \(user.uid) cadastrado com sucesso")
            
            
            self.uploadPhoto()
        }
    }
    
    
    
    private func uploadPhoto(){

        let filename = UUID().uuidString

        guard let data = image.jpegData(compressionQuality: 0.2) else { return }
       
        let newMetaData = StorageMetadata()
        newMetaData.contentType = "image/jpeg"
        
        
        let ref = Storage.storage().reference(withPath: "/images/\(filename).jpg")
        
      
        
        ref.putData(data, metadata: newMetaData){ metadata, err in
            ref.downloadURL{ url, error in
               self.isLoading = false
               print("Foto criada \(url)")
                
                print(error)
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
