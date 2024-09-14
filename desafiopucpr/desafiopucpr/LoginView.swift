//
//  LoginView.swift
//  desafiopucpr
//
//  Created by pedro.bueno on 14/09/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    @State private var rememberPassword: Bool = true
    
    var body: some View {
        VStack(){
            Text("YOSDA\nAPP")
                .foregroundColor(Color(.white))
                .italic()
                .font(.system(size: 50, weight: .bold, design: .monospaced))
                .padding(.top, 72)
                .padding(.bottom, 56)
            ZStack(alignment: .top){
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                    .frame(
                        minWidth: 0,
                        maxWidth: .infinity,
                        minHeight: 0,
                        maxHeight: .infinity,
                        alignment: .top
                    ).edgesIgnoringSafeArea(.bottom)
                VStack(alignment: .leading){
                    Text("Crie sua conta")
                        .font(.title)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 12)
                    
                    Text("E-mail")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    TextField("",text: $email)
                    Spacer().frame(height: 24)
                    HStack{
                        Text("Senha")
                            .font(.subheadline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Button("Recuperar senha") {
                            
                        }
                    }
                    HStack {
                        if isPasswordVisible {
                            TextField("",text: $password)
                        } else {
                            SecureField("",text: $password)
                        }
                    }
                    .overlay(alignment: .trailing) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .padding()
                            .onTapGesture {
                                isPasswordVisible.toggle()
                            }
                    }
                    
                    Toggle(isOn: $rememberPassword) {
                        Text("Lembrar minha senha")
                    }
                    .padding(.bottom, 12)
                    
                    Button(action:{}){
                        HStack{
                            Spacer()
                            Text("Criar conta")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding()
                    }
                    .background(Color("AppPurple"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    Button(action:{}){
                        HStack{
                            Spacer()
                            Image(systemName: "apple.logo")
                            Text("Continuar com Apple")
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        .padding()
                    }
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                    HStack() {
                        Spacer()
                        Text("Já possui uma conta?")
                        Button("Entre"){
                            print("login")
                        }
                        Spacer()
                    }
                    .padding(.top, 12)
                    
                }.textFieldStyle(CustomTextFieldStyle())
                    .padding(.all, 24)
                    .padding(.top, 24)
            }
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top
        ).background(
            LinearGradient(gradient: Gradient(colors: [
                Color("AppGradient"),
                Color("AppPurple")
            ]
                                             ),
                           startPoint: .top,
                           endPoint: .center
            )
        )
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.purple.opacity(0.5), lineWidth:2)
            )
    }
}
