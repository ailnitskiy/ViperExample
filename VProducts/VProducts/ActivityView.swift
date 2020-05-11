//
//  ActivityView.swift
//  VProducts
//
//  Created by Andrii Ilnitskyi on 01.04.2020.
//  Copyright © 2020 Andrii Ilnitskyi. All rights reserved.
//

import Foundation
import UIKit

class ActivityView: UIView {
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(rgb: 0xffffff).withAlphaComponent(0.0)
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 80, height: 80)
        loadingView.center = center
        loadingView.backgroundColor = UIColor(rgb: 0x000000).withAlphaComponent(0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0);
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        activityIndicator.startAnimating()
        
        loadingView.addSubview(activityIndicator)
        addSubview(loadingView)
    }
    
    static func show(on view: UIView) {
        if view.subviews.filter({ $0 is ActivityView }).isEmpty {
            view.addSubview(ActivityView(frame: view.bounds))
        }
    }
    
    static func hide(on view: UIView) {
        view.subviews.filter({ $0 is ActivityView }).forEach({$0.removeFromSuperview()})
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
