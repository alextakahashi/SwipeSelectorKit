//
//  SwipeSelectorDelegate.swift
//  SwipeSelectorKit
//
//  Created by Alex Takahashi on 10/12/20.
//

import Foundation

protocol SwipeSelectorDelegate: NSObject {
    func swipeSelectorViewNumberOfItems(_ swipeSelectorView: SwipeSelectorView) -> Int
    func swipeSelectorView(_ swipeSelectorView: SwipeSelectorView, itemForRowAtIndex: Int) -> SwipeSelectorModel
    func swipeSelectorViewDidSwipe(_ swipeSelectorView: SwipeSelectorView, itemAtIndex: Int, isRightSwipe: Bool)
    func swipeSelectorViewItemForOverflow(_ swipeSelectorView: SwipeSelectorView) -> SwipeSelectorModel
}
