//
//  AppStrings.swift
//  AtlysAssignment
//
//  Created by Aditya Sharma on 05/05/25.
//

import Foundation

enum AppStrings: String {
    case visas_on_time = "visas_on_time"
    case btn_done = "btn_done"
    case btn_continue = "btn_continue"
    case login_with_mobile = "login_with_mobile"
    case enter_mobile_number = "enter_mobile_number"
}

extension AppStrings {
    var localized: String {
        String(localized: LocalizedStringResource(stringLiteral: self.rawValue))
    }
}
