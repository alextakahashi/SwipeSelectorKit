//
//  SwipeSelectorModel.swift
//  SwipeSelectorKit
//
//  Created by Alex Takahashi on 10/12/20.
//

import UIKit

public struct SwipeSelectorModel {
    let title: String!
    let subtitle: String!
    var image: UIImage?
    init(title: String, subtitle: String, image: UIImage?) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
