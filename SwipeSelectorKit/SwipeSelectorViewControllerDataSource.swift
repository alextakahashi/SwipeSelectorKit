//
//  SwipeSelectorViewControllerDataSource.swift
//  SwipeSelectorKit
//
//  Created by Alex Takahashi on 10/15/20.
//

import Foundation
import UIKit

public struct SwipeSelectorViewControllerDataSource {
    
    public let items: [SwipeSelectorModel] = [
        SwipeSelectorModel(title: "Rhino", subtitle: "Enjoying life as a dog", image: UIImage(named: "RhinoStreet")),
        SwipeSelectorModel(title: "Poppy", subtitle: "Needs coffee", image: UIImage(named: "PoppyCoffee")),
        SwipeSelectorModel(title: "NiuNiu", subtitle: "Resident supermodel", image: UIImage(named: "NiuNiuCouch")),
        SwipeSelectorModel(title: "Poppy", subtitle: "Actually candid", image: UIImage(named: "PoppyStreet")),
        SwipeSelectorModel(title: "Rhino", subtitle: "Bad hair day", image: UIImage(named: "RhinoHair")),
        SwipeSelectorModel(title: "Rhino", subtitle: "Anger mode", image: UIImage(named: "RhinoCar")),
    ]
    
    public let overflowItem: SwipeSelectorModel = SwipeSelectorModel(title: "Thanks ✌️", subtitle: "Enjoy the dog pics", image: UIImage(named: "Naptime"))
    
}
