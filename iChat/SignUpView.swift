//
//  SignUpView.swift
//  iChat
//
//  Created by Jackson Matheus dos Santos on 18/12/21.
//

import SwiftUI

struct SignUpView: View {
    
  @StateObject var viewModel = SignUpViewModel()
  @State var isShowPhotoLibrary = false
    
    
    
    var body: some View {
        VStack{
            Button{
                isShowPhotoLibrary = true
            }label: {
                
                if(viewModel.image.size.width > 0){
                    Image(uiImage: viewModel.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.blue,
                                 lineWidth: 4 ))
                        .shadow(radius:7)
                    
                }else {
                    
                
                
                Text("Foto")
                    .frame(width: 100, height: 100)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(100)
                }
            }
            .padding(.bottom, 32)
            
            
            .sheet(isPresented: $isShowPhotoLibrary){
                ImagePicker(selectedImage: $viewModel.image)
            }
                
                
            
            
            
            
            
            
            
            
            TextField("Entre com seu nome completo", text: $viewModel.name)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(Color.white)
                .cornerRadius(24.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .strokeBorder(Color(UIColor.separator),
                                      style: StrokeStyle(lineWidth: 1))
                )
                .padding(.bottom, 20)
            
            
            
            TextField("Entre com seu email", text: $viewModel.email)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(Color.white)
                .cornerRadius(24.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .strokeBorder(Color(UIColor.separator),
                                      style: StrokeStyle(lineWidth: 1))
                )
                .padding(.bottom, 20)
            
            
            
            
            SecureField("Entre com sua senha", text: $viewModel.password)
                .autocapitalization(.none)
                .disableAutocorrection(false)
                .padding()
                .background(Color.white)
                .cornerRadius(5.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 5.0)
                        .strokeBorder(Color(UIColor.separator),
                                      style: StrokeStyle(lineWidth: 1))
                )
                .padding(.bottom, 40)
            
            
            
            if(viewModel.isLoading){
                ProgressView()
                    .padding()
            }
            
            
            Button {
                viewModel.signUp()
            } label :{
                Text("Entrar")
                    .frame(maxWidth:.infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(10.0)

            }.alert(isPresented: $viewModel.formInvalid) {
                Alert(title: Text(viewModel.alertText))
                
            }
          
            
        }
         .padding(.horizontal, 32)
         .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
