//
//  ViewController.swift
//  SwipeSelectorKit
//
//  Created by Alex Takahashi on 10/11/20.
//

import UIKit

class SwipeSelectorViewController: UIViewController, SwipeSelectorDelegate {
    
    let dataSource = SwipeSelectorViewControllerDataSource()
    var rightSwipes: [SwipeSelectorModel] = []
    var leftSwipes: [SwipeSelectorModel] = []
    var swipeSelectorView = SwipeSelectorView()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swipeSelectorView = SwipeSelectorView(delegate: self)
        self.view.addSubview(swipeSelectorView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        swipeSelectorView.frame = self.view.frame
    }
    
    // MARK: SwipeSelectorDelegate
    
    func swipeSelectorViewNumberOfItems(_ swipeSelectorView: SwipeSelectorView) -> Int {
        return dataSource.items.count
    }
    
    func swipeSelectorViewDidSwipe(_ swipeSelectorView: SwipeSelectorView, itemAtIndex: Int, isRightSwipe: Bool) {
        let currItem = dataSource.items[itemAtIndex % dataSource.items.count]
        if (isRightSwipe) {
            rightSwipes.append(currItem)
            print("✅ Right Swipes \(rightSwipes)")
        } else {
            leftSwipes.append(currItem)
            print("🛑 Left Swipes \(leftSwipes)")
        }
    }
    
    func swipeSelectorView(_ swipeSelectorView: SwipeSelectorView, itemForRowAtIndex: Int) -> SwipeSelectorModel {
        return dataSource.items[itemForRowAtIndex % dataSource.items.count];
    }
    
    func swipeSelectorViewItemForOverflow(_ swipeSelectorView: SwipeSelectorView) -> SwipeSelectorModel {
        return dataSource.overflowItem
    }
    
    func swipeSelectorViewDidTap(_ swipeSelectorView: SwipeSelectorView, itemAtIndex: Int) {
        if (itemAtIndex < dataSource.items.count) {
            print("Item at Index: \(itemAtIndex)")
        } else {
            print("Overflow at Index: \(itemAtIndex)")
        }
    }

}

