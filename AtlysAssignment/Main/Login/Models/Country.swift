//
//  Country.swift
//  AtlysAssignment
//
//  Created by Aditya Sharma on 05/05/25.
//

import SwiftUI

struct Country: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let visasInfo: String
}

struct CountryDataSource {
    static let countries: [Country] = [
        Country(imageName: AppImage.logoFrance.rawValue, name: "France", visasInfo: "20K+ Visas on Atlys"),
        Country(imageName: AppImage.logoAustralia.rawValue, name: "Australia", visasInfo: "50K+ Visas on Atlys"),
        Country(imageName: AppImage.logoMalaysia.rawValue, name: "Malaysia", visasInfo: "15K+ Visas on Atlys")
    ]
}
