//
//  TransitionManager.h
//  iosanima
//
//  Created by Larry Kang on 9/12/14.
//  Copyright (c) 2014 Larry Kang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransitionManager : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL transitioningTo;

@end
