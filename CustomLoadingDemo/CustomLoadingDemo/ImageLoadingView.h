//
//  ImageLoadingView.h
//  CustomLoadingDemo
//
//  Created by zhm on 16/2/16.
//  Copyright © 2016年 zhm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLoadingView : UIView

- (id) initImageLoadingViewWithImages:(NSArray *)imageArray withSuperView:(UIView *)superView;
- (void)show;

@end
