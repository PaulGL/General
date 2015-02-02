//
//  ViewController.m
//  TransitionZoom
//
//  Created by Empon on 25/01/2015.
//  Copyright (c) 2015 Empon. All rights reserved.
//

#import "ViewController.h"
#import "DetailVC.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *images;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = [NSMutableArray array];
    for (int i=1; i<8; i++){
        [self.images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"nature%d.jpg", i] ] ];
    }
    //[self setIsOn:true];
    //NSLog( [self isOn]? @"2/ YES" : @"2/ NO" );
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultsChanged) name:NSUserDefaultsDidChangeNotification object:nil];
}

-(void)defaultsChanged{
    NSLog(@"default change :");
    NSLog( [self isOn]? @"YES" : @"NO" );

}

-(void)viewWillAppear:(BOOL)animated{
    NSLog( [self isOn]? @"YES" : @"NO" );
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)isOn {
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"isOn"];
}
- (void)setIsOn:(BOOL)on {
    [[NSUserDefaults standardUserDefaults] setBool:on forKey:@"isOn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ( [segue.destinationViewController isKindOfClass:[DetailVC class]]){
        DetailVC* detailVC = segue.destinationViewController;
        NSIndexPath *index = [[_collectionView indexPathsForSelectedItems] firstObject];
        detailVC.image = [[self images] objectAtIndex:index.row];
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImage* img = [self.images objectAtIndex:indexPath.row];
    cell.layer.contents = (id)img.CGImage;
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.images.count;
}

-(UIView*) sharedView {
    return [_collectionView cellForItemAtIndexPath:[[_collectionView indexPathsForSelectedItems]  firstObject] ];
}

@end
