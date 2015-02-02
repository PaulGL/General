//
//  DetailVC.h
//  TransitionZoom
//
//  Created by Empon on 26/01/2015.
//  Copyright (c) 2015 Empon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MyTransition.h"

@interface DetailVC : UIViewController <MyTransitionDelegate>

@property (nonatomic, strong) UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
