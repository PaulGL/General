//
//  MyTransition.m
//  TransitionZoom
//
//  Created by Empon on 25/01/2015.
//  Copyright (c) 2015 Empon. All rights reserved.
//

#import "MyTransition.h"

@implementation MyTransition

-(id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return self;
}


-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController<MyTransitionDelegate> *fromVC = (UIViewController<MyTransitionDelegate> *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<MyTransitionDelegate> *toVC = (UIViewController<MyTransitionDelegate> *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView* fromView = [fromVC sharedView];
    UIView* toView = [toVC sharedView];
    
    UIView*containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    BOOL reversed = false;
    //snapshot fromView (the image square)
    UIView* snapshotView = [fromView snapshotViewAfterScreenUpdates:NO];
    snapshotView.frame = [containerView convertRect:fromView.frame fromView:fromView.superview];
    fromView.hidden = YES;
    
    //setup view state
    toVC.view.frame = [transitionContext finalFrameForViewController:toVC];
    
    if ( !reversed ) {
        toVC.view.alpha = 0;
        toView.hidden = YES;
        [containerView addSubview:toVC.view];
    }
    else {
        [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    }
    [containerView addSubview:snapshotView];
    
    NSLog(@"snapshotView.frame : %@", NSStringFromCGRect(snapshotView.frame));
    CGRect addOffsetFrame = toView.frame;
    //addOffsetFrame.origin.y += 74;
    toView.frame = addOffsetFrame;
    NSLog(@"----> toView.frame : %@", NSStringFromCGRect(toView.frame));
    //NSLog(@"center : %@", NSStringFromCGPoint(snapshotView.center));

    [UIView animateWithDuration:duration animations:^{
        if (!reversed){
            toVC.view.alpha = 1.0;
        }
        else {
            fromVC.view.alpha = 0.0;
        }
        //move snapshot
        snapshotView.frame = [containerView convertRect:toView.frame fromView:toView.superview];
    } completion:^(BOOL finished){
        //clean up
        NSLog(@"final snapshotView.frame : %@", NSStringFromCGRect(snapshotView.frame));
        toView.hidden = NO;
        fromView.hidden = NO;
        [snapshotView removeFromSuperview];
        
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.3;
}


@end
