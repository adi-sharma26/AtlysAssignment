//
//  CardView.swift
//  AtlysAssignment
//
//  Created by Aditya Sharma on 04/05/25.
//

import SwiftUI

struct CardView: View {
    var imageName: String
    var countryName: String
    var visaInfo: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .clipped()
                    .cornerRadius(16)
                
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
                            Color.white
                                .frame(width: 44, height: 44)
                                .cornerRadius(22)
                                .shadow(radius: 2)
                            
                            AppImage.verified.image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .padding(.top, 16)
                        .padding(.trailing, 16)
                    }
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(countryName)
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.leading, 8)
                            
                            Text(visaInfo)
                                .font(.footnote)
                                .foregroundColor(.white)
                                .padding(8)
                                .background(
                                    Color.atlysPrimary
                                        .clipShape(
                                            RoundedCorner(
                                                radius: 8,
                                                corners: [.topRight, .bottomRight]
                                            )
                                        )
                                )
                            
                        }
                        .padding(.bottom, 32)
                        Spacer()
                    }
                }
            }
            .cornerRadius(16)
            .shadow(radius: 5)
        }
    }
}

#Preview {
    CardView(imageName: AppImage.logoFrance.rawValue,
             countryName: "France",
             visaInfo: "20K+ Visas on Atlys")
    .frame(width: 250, height: 250, alignment: .center)
    .padding()
}
