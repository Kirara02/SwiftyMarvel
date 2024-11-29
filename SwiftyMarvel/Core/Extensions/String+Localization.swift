//
//  String+Localization.swift
//  SwiftyMarvel
//
//  Created by Uniguard ID on 28/11/24.
//

import Foundation

extension String {
    /// Localizes the string using the `Localizable.strings` file.
    func localized(with comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}
