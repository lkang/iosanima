//
//  TransitionManager.m
//  iosanima
//
//  Created by Larry Kang on 9/12/14.
//  Copyright (c) 2014 Larry Kang. All rights reserved.
//

#import "TransitionManager.h"

@implementation TransitionManager

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
//  [self rotationAnimateTransition:transitionContext];
  
  [self growingYetiAnimateTransition:transitionContext];
}

- (void)growingYetiAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
  UIView *container = [transitionContext containerView];
  
  UIImageView *yetiImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"yeti-image"]];

  UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  
//  CGRect oldFrame = yetiImage.frame;
  yetiImage.frame = CGRectMake(toVc.view.center.x, toVc.view.center.y,
                               yetiImage.frame.size.width/15, yetiImage.frame.size.height/15);
  
  [container addSubview:toVc.view];
  [container addSubview:fromVc.view];
  [container addSubview:yetiImage];

  [UIView animateWithDuration:1.0
                        delay:0.0
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     CGFloat magnification = 200.0;
                     yetiImage.transform = CGAffineTransformMakeScale(magnification, magnification);
                   }
                   completion:^(BOOL finished) {
                     fromVc.view.alpha = 1.0;
                     [self fadingYetiAnimateTransition:yetiImage transitionContext:transitionContext];
                   }];
  
}

- (void)fadingYetiAnimateTransition:(UIImageView *)yetiImage
                  transitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
  UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  fromVc.view.alpha = 0.0;

  [UIView animateWithDuration:0.5
                        delay:0.0
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     yetiImage.alpha = 0.0;
                   }
                   completion:^(BOOL finished) {
                     [transitionContext completeTransition:YES];
                     fromVc.view.alpha = 1.0;
                   }];
}

- (void)rotationAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
  UIView *container = [transitionContext containerView];
  
  UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
  UIViewController *toVc = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
  
  CGFloat startingAngle = M_PI/2;
  CGFloat startingScale = 1.0/0.75;
  if (self.transitioningTo) {
    startingAngle = startingAngle * -1;
    startingScale = 1/startingScale;
  }
  toVc.view.transform = CGAffineTransformMakeRotation(startingAngle);
  toVc.view.transform = CGAffineTransformScale(toVc.view.transform, startingScale, startingScale);

  [container addSubview:toVc.view];
  [container insertSubview:fromVC.view aboveSubview:toVc.view];
  

    [UIView animateWithDuration:5.0
                          delay:1.0
         usingSpringWithDamping:0.45
          initialSpringVelocity:1.1
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                       CGAffineTransform t = CGAffineTransformMakeRotation(0);
                       fromVC.view.alpha = 0.0;
                       toVc.view.transform = t;
                     } completion:^(BOOL finished) {
                       NSLog(@"transition animation TO done");
                       fromVC.view.alpha = 1.0;
                       [transitionContext completeTransition:YES];

                     }];
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
  return (NSTimeInterval)5.0;
}

@end
