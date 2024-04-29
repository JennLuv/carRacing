//
//  licenseView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 29/04/24.
//

import Foundation
import SwiftUI

struct licenseView: View {
    
    @Binding var scale: Double
    @Binding var userInput: String
    @Binding var isEditable: Bool
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
            RoundedRectangle(cornerRadius: 20)
                .padding()
                .foregroundColor(.gray)
            if isEditable {
                TextField("B 1212 YYY", text: $userInput)
                    .font(.system(size: 45))
                    .background(Color.gray)
                    .fontWeight(.bold)
                    .autocapitalization(.allCharacters)
                    .multilineTextAlignment(.center)
                    .padding()
            } else {
                Text(userInput)
                    .font(.system(size: 45))
                    .background(Color.gray)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
        }
        .frame(width: 295, height: 150)
        .scaleEffect(scale)
        
    }
    
}

