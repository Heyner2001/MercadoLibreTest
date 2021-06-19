//
//  AppExtensions.swift
//  MercadoLibreTest
//
//  Created by Heyner Rodriguez on 16/06/21.
//

import UIKit

enum FontSize: CGFloat {
    case mini, small, normal, large, xLarge, xxLarge, xxxLarge, huge, giant
    
    var value: CGFloat {
        switch self {
        case .mini:
            // 10 (pixels) // width: 375
            return 10
        case .small:
            // 12 (pixels) // width: 375
            return 12
        case .normal:
            // 14 (pixels) // width: 375
            return 14
        case .large:
            // 16 (pixels) // width: 375
            return 16
        case .xLarge:
            // 18 (pixels) // width: 375
            return 18
        case .xxLarge:
            // 20 (pixels) // width: 375
            return 20
        case .xxxLarge:
            // 28 (pixels) // width: 375
            return 28
        case .huge:
            // 32 (pixels) // width: 375
            return 32
        case .giant:
            // 48 (pixels) // width: 375
            return 48
        }
    }
}

enum FontWeight: String {
    
    case bold = "AppleSDGothicNeo-Bold"
    case semiBold = "AppleSDGothicNeo-SemiBold"
    case medium = "AppleSDGothicNeo-Medium"
    case regular = "AppleSDGothicNeo-Regular"
}


extension UIFont {
    class func setFont(_ weight: FontWeight, _ size: FontSize) -> UIFont {
        return UIFont(name: weight.rawValue, size: size.value)!
    }
}

extension UIApplication {
    static var sharedKeyWindow: UIWindow {
        return UIApplication.shared.connectedScenes.map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.first ?? UIWindow()
    }
    
    static var statusBarHeight: CGFloat {
        return sharedKeyWindow.windowScene?.statusBarManager?.statusBarFrame.height ?? .zero
    }
    
    static var bottomSafeInset: CGFloat {
        return sharedKeyWindow.safeAreaInsets.bottom
    }
    
    static let navBarHeight: CGFloat = statusBarHeight + 60
}

extension Int {
    
    func format(_ form: String) -> String {
        return String(format: "%\(form)f", self)
    }
    
    func currencyFormat() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.roundingMode = .halfUp
        formatter.locale = Locale(identifier: "es_CO")
        
        guard let str = formatter.string(from: NSNumber(value: self)) else {
            return self.format(".2")
        }
        return str
    }
}

extension String {
    func priceWithFormat(currenciId: String) -> String {
        guard let symbol = countryData?.currencies.filter({ $0.id == currenciId }).first else { return "" }
        return symbol.symbol + " " + self
    }
}

extension UIViewController {
    func getTopMostViewController() -> UIViewController? {
        return globalNavigationController?.topViewController
    }
}
