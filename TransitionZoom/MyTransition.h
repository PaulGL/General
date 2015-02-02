//
//  MyTransition.h
//  TransitionZoom
//
//  Created by Empon on 25/01/2015.
//  Copyright (c) 2015 Empon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MyTransitionDelegate <NSObject>

-(UIView*)sharedView;

@end

@interface MyTransition : NSObject <UINavigationControllerDelegate, UIViewControllerAnimatedTransitioning>

@end
