//
//  ImageLoadingView.m
//  CustomLoadingDemo
//
//  Created by zhm on 16/2/16.
//  Copyright © 2016年 zhm. All rights reserved.
//

#import "ImageLoadingView.h"
#define LABEL_HEIGHT  10
@interface ImageLoadingView()

@property (nonatomic, strong) UIView *superView;
@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, assign) ImageLoadingViewType type;

@end

@implementation ImageLoadingView

- (id) initImageLoadingViewWithImages:(NSArray *)imageArray andloadingType:(ImageLoadingViewType)type withSuperView:(UIView *)superView{

    self = [super init];
    
    if (self != nil) {
        
//        self.backgroundColor = [UIColor redColor];
        CGFloat width = 80;
        CGFloat height = 80;
        if (type == imageAndTextType) {
            
            width = 80;
            height = 80 + LABEL_HEIGHT;
        }
        CGFloat centerX = (CGRectGetWidth(superView.frame) - width) / 2;
        CGFloat centerY = (CGRectGetHeight(superView.frame) - height) / 2;
        self.frame = CGRectMake(centerX, centerY, width, height);
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        self.imageArray = imageArray;
        self.type = type;
        self.superView = superView;
    }

    return self;
}

- (void)makeApparance{

    CGRect frame = self.bounds;
    
    if (self.type == imageAndTextType) {
        
        frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - LABEL_HEIGHT);
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
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
    
    if (self.type == imageAndTextType) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), CGRectGetWidth(self.bounds), LABEL_HEIGHT)];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        if (self.labelContent == nil) {
            
            label.text = @"正在加载...";
            
        }else{
        
            label.text = self.labelContent;
        
        }
        if (self.font == nil) {
            
            label.font = [UIFont systemFontOfSize:12];
            
            
        }else{
            label.font = self.font;
        
        }
     
        [self addSubview:label];
    }


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
