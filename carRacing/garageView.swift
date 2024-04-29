//
//  garageView.swift
//  carRacing
//
//  Created by Jennifer Luvindi on 30/04/24.
//

import SwiftUI

struct garageView: View {
    @State private var selectedSide = 1
    @Binding var userInput: String
    @Binding var carSelectedColor: CGColor
    let asset = assetsModel.getAssetsData()
    
    
    var body: some View {
        VStack{
            Spacer()
            Text("yo")
                .foregroundStyle(Color(carSelectedColor))
            Spacer()
            
            ZStack {
                Rectangle()
                    .fill(.thickMaterial)
                VStack{
                    Picker("Choose the SIGs you joined", selection: $selectedSide) {
                        Text("License").tag(0)
                        Text("Body").tag(1)
                        Text("Velg").tag(2)
                    }
                    .padding()
                    .pickerStyle(SegmentedPickerStyle())
                    Spacer()
                    
                    switch selectedSide {
                    case 0:
                        licenseView(scale: (.constant(0.9)), userInput: $userInput, isEditable: (.constant(true)))
                        
                    case 1:
                        ScrollView(.horizontal){
                            LazyHStack {
                                ForEach(asset) { asset in
                                    cardView(asset: asset)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    case 2:
                        EmptyView()
                    default:
                        EmptyView()
                    }
                    Spacer()
                    
                    NavigationLink {
                        raceViewVersion2()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Race")
                            .foregroundStyle(.blue)
                            .bold()
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 56)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.fill)
                            .padding(.horizontal)
                    )
                    .padding(.bottom, 40)
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 457)
            
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}

