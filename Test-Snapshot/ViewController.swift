//
//  ViewController.swift
//  Test-Snapshot
//
//  Created by Mohammed Shahid on 29/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    let button = PrimaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.setTitle("Sample Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

class PrimaryButton: UIButton {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    
        setBackgroundColor(.blue,for: .normal)
        setBackgroundColor(.blue,for: .highlighted)
        setBackgroundColor(.blue,for: .disabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

public extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}


public extension UIButton {
    func backgroundColorImage(for color: UIColor) -> UIImage {
        let image: UIImage = UIImage.from(color: color)
        let stretchableImage = image.resizableImage(withCapInsets: UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        return stretchableImage
    }

    func setBackgroundColor(_ color: UIColor?, for state: UIControl.State) {
        if let backgroundColor = color {
            setBackgroundImage(backgroundColorImage(for: backgroundColor), for: state)
        } else {
            setBackgroundImage(nil, for: state)
        }
    }
}
