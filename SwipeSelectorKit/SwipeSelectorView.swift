//
//  SwipeSelectorView.swift
//  SwipeSelectorKit
//
//  Created by Alex Takahashi on 10/11/20.
//

import Foundation
import UIKit

private enum SwipeSelectorDirectionType: Int {
    case right = 1
    case left = -1
}

class SwipeSelectorView: UIView {
    
    private weak var delegate: SwipeSelectorDelegate?
    
    // MARK: Card Indexes Vars
    
    private var activeCardIndex: Int = 0
    private var hiddenCardIndex: Int {
        get {
            return activeCardIndex + 1
        }
    }
    private var hasShownLastCard: Bool {
        get {
            guard let delegate = delegate else { return false }
            return activeCardIndex >= delegate.swipeSelectorViewNumberOfItems(self)
        }
    }
    
    // MARK: Cards Vars
    
    private let firstCard = SwipeSelectorCardView()
    private let secondCard = SwipeSelectorCardView()
    private lazy var cardFrame = CGRect(x: 0, y: self.safeAreaInsets.top, width: self.bounds.width, height: self.bounds.height)
    private var showFirstCard = true
    
    // MARK: Animation Vars
    
    private let duration = 0.25
    private var initialPoint = CGPoint()
    private let panGestureRecognizer = UIPanGestureRecognizer()
    
    // MARK: View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(delegate: SwipeSelectorDelegate ) {
        self.init(frame: .zero)
        self.addSubview(secondCard)
        self.addSubview(firstCard)
        panGestureRecognizer.addTarget(self, action: #selector(handlePan))
        firstCard.addGestureRecognizer(panGestureRecognizer)
        self.delegate = delegate
        guard delegate.swipeSelectorViewNumberOfItems(self) >= 2 else { return }
        firstCard.configureViewModel(delegate.swipeSelectorView(self, itemForRowAtIndex: 0))
        secondCard.configureViewModel(delegate.swipeSelectorView(self, itemForRowAtIndex: 1))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        firstCard.frame = cardFrame
        secondCard.frame = cardFrame
    }
    
    // MARK: Private
    
    @objc private func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self)
        guard let viewToDrag = sender.view else { return }
        switch sender.state {
        case .began:
            initialPoint = viewToDrag.center
            return
        case .changed:
            viewToDrag.center = CGPoint(x: viewToDrag.center.x + translation.x,
                y: viewToDrag.center.y + translation.y)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewToDrag)
            return
        default:
            break
        }
        let deltaX: CGFloat = viewToDrag.center.x - initialPoint.x
        let direction: SwipeSelectorDirectionType = deltaX > 0 ? .right : .left
        let percentageXChange: CGFloat = abs(deltaX / self.bounds.width)
        let threshold: CGFloat = 0.5
        let isSwipe = percentageXChange > threshold
        if (isSwipe) {
            UIView.animate(withDuration: self.duration * 2) {
                if (self.hasShownLastCard) {
                    self.animateToInitialPointWithView(viewToDrag)
                } else {
                    viewToDrag.center = CGPoint(x: self.initialPoint.x + CGFloat(direction.rawValue) * self.bounds.width * 2, y: self.initialPoint.y)
                }
            } completion: { [weak self] (success) in
                guard let strongSelf = self else { return }
                guard !strongSelf.hasShownLastCard else { return }
                strongSelf.delegate?.swipeSelectorViewDidSwipe(strongSelf, itemAtIndex: strongSelf.activeCardIndex, isRightSwipe: direction == .right)
                strongSelf.activeCard().frame = strongSelf.cardFrame
                strongSelf.swapCards()
            }
        } else {
            UIView.animate(withDuration: self.duration) {
                self.animateToInitialPointWithView(viewToDrag)
            }
        }
    }
    
    private func animateToInitialPointWithView(_ view: UIView) {
        view.center = self.initialPoint
    }
    
    private func swapCards() {
        activeCard().removeGestureRecognizer(panGestureRecognizer)
        activeCardIndex += 1
        guard let delegate = delegate else { return }
        let shouldConfigureNextCard = hiddenCardIndex < delegate.swipeSelectorViewNumberOfItems(self)
        if (shouldConfigureNextCard) {
            activeCard().configureViewModel(delegate.swipeSelectorView(self, itemForRowAtIndex: hiddenCardIndex))
        } else {
            if (hasShownLastCard) {
                let placeholderBlankCard = SwipeSelectorModel(title: "", subtitle: "", image: nil)
                activeCard().configureViewModel(placeholderBlankCard)
            } else {
                let endOfListModel = delegate.swipeSelectorViewItemForOverflow(self)
                activeCard().configureViewModel(endOfListModel)
            }
        }
        showFirstCard = !showFirstCard
        bringSubviewToFront(activeCard())
        activeCard().addGestureRecognizer(panGestureRecognizer)
    }
    
    private func activeCard() -> SwipeSelectorCardView {
        return showFirstCard ? firstCard : secondCard
    }
    
}
