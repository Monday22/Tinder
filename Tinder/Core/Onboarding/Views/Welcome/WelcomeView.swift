//
//  WelcomeView.swift
//  Tinder
//
//  Created by Stephan Dowless on 1/23/24.
//

import SwiftUI

struct WelcomeView: View {    
    @StateObject var manager = OnboardingManager()
    @Binding var didCompleteOnboarding: Bool
    
    var body: some View {
        NavigationStack(path: $manager.navigationPath) {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Image(.tinderAppIcon)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                    
                    Text("Welcome to Aurora.")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                    Text("Please follow these House Rules.")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                WelcomeInfoItemView(title: "Be Yourself.", subtitle: "Make sure your photos, age, and bio are true to who you are.")
                
                WelcomeInfoItemView(title: "Stay safe.", subtitle: "Don't be too quick to give our personal information.")
                
                WelcomeInfoItemView(title: "Play it cool.", subtitle: "Respect others and treat them as you would like to be treated.")
                
                WelcomeInfoItemView(title: "Be proactive.", subtitle: "Always report bad behavior.")
                
                Spacer()
                
                Button {
                    manager.start()
                } label: {
                    Text("I agree")
                        .modifier(TinderButtonModifier())
                }
            }
            .onChange(of: manager.didCompleteOnboarding, perform: { value in
                self.didCompleteOnboarding = value
            })
            .navigationDestination(for: OnboardingSteps.self, destination: { step in
                VStack {
                    switch step {
                    case .name:
                        FullNameView()
                    case .birthday:
                        BirthdayView()
                    case .study:
                        StudyView()
                    case .graduationYear:
                        GraduationYearView()
                    default:
                        Text("Hello")
                    }
                }
                .environmentObject(manager)
                .navigationBarBackButtonHidden()
            })
            .padding()
            .background(.black)
        }
    }
}

#Preview {
    WelcomeView(didCompleteOnboarding: .constant(false))
}
