//
//  SwipeSelectorCardView.swift
//  SwipeSelectorKit
//
//  Created by Alex Takahashi on 10/11/20.
//

import Foundation
import UIKit

class SwipeSelectorCardView: UIView {
    
    private let titleTextView = TitleTextView()
    private let subtitleTextView = SubtitleTextView()
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Source: https://stackoverflow.com/questions/51095450/how-to-apply-card-view-cornerradius-shadow-like-ios-appstore-in-swift-4
        self.layer.cornerRadius = 20.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 12.0
        self.layer.shadowOpacity = 0.7
        self.addSubview(imageView)
        self.addSubview(titleTextView)
        self.addSubview(subtitleTextView)
        self.clipsToBounds = true
        self.backgroundColor = UIColor.white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = CGRect(x: 0, y: self.safeAreaInsets.top, width: self.bounds.width, height: self.bounds.height * 2 / 3)
        imageView.contentMode = .scaleAspectFill
        let labelHeight: CGFloat = 40
        titleTextView.frame = CGRect(x: 0, y: imageView.frame.maxY, width: self.bounds.width, height: labelHeight)
        subtitleTextView.frame = CGRect(x: 0, y: titleTextView.frame.maxY, width: self.bounds.width, height: labelHeight)
    }
    
    // MARK: Public
    
    public func configureViewModel(_ model: SwipeSelectorModel) {
        imageView.image = model.image
        titleTextView.text = model.title
        subtitleTextView.text = model.subtitle
    }
}
