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


// MARK: ============================================================================
// MARK: 设置颜色
/// 设置颜色值
public let HexRGB:((Int) -> UIColor) = { (rgbValue : Int) -> UIColor in
    return HexRGBAlpha(rgbValue,1.0)
}

/// 通过 十六进制与alpha来设置颜色值  （ 样式： 0xff00ff ）
public let HexRGBAlpha:((Int,Float) -> UIColor) = { (rgbValue : Int, alpha : Float) -> UIColor in
    return UIColor(red: CGFloat(CGFloat((rgbValue & 0xFF0000) >> 16)/255), green: CGFloat(CGFloat((rgbValue & 0xFF00) >> 8)/255), blue: CGFloat(CGFloat(rgbValue & 0xFF)/255), alpha: CGFloat(alpha))
}


/// 通过 red 、 green 、blue 、alpha 颜色数值
public let RGBAlpa:((Float,Float,Float,Float) -> UIColor ) = { (r: Float, g: Float , b: Float , a: Float ) -> UIColor in
    return UIColor.init(red: CGFloat(CGFloat(r)/255.0), green: CGFloat(CGFloat(g)/255.0), blue: CGFloat(CGFloat(b)/255.0), alpha: CGFloat(a))
}
