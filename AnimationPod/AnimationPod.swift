//
//  AnimationPod.swift
//  AnimationPod
//
//  Created by cedcoss on 13/04/21.
//

import Foundation
import UIKit
import ShimmerSwift

public class AnimationPod : UIViewController {
    
    public func performAnimation(with animate: Animations , viewToAnimate : UIView) {
        switch animate {
        case .EaseIn :
            viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn , animations:  {
                viewToAnimate.transform = .identity
            },  completion:nil)
            
        case .CurveEaseOut :
            UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
                viewToAnimate.bounds = CGRect(x: viewToAnimate.bounds.origin.x + 50, y: viewToAnimate.bounds.origin.y, width: viewToAnimate.bounds.width + 50, height: viewToAnimate.bounds.height)
            }) {(success) in
                if success {
                  //  viewToAnimate.bounds = viewToAnimate.bounds
                }
            }
            
        case .FlipFromTop :
            UIView.transition(with: view, duration: 2.0, options: .transitionFlipFromTop, animations: {
               
            }, completion: nil)
            
        case .FlipFromLeft :
            UIView.transition(with: view, duration: 2.0, options: .transitionFlipFromLeft, animations: {
               
            }, completion: nil)
            
        case .FlipFromBottom :
            UIView.transition(with: view, duration: 2.0, options: .transitionFlipFromBottom, animations: {
               
            }, completion: nil)
            
        case .FlipFromRight :
            UIView.transition(with: view, duration: 2.0, options: .transitionFlipFromBottom, animations: {
               
            }, completion: nil)
            
            
        case .AutoReverse:
            viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .autoreverse , animations:  {
                viewToAnimate.transform = .identity
            },  completion:nil)
            
            
        case .Repeat :
            viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.0, options: UIView.AnimationOptions.repeat , animations:  {
                viewToAnimate.transform = .identity
            },  completion:nil)
            
            
        case .MoveToRight :
                UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut , animations:  {
                    
                    viewToAnimate.center.x +=  300
                },  completion:nil)
            
        case .MoveToLeft :
            viewToAnimate.frame = CGRect(x: view.frame.width , y: 0, width: view.frame.width / 3, height: view.frame.height / 3)
            UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut , animations:  {

                
                viewToAnimate.center.x -=  300
            },  completion:nil)
            
            
        case .MoveUpwards :
            viewToAnimate.frame = CGRect(x: 0 , y: viewToAnimate.frame.height, width: view.frame.width / 3, height: view.frame.height / 3)
            UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut , animations:  {
                
                viewToAnimate.center.y -=  300
            },  completion:nil)
            
        case .MoveDownwards :
            UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut , animations:  {

                viewToAnimate.center.y +=  300
            },  completion:nil)
            
        case .FadeIn :
            viewToAnimate.alpha = 0
            UIView.animate(withDuration: 0.5, animations:  {
                viewToAnimate.alpha = 1.0
            }, completion: nil)
            
        case .FadeOut :
            viewToAnimate.alpha = 1.0
            UIView.animate(withDuration: 0.5, animations:  {
                viewToAnimate.alpha = 0.0
            }, completion: nil)
            
        case .RevealFromLeft :
            let transition = CATransition()
            transition.type = .reveal
            transition.subtype = .fromLeft
            transition.duration = 2.0
            viewToAnimate.layer.add(transition, forKey: nil)
            
        case .Shimmer :
            let shimmerView = ShimmeringView(frame: self.view.bounds)
            view.addSubview(shimmerView)
            shimmerView.contentView = viewToAnimate
            shimmerView.isShimmering = true
        
        
        case .AutoReverseOnLoop :
            viewToAnimate.transform = CGAffineTransform(scaleX: 0, y: 0)
            UIView.animate(withDuration: 0.5, delay: 0.0, options:  [.autoreverse, .repeat] , animations:  {
                viewToAnimate.transform = .identity
            },  completion:nil)
            
        case .MoveForwardAndBackward :
            UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseOut ], animations: {
                viewToAnimate.center.x +=  self.view.frame.width
            }) { (success) in
                UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseOut ], animations: {
                    viewToAnimate.center.x -=  self.view.frame.width
                }, completion: nil)
            }
            
        case .MoveForwardRepeatedly :
            UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseOut , .repeat], animations: {
                viewToAnimate.center.x +=  self.view.frame.width
            }, completion: nil)
            
            
        case .MoveBackwardRepeatedly :
            UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveEaseOut , .repeat], animations: {
                viewToAnimate.center.x -=  300
            }, completion: nil)
            
            
        case .Focus :
            UIView.animate(withDuration: 1, animations: {
                viewToAnimate.frame.origin.x += 50
                viewToAnimate.frame.origin.y += 50
            } , completion : nil )
            
        case .Expand :
            UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
                viewToAnimate.frame = CGRect(x: viewToAnimate.center.x + 50, y: viewToAnimate.center.y + 50, width: viewToAnimate.bounds.width + 100, height: viewToAnimate.bounds.height + 100)
            }, completion: nil)
            
        case .Disappear :
            UIView.animate(withDuration: 2.0, delay: 0.0, options: UIView.AnimationOptions.allowAnimatedContent, animations: {
                viewToAnimate.frame = CGRect(x: 0, y: 0, width: 0 , height: 0)
            }, completion: nil)
            
        case .MoveIn :
            let transition = CATransition()
            transition.type = .moveIn
            transition.subtype = .fromLeft
            transition.duration = 2.0
            viewToAnimate.layer.add(transition, forKey: nil)
            
            
        case .FadeInOut :
            UIView.animate(withDuration: 2.0,animations: {
                viewToAnimate.alpha = 0.0
            }) { (success) in
                if success {
                    UIView.animate(withDuration: 2.0, animations: {
                       viewToAnimate.alpha = 1.0
                    }, completion: nil)
                }
            }
            
            
        case .FadeInOutOnLoop :
            UIView.animate(withDuration: 2.0,delay:  0.0 ,options : .repeat ,  animations: {
                viewToAnimate.alpha = 0.0
            }) { (success) in
                if success {
                    UIView.animate(withDuration: 2.0,delay:  0.0 ,options : .repeat, animations: {
                        viewToAnimate.alpha = 1.0
                    }, completion: nil)
                }
            }
            
            
        case .Rotate :
            let animation = CABasicAnimation(keyPath: #keyPath(CALayer.transform))
            animation.fillMode = .forwards
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.duration = 5
            animation.fromValue = view.layer.transform
            animation.toValue = CATransform3DMakeRotation(.pi, 0, 0, 1)
            viewToAnimate.layer.add(animation, forKey: "rotate")
            
        case .MoveInOut :
            let animation = CABasicAnimation(keyPath: "position.x")
            animation.fromValue = CGPoint.zero
            animation.toValue = view.bounds.size.width
            animation.duration = 0.5
            animation.beginTime = CACurrentMediaTime() + 0.3
            animation.repeatCount = .infinity
            animation.autoreverses = true

            viewToAnimate.layer.add(animation, forKey: nil)
            
        case .Pulse :
            let pulse = CASpringAnimation(keyPath: "transform.scale")
            pulse.duration = 0.4
            pulse.fromValue = 0.98
            pulse.toValue = 1.0
            pulse.autoreverses = true
            pulse.repeatCount = 1
            pulse.initialVelocity = 0.5
            pulse.damping = 1.0
            viewToAnimate.layer.add(pulse, forKey: nil)
            
        case .Flash :
            let flash = CABasicAnimation(keyPath: "opacity")
            flash.duration = 0.3
            flash.fromValue = 1
            flash.toValue = 0.1
            flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            flash.autoreverses = true
            flash.repeatCount = 2
            viewToAnimate.layer.add(flash, forKey: nil)
            
            
        case .StretchBack :
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)

                  UIView.animate(withDuration: 2.0,
                                             delay: 0,
                                             usingSpringWithDamping: CGFloat(0.20),
                                             initialSpringVelocity: CGFloat(6.0),
                                             options: UIView.AnimationOptions.allowUserInteraction,
                                             animations: {
                                              viewToAnimate.transform = CGAffineTransform.identity
                      },
                                             completion: { Void in()  }
                  )
            
            
            
        case .Reappear :
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
            UIView.animate(withDuration: 2.0, delay: 0.0, options: [.curveLinear], animations: { () -> Void in
                    viewToAnimate.transform = .identity
                    }) { (animationCompleted: Bool) -> Void in
                
        }
            
            
         
        case .Bounce :
            viewToAnimate.transform = CGAffineTransform(scaleX: -1, y: 1)

              UIView.animate(withDuration: 0.5, animations: { () -> Void in

                  viewToAnimate.transform = CGAffineTransform(scaleX: 1,y: 1)

              })
        
        
       
       
       
        }
    
    }
    
    
    public func performAnimationOnCells(with animate : AnimatingCells,tableView : UITableView,cell : UITableViewCell , indexPath : IndexPath , rowHeight : CGFloat) {
        switch animate {
        case .MakeFade :
            cell.alpha = 0

            UIView.animate(
                withDuration: 2.0,
                delay: 0.05 * Double(indexPath.row),
                animations: {
                    cell.alpha = 1
            })
            
        case .MakeSlideIn :
            cell.transform = CGAffineTransform(translationX: tableView.bounds.width, y: 0)

            UIView.animate(
                withDuration: 2.0,
                delay: 0.05 * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })
            
        case .MoveUpWithFade :
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight / 2)
            cell.alpha = 0

            UIView.animate(
                withDuration: 2.0,
                delay: 0.05 * Double(indexPath.row),
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
                    cell.alpha = 1
            })
            
        case .MoveUpWithBounce :
            cell.transform = CGAffineTransform(translationX: 0, y: rowHeight)

            UIView.animate(
                withDuration: 2.0,
                delay: 0.05 * Double(indexPath.row),
                usingSpringWithDamping: 0.4,
                initialSpringVelocity: 0.1,
                options: [.curveEaseInOut],
                animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0)
            })

       
        }
    }
    
        
}


public enum Animations {
    case EaseIn
    case CurveEaseOut
    case FlipFromTop
    case FlipFromLeft
    case FlipFromBottom
    case FlipFromRight
    case AutoReverse
    case Repeat
    case MoveToRight
    case MoveToLeft
    case MoveUpwards
    case MoveDownwards
    case FadeIn
    case FadeOut
    case RevealFromLeft
    case Shimmer
    case AutoReverseOnLoop
    case MoveForwardAndBackward
    case MoveForwardRepeatedly
    case MoveBackwardRepeatedly
    case Focus
    case Expand
    case Disappear
    case MoveIn
    case FadeInOut
    case FadeInOutOnLoop
    case Rotate
    case MoveInOut
    case Pulse
    case Flash
    case Reappear
    case StretchBack
    case Bounce
    
}



public enum AnimatingCells {
    case MakeSlideIn
    case MoveUpWithFade
    case MoveUpWithBounce
    case MakeFade
}
