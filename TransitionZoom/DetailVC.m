//
//  DetailVC.m
//  TransitionZoom
//
//  Created by Empon on 26/01/2015.
//  Copyright (c) 2015 Empon. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()

@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView.image = _image;
    
    [self addObserver:self forKeyPath:@"imageView" options:NSKeyValueObservingOptionInitial context:nil];
    /*[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleChange:)
                                                 name:@"imgChange"
                                               object:nil];
    */
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"keyPath changed : %@", NSStringFromCGRect(_imageView.frame));
}

-(void)handleChange:(NSNotification*)notif{
    NSLog(@"change img : %@", NSStringFromCGRect(_imageView.frame));
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)sharedView{
    NSLog(@"sharedView : %@", NSStringFromCGRect(_imageView.frame));
    return _imageView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
