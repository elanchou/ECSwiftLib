//
//  ECMacros.swift
//  ECSwiftLib
//
//  Created by ElanChou on 2021/3/3.
//

import Foundation
import UIKit

// MARK: Useful Macros

public let ECAppBundleInfoVersion = Bundle.main.infoDictionary ?? Dictionary()
public let ECAppBundleVersion = (ECAppBundleInfoVersion["CFBundleShortVersionString" as String] as? String ) ?? ""
public let ECAppBundleBuild = (ECAppBundleInfoVersion["CFBundleVersion"] as? String ) ?? ""
public let ECAppDisplayName = (ECAppBundleInfoVersion["CFBundleDisplayName"] as? String ) ?? ""

// MARK: System
public let ECSystemVersion = Double(UIDevice.current.systemVersion)

// MARK: Screen
public let ECScreenHeight = UIScreen.main.bounds.size.height
public let ECScreenWidth = UIScreen.main.bounds.size.width
public let ECStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
public let ECNavBarHeight_StatusHeight: ((UIViewController)-> CGFloat) = {(vc : UIViewController ) -> CGFloat in
    weak var weakVC = vc;
    var navHeight = weakVC?.navigationController?.navigationBar.bounds.size.height ?? 0.0
    return (navHeight + ECStatusBarHeight)
}
