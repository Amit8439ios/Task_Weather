//
//  Spinner.swift
//  Weather_Assignment
//
//  Created by Amit on 14/10/23.
//

import Foundation
import UIKit

open class Spinner {
    internal static var spinner: UIActivityIndicatorView?
    public static var style: UIActivityIndicatorView.Style = UIActivityIndicatorView.Style.large
    public static var baseBackColor = UIColor(white: 0, alpha: 0.2)
    public static var baseColor = UIColor.green
    public static func start(style: UIActivityIndicatorView.Style = style, backColor: UIColor = baseBackColor, baseColor: UIColor = baseColor) {
        if spinner == nil, let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            spinner = UIActivityIndicatorView(frame: frame)
            spinner!.backgroundColor = backColor
            spinner!.style = style
            spinner?.color = baseColor
            window.addSubview(spinner!)
            spinner!.startAnimating()
        }
    }
    
    public static func stop() {
        if spinner != nil {
            DispatchQueue.main.async {
            spinner?.stopAnimating()
            spinner?.removeFromSuperview()
            spinner = nil
            }
        }
    }
    
   
}
