//
//  ECViewController.swift
//  ECSwiftLib
//
//  Created by ElanChou on 2021/3/3.
//

import Foundation
import UIKit

// MARK: - Properties

public extension UIViewController {
    /// ECSwiftLib: Check if ViewController is onscreen and not hidden.
    var isVisible: Bool {
        return isViewLoaded && view.window != nil
    }
}

// MARK: - Methods

public extension UIViewController {
    /// ECSwiftLib: Instantiate UIViewController from storyboard.
    ///
    /// - Parameters:
    ///   - storyboard: Name of the storyboard where the UIViewController is located.
    ///   - bundle: Bundle in which storyboard is located.
    ///   - identifier: UIViewController's storyboard identifier.
    /// - Returns: Custom UIViewController instantiated from storyboard.
    class func instantiate(from storyboard: String = "Main", bundle: Bundle? = nil, identifier: String? = nil) -> Self {
        let viewControllerIdentifier = identifier ?? String(describing: self)
        let storyboard = UIStoryboard(name: storyboard, bundle: bundle)
        guard let viewController = storyboard
            .instantiateViewController(withIdentifier: viewControllerIdentifier) as? Self else {
            preconditionFailure(
                "Unable to instantiate view controller with identifier \(viewControllerIdentifier) as type \(type(of: self))")
        }
        return viewController
    }

    /// ECSwiftLib: Assign as listener to notification.
    ///
    /// - Parameters:
    ///   - name: notification name.
    ///   - selector: selector to run with notified.
    func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }

    /// ECSwiftLib: Unassign as listener to notification.
    ///
    /// - Parameter name: notification name.
    func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }

    /// ECSwiftLib: Unassign as listener from all notifications.
    func removeNotificationsObserver() {
        NotificationCenter.default.removeObserver(self)
    }

    /// ECSwiftLib: Helper method to display an alert on any UIViewController subclass. Uses UIAlertController to show an alert.
    ///
    /// - Parameters:
    ///   - title: title of the alert.
    ///   - message: message/body of the alert.
    ///   - buttonTitles: (Optional)list of button titles for the alert. Default button i.e "OK" will be shown if this parameter is nil.
    ///   - highlightedButtonIndex: (Optional) index of the button from buttonTitles that should be highlighted. If this parameter is nil no button will be highlighted.
    ///   - completion: (Optional) completion block to be invoked when any one of the buttons is tapped. It passes the index of the tapped button as an argument.
    /// - Returns: UIAlertController object (discardable).
    @discardableResult
    func showAlert(
        title: String?,
        message: String?,
        buttonTitles: [String]? = nil,
        highlightedButtonIndex: Int? = nil,
        completion: ((Int) -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        var allButtons = buttonTitles ?? [String]()
        if allButtons.count == 0 {
            allButtons.append("OK")
        }

        for index in 0..<allButtons.count {
            let buttonTitle = allButtons[index]
            let action = UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
                completion?(index)
            })
            alertController.addAction(action)
            // Check which button to highlight
            if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
                alertController.preferredAction = action
            }
        }
        present(alertController, animated: true, completion: nil)
        return alertController
    }

    /// ECSwiftLib: Helper method to add a UIViewController as a childViewController.
    ///
    /// - Parameters:
    ///   - child: the view controller to add as a child.
    ///   - containerView: the containerView for the child viewController's root view.
    func addChildViewController(_ child: UIViewController, toContainerView containerView: UIView) {
        addChildViewController(child)
        containerView.addSubview(child.view)
        child.didMove(toParentViewController: self)
    }

    /// ECSwiftLib: Helper method to remove a UIViewController from its parent.
    func removeViewAndControllerFromParentViewController() {
        guard parent != nil else { return }

        willMove(toParentViewController: nil)
        removeFromParentViewController()
        view.removeFromSuperview()
    }

    func presentPopover(
        _ popoverContent: UIViewController,
        sourcePoint: CGPoint,
        size: CGSize? = nil,
        delegate: UIPopoverPresentationControllerDelegate? = nil,
        animated: Bool = true,
        completion: (() -> Void)? = nil) {
        popoverContent.modalPresentationStyle = .popover

        if let size = size {
            popoverContent.preferredContentSize = size
        }

        if let popoverPresentationVC = popoverContent.popoverPresentationController {
            popoverPresentationVC.sourceView = view
            popoverPresentationVC.sourceRect = CGRect(origin: sourcePoint, size: .zero)
            popoverPresentationVC.delegate = delegate
        }

        present(popoverContent, animated: animated, completion: completion)
    }
}
