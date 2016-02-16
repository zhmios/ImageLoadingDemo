//
//  ViewController.m
//  CustomLoadingDemo
//
//  Created by zhm on 16/2/16.
//  Copyright © 2016年 zhm. All rights reserved.
//

#import "ViewController.h"
#import "ImageLoadingView.h"
@interface ViewController ()

@property (nonatomic,strong)ImageLoadingView *loadingView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadingView = [[ImageLoadingView alloc]initImageLoadingViewWithImages:@[@"loading_fullscreen_anim_01",@"loading_fullscreen_anim_02",@"loading_fullscreen_anim_03"] withSuperView:self.view];

    [self.loadingView show];
    
}
- (IBAction)navigationBtnPress:(id)sender {

    [self.loadingView show];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
