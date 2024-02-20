//
//  GenderView.swift
//  Tinder
//
//  Created by Stephan Dowless on 2/2/24.
//

import SwiftUI

struct GenderView: View {
    @EnvironmentObject var onboardingManager: OnboardingManager
    @State var selectedGender: GenderType?
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("What's your Gender?")
                        .font(.title)
                        .bold()
                    
                    Text("We value and support diversity and inclusion of all genders. We will add more options to include everyone soon.")
                        .font(.subheadline)
                }
                .padding()

                ForEach(GenderType.allCases) { gender in
                    Button(action: {
                        self.selectedGender = gender
                    }, label: {
                        Text("\(gender.description)")
                            .frame(width: 300, height: 50)
                            .overlay(RoundedRectangle(cornerRadius: 25)
                            .stroke(selectedGender == gender ? .red : .white, lineWidth: 1.5))
                    })
                }
            }
            
            Spacer()
            
            NextButton(formIsValid: formIsValid)
        }
        .onChange(of: selectedGender, perform: { value in
            onboardingManager.gender = value
        })
        .frame(maxWidth: .infinity)
        .foregroundStyle(.white)
        .background(.black)
        .toolbar {
            ToolbarItem(placement: .topBarLeading)
            { BackButton() }
        }
    }
}

extension GenderView: FormValidatorProtocol {
    var formIsValid: Bool {
        return selectedGender != nil
    }
}

#Preview {
    GenderView()
        .environmentObject(OnboardingManager(service: .init(imageUploader: .init())))
}
