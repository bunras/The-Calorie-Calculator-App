//
//  theCheckbox.swift
//  calorieCalculator
//
//  Created by Cole Rasmussen on 7/23/22.
//

import UIKit

final class theCheckbox: UIView {
    var isChecked = false
    public var checkSender = false;
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.secondaryLabel.cgColor
        layer.cornerRadius = frame.size.width / 2.0
        backgroundColor = .systemBackground
    }
    required init?(coder: NSCoder)
    {
        fatalError()
    }
    
    func toggle()
    {
        self.isChecked = !isChecked
        if self.isChecked
        {
            backgroundColor = .systemBlue
            checkSender = true
        }
        else
        {
            backgroundColor = .systemBackground
        }
    }
}
