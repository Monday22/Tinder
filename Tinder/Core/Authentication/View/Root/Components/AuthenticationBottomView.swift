//
//  AuthenticationBottomView.swift
//  Tinder
//
//  Created by Brandon on 1/25/24.
//

import SwiftUI

struct AuthenticationBottomView: View {
    @Binding var authType: AuthType?
    @ObservedObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("By tapping 'Sign in' you agree to our Terms, Learn how we process your data in our Privacy Policy and Cookies Policy")
                .multilineTextAlignment(.center)
                .font(.footnote)
                .foregroundColor(.white)
            
            Button(action: {
                authType = .createAccount
            }, label: {
                Text("Create Account")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 340, height: 50)
            })
            .background(.primary)
            .clipShape(Capsule())
            
            Button(action: {
                authType = .login
            }, label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
            })
            .overlay {
                Capsule()
                    .stroke(.white, lineWidth: 1.5)
            }
            
            NavigationLink {
                ForgotPasswordView(authViewModel: authViewModel)
            } label: {
                Text("Trouble signing in?")
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal, 30)
    }
}


#Preview {
    AuthenticationBottomView(authType: .constant(.login), authViewModel: .init())
}
