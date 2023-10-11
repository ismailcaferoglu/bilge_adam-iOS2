//
//  Extensions.swift
//  Bilge_Adam_iOS2
//
//  Created by İsmail Caferoğlu on 11.10.2023.
//

import UIKit
import Foundation
import SwiftUI

extension UIViewController {
    
    @available(iOS 13, *)
    private struct Preview: UIViewControllerRepresentable {
        
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            
        }
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(viewController: self)
    }
}

extension UIView {
    @available(iOS 13, *)
    private struct Preview: UIViewRepresentable {
        typealias UIViewType = UIView
        let view: UIView
        func makeUIView(context: Context) -> UIView {
            return view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
            //
        }
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        // inject self (the current UIView) for the preview
        Preview(view: self)
    }
    
    func addSubviews(_ views:UIView...) {
        views.forEach({ self.addSubview($0)})
    }
}


extension UIStackView {
    
    func addArrangedSubviews(_ views:UIView...) {
        views.forEach({ self.addArrangedSubview($0)})
    }
}
