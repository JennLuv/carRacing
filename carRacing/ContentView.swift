//
//  ContentView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scale = 1.01
    @State private var userInput = ""
    @State private var isTapped = false
    @State private var isEditable = true
    @State private var carSelectedColor: CGColor = UIColor.blue.cgColor
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                licenseView(scale: $scale, userInput: $userInput, isEditable: $isEditable)
                    .onTapGesture {
                        withAnimation {
                            scale = scale + 0.05
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            withAnimation {
                                scale = scale - 0.05
                            }
                        }
                    }
                    .ignoresSafeArea()
                Spacer()
                
                NavigationLink {
                    garageView(userInput: $userInput, carSelectedColor: $carSelectedColor)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(trailing:
                                                ColorPicker("Select Color", selection: $carSelectedColor)
                                            
                        )
                        .navigationBarItems(leading:
                                                licenseView(scale: (.constant(0.2)), userInput: $userInput, isEditable: (.constant(false)))
                            .frame(width: 60, height: 35)
                                            
                        )
                        .navigationTitle("Garage")
                        .navigationBarTitleDisplayMode(.inline)
                        .labelsHidden()
                } label: {
                    Text("Start")
                        .foregroundStyle(.blue)
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: 56)
                }
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.fill)
                        .padding(.horizontal)
                )
                
                .padding(.bottom, 40)
            }
            .padding(.top, 40)
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
