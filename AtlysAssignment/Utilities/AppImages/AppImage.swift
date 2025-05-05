//
//  AppImage.swift
//  AtlysAssignment
//
//  Created by Aditya Sharma on 05/05/25.
//

import SwiftUI

enum AppImage: String {
    
    case verified
    case atlysLogo = "atlys_logo"
    case logoFrance = "logo_france"
    case logoAustralia = "logo_australia"
    case logoMalaysia = "logo_malaysia"
    
    var image: Image {
        Image(self.rawValue, bundle: nil)
    }
}
