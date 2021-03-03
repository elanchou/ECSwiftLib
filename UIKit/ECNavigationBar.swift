//
//  ECNavigationBar.swift
//  ECSwiftLib
//
//  Created by ElanChou on 2021/3/3.
//

import Foundation
import UIKit

// MARK: - Methods

public extension UINavigationBar {
    /// ECSwiftLib: Set Navigation Bar title, title color and font.
    ///
    /// - Parameters:
    ///   - font: title font.
    ///   - color: title text color (default is .black).
    func setTitleFont(_ font: UIFont, color: UIColor = .black) {
        var attrs = [NSAttributedString.Key: Any]()
        attrs[.font] = font
        attrs[.foregroundColor] = color
        titleTextAttributes = attrs
    }

    /// ECSwiftLib: Make navigation bar transparent.
    ///
    /// - Parameter tint: tint color (default is .white).
    func makeTransparent(withTint tint: UIColor = .white) {
        isTranslucent = true
        backgroundColor = .clear
        barTintColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        tintColor = tint
        titleTextAttributes = [.foregroundColor: tint]
        shadowImage = UIImage()
    }

    /// ECSwiftLib: Set navigationBar background and text colors.
    ///
    /// - Parameters:
    ///   - background: background color.
    ///   - text: text color.
    func setColors(background: UIColor, text: UIColor) {
        isTranslucent = false
        backgroundColor = background
        barTintColor = background
        setBackgroundImage(UIImage(), for: .default)
        tintColor = text
        titleTextAttributes = [.foregroundColor: text]
    }
}
