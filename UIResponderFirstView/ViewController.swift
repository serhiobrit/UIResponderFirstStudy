//
//  ViewController.swift
//  UIResponderFirstView
//
//  Created by Serhio Brit on 29.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let responsiveLabel = ResponsiveView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //обязательные параметры
        responsiveLabel.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        responsiveLabel.center = self.view.center
        
        //необязательные параметры
        responsiveLabel.backgroundColor = UIColor(red: 1.0/255.0, green: 121.0/255.0, blue: 190.0/255.0, alpha: 1.0)
        responsiveLabel.text = "Responsive Label"
        responsiveLabel.layer.cornerRadius = 4
        responsiveLabel.layer.masksToBounds = true
        
        //добавляем View на главный экран
        self.view.addSubview(responsiveLabel)
        
        responsiveLabel.isUserInteractionEnabled = true
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        longPressRecognizer.minimumPressDuration = 0.2
        
        responsiveLabel.addGestureRecognizer(longPressRecognizer)
        
    }
    
    @objc func longPressHandler() {
        responsiveLabel.becomeFirstResponder()
        
        let menu = UIMenuController()
        menu.arrowDirection = .default
        menu.setTargetRect(responsiveLabel.frame, in: self.view)
        menu.setMenuVisible(true, animated: true)
        
        let saveMenuItem = UIMenuItem(title: "Save", action: #selector(saveClicked))
        menu.menuItems = [saveMenuItem]
    }
    
    @objc func saveClicked() {
        responsiveLabel.resignFirstResponder()
        print("Saved")
    }
    
}
