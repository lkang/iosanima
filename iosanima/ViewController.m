//
//  ViewController.m
//  iosanima
//
//  Created by Larry Kang on 9/11/14.
//  Copyright (c) 2014 Larry Kang. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "TransitionManager.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *yetiImage;
@property (nonatomic, strong) UIViewController *nextView;
@property (nonatomic, strong) TransitionManager *transitionManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
  NSInteger viewWidth = self.view.frame.size.width;
  NSInteger viewHeight = self.view.frame.size.height;
  
//  UIImage *image = [UIImage imageNamed:@"yeti-image"];
//  
//  self.yetiImage = [[UIImageView alloc] initWithImage:image];
//  NSInteger imageWidth = self.yetiImage.frame.size.width;
//  NSInteger imageHeight = self.yetiImage.frame.size.height;
//  
//  self.yetiImage.frame = CGRectMake((viewWidth-imageWidth)/2, (viewHeight-imageHeight)/2,
//                                    imageWidth, imageHeight);
//  
//  [self.view addSubview:self.yetiImage];

//try a block animation here
//  [UIView animateWithDuration:5.0
//                        delay:1.0
//                      options:nil//UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse
//                   animations:^{
//                      CGRect rect = self.yetiImage.frame;
//                     self.yetiImage.frame = CGRectMake(0, 0, rect.size.width, rect.size.height);
//                     float angle = M_PI;
//                     self.yetiImage.transform = CGAffineTransformMakeRotation(angle);
//                   }
//                   completion:^(BOOL finished) {
//                     NSLog(@"all done");
//                   }];
  
//  [UIView animateWithDuration:5000.0
//                        delay:1.0
//       usingSpringWithDamping:0.0001
//        initialSpringVelocity:0.002
//                      options:UIViewAnimationOptionCurveEaseInOut
//                   animations:^{
//                     CGRect rect = self.yetiImage.frame;
//                     self.yetiImage.frame = CGRectMake(rect.origin.x/2, rect.origin.y/2,
//                                                       rect.size.width, rect.size.height);
//                     float angle = M_PI;
//                     self.yetiImage.transform = CGAffineTransformMakeRotation(angle);
//                   }
//                   completion:^(BOOL finished) {
//                     NSLog(@"all done");
//                     
//                   }];
//  CALayer *mylayer = [self.view layer];
//  
//  CAAnimation *myAnimation = [CAAnimation ]
//  
//  [mylayer addAnimation:<#(CAAnimation *)#> forKey:<#(NSString *)#>]
  
  UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100,
                                                               150, 30)];
  button.backgroundColor = [UIColor blueColor];
  [button setTitle:@"touch this" forState:UIControlStateNormal];
  [button addTarget:self action:@selector(presentNextView) forControlEvents:UIControlEventTouchDown];
  [self.view addSubview:button];
}

- (void)presentNextView
{
  self.nextView = [[NextViewController alloc] init];
  self.nextView.transitioningDelegate = self;
//  self.nextView.modalp
  self.transitionManager = [[TransitionManager alloc] init];
  [self presentViewController:self.nextView animated:YES completion:nil];
//  [self presentViewController:self.nextView animated:YES completion:nil];
//  [UIView transitionFromView:self.view
//                      toView:self.nextView.view
//                    duration:0.8
////                     options:UIViewAnimationOptionTransitionFlipFromLeft
////                     options:UIViewAnimationOptionTransitionCurlDown
////                     options:UIViewAnimationOptionTransitionCrossDissolve
//                     options:UIViewAnimationOptionTransitionFlipFromTop
//                  completion:^(BOOL finished) {
//                    self.view.hidden = YES;
//                  }];
  
  
//  [UIView animateWithDuration:0.4 animations:^{
//    self.view.transform = CGAffineTransformMake(0, 0, 0, 1, 0, 0); //fromView disappear with flip 90º
//	} completion:^(BOOL finished) {
//		[UIView animateWithDuration:0.4 animations:^{
//			self.nextView.view.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0); //toView appear with flip 90º
//    } completion:^(BOOL finished) {
//      self.view.hidden = YES;
//		}];
//  }];
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
  self.transitionManager.transitioningTo = true;
  return self.transitionManager;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
  self.transitionManager.transitioningTo = false;
  return self.transitionManager;
}




@end
