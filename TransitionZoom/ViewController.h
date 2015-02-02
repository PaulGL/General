//
//  ViewController.h
//  TransitionZoom
//
//  Created by Empon on 25/01/2015.
//  Copyright (c) 2015 Empon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTransition.h"

@interface ViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, MyTransitionDelegate>

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;

@end

