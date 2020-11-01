# 👉 SwipeSelectorKit - Hackathon Starter Project

<img src="assets/2020_10_15_SwipeSelectorUIDemo.gif" alt="Swipe Selector Kit Demo" width="500"/>

> TL;DR Swipe Right, Swipe Left - That's it.  Have a hackthon idea? Fork this and build something cool!

This project was inspired by a few hackathon designs I've seen this year while mentoring for [Cal Hacks](https://calhacks.io/).  This swipeable UI is a popular design pattern to accept/reject a list of items.

## Interactions
* **Swipe Right** - *accept*
* **Swipe Left** - *reject*

## Getting Started

1. ✅ Fork the Project
2. ✅ Build + Run 
3. ✅ Swipe!

## Try it Yourself

```swift
class SwipeSelectorViewController: UIViewController, SwipeSelectorDelegate {
    
    var swipeSelectorView = SwipeSelectorView()
    
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
      // DataSource ...
    }
    
    func swipeSelectorViewItemForOverflow(_ swipeSelectorView: SwipeSelectorView) -> SwipeSelectorModel {
      // DataSource ...
    }
    
    func swipeSelectorView(_ swipeSelectorView: SwipeSelectorView, itemForRowAtIndex: Int) -> SwipeSelectorModel {
      // Configure Cards ...
    }
    
    func swipeSelectorViewDidSwipe(_ swipeSelectorView: SwipeSelectorView, itemAtIndex: Int, isRightSwipe: Bool) {
      // Handle Swipes ...
    }
    
    func swipeSelectorViewDidTap(_ swipeSelectorView: SwipeSelectorView, itemAtIndex: Int) {
      // Handle Tapping Specific Cards
    }
}


```

## Help Improve This Project!

* **Dependency Management** using [Swift Package Manager](https://swift.org/package-manager/), [Carthage](https://github.com/Carthage/Carthage), or [CocoaPods](https://cocoapods.org/)
* **Add Generic UIView Handling** - Cards need to be more flexible for developers to input custom views.
* **Add Documentation** - for publc classes/methods.  See [Swift Documentation](https://nshipster.com/swift-documentation/)

## Prerequisites

* Xcode 12.0+

## Authors

* **Alex Takahashi** - *Initial work* - [alextakahashi](https://github.com/alextakahashi)

## Acknowledgments

* [README-Template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)

## Liability
I am not a lawyer, but **no guarantees if this breaks, totally not responsible if things go to shit - don't sue me**, kthx.  Add *MIT License*.
