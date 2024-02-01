//
//  StudyView.swift
//  Tinder
//
//  Created by Brandon on 1/30/24.
//

import SwiftUI

struct StudyView: View {
    @EnvironmentObject var onboardingManager: OnboardingManager
    @State var study: String = ""
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your study?")
                    .font(.title)
                    .bold()
                
                VStack(alignment: .leading) {
                    TextField("Enter your study", text: $study)
                    
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("This is how it'll appear in your profile.")
                            .font(.footnote)
                            .opacity(0.6)
                        
                        Text("You can modify this later.")
                            .font(.footnote)
                            .bold()
                    }
                    .padding(.vertical, 6)
                }
                
                Spacer()
            }
            
            Button {
                onboardingManager.navigate()
            } label: {
                Text("Next")
                    .foregroundStyle(.white)
                    .bold()
                    .font(.title3)
                    .frame(width: 320, height: 50)
                    .background(Color(.primaryPink))
                    .clipShape(Capsule())
            }
        }
        .padding()
        .foregroundStyle(.white)
        .background(.black)
        .toolbar {
            ToolbarItem(placement: .topBarLeading)
            { BackButton() }
        }
    }
}

#Preview {
    StudyView()
        .environmentObject(OnboardingManager())
}