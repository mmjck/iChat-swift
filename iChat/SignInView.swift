//
//  ContentView.swift
//  iChat
//
//  Created by Jackson Matheus dos Santos on 18/12/21.
//

import SwiftUI

struct SignInView: View {
    
  @StateObject var viewModel = SignInViewModel()
    
    
    
    
    var body: some View {
        NavigationView{
        VStack{
            Image("chat_logo")
                .resizable()
                .scaledToFit()
                .padding()
            
            
            
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
                viewModel.signIn()
            } label :{
                Text("Entrar")
                    .frame(maxWidth:.infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(Color.white)
                    .cornerRadius(10.0)

            }
            .alert(isPresented: $viewModel.formInvalid) {
                Alert(title: Text(viewModel.alertText))
                
            }
            
            
            Divider()
                .padding()
            
            
            NavigationLink(destination: SignUpView()){
                Text("Não possui uma conta? Clique aqui")
                    .foregroundColor(Color.black)
            }
            
            
           
            
        }
         .padding(.horizontal, 32)
         .navigationTitle("Login")
       
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
