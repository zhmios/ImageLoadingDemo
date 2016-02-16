//
//  ImageLoadingView.m
//  CustomLoadingDemo
//
//  Created by zhm on 16/2/16.
//  Copyright © 2016年 zhm. All rights reserved.
//

#import "ImageLoadingView.h"
@interface ImageLoadingView()

@property (nonatomic, strong) UIView *superView;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation ImageLoadingView

- (id) initImageLoadingViewWithImages:(NSArray *)imageArray withSuperView:(UIView *)superView{

    self = [super init];
    
    if (self != nil) {
        
        self.backgroundColor = [UIColor redColor];
        CGFloat width = 80;
        CGFloat height = 80;
        
        CGFloat centerX = (CGRectGetWidth(superView.frame) - width) / 2;
        CGFloat centerY = (CGRectGetHeight(superView.frame) - height) / 2;
        self.frame = CGRectMake(centerX, centerY, width, height);
        
        self.imageArray = imageArray;
        self.superView = superView;
    }

    return self;
}

- (void)makeApparance{

    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    
    NSMutableArray *images = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < self.imageArray.count; i ++) {
        
        UIImage *image = [UIImage imageNamed:self.imageArray[i]];
        [images addObject:image];
        
    }
    imageView.animationDuration = 0.5;
    imageView.animationImages = images;
    [imageView startAnimating];
    imageView.tag = 1;
    [self addSubview:imageView];


}

- (void)show{
    
    [self makeApparance];
    
    [self.superView addSubview:self];
    
}


- (void)dismiss{

    UIImageView *imageView = [self viewWithTag:1];

    [imageView stopAnimating];
    
    [self removeFromSuperview];
    
    
}

@end
