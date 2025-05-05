//
//  ContentView.swift
//  AtlysAssignment
//
//  Created by Aditya Sharma on 02/05/25.
//

import SwiftUI

struct ContentView: View {
    
    private var countries = CountryDataSource.countries
    
    @State private var hasScrolled = false
    @State private var mobileNumber: String = ""
    @State private var currentIndex: Int? = nil
    @FocusState private var isTextFieldFocused: Bool
    
    var isMobileValid: Bool {
        mobileNumber.count == 10 && mobileNumber.allSatisfy(\.isNumber)
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            VStackLayout(spacing: 0) {
                AppImage.atlysLogo.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 72)
                    .padding(.top, 24)
                Text(AppStrings.visas_on_time.localized)
                    .font(.headline)
                    .foregroundColor(Color.atlysPrimary)
                    .padding(.top, -12)
            }
            
            GeometryReader { geo in
                ScrollViewReader { scrollProxy in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<countries.count, id: \.self) { index in
                                CardView(
                                    imageName: countries[index].imageName,
                                    countryName: countries[index].name,
                                    visaInfo: countries[index].visasInfo
                                )
                                .frame(width: 250, height: 250)
                                .scrollTransition { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1 : 0.5)
                                        .scaleEffect(y: phase.isIdentity ? 1 : 0.7)
                                }
                                .id(index)
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .contentMargins(
                        (geo.size.width - 250) / 2,
                        for: .scrollContent
                    )
                    .scrollTargetBehavior(.viewAligned)
                    .scrollPosition(id: $currentIndex)
                    .frame(height: 280)
                    .task {
                        if !hasScrolled {
                            let middleIndex = countries.count / 2
                            scrollProxy.scrollTo(middleIndex, anchor: .center)
                            currentIndex = middleIndex
                            hasScrolled = true
                        }
                    }
                }
            }
            .frame(height: 280)
            
            HStack(spacing: 8) {
                ForEach(0..<countries.count, id: \.self) { index in
                    Circle()
                        .fill(index == currentIndex ? Color.atlysPrimary : Color.atlysDisabled)
                        .frame(width: 8, height: 8)
                }
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 12) {
                Text(AppStrings.login_with_mobile.localized)
                    .font(.headline)
                
                TextField(AppStrings.enter_mobile_number.localized, text: Binding(
                    get: { self.mobileNumber },
                    set: { newValue in
                        let filtered = newValue.filter { $0.isNumber }
                        if filtered.count <= 10 {
                            self.mobileNumber = filtered
                            if filtered.count == 10 {
                                isTextFieldFocused = false
                            }
                        }
                    }
                ))
                .keyboardType(.numberPad)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .focused($isTextFieldFocused)
                
                Button(action: {
                    print("Login requested with: \(mobileNumber)")
                }) {
                    Text(AppStrings.btn_continue.localized)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isMobileValid ? Color.atlysPrimary : Color.atlysDisabled)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(!isMobileValid)
            }
            .padding(.horizontal, 30)
            .padding(.bottom, 40)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button(AppStrings.btn_done.localized) {
                        isTextFieldFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
