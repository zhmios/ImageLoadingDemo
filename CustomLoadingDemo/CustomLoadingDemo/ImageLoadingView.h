//
//  ImageLoadingView.h
//  CustomLoadingDemo
//
//  Created by zhm on 16/2/16.
//  Copyright © 2016年 zhm. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
imageLoadingType = 0,
    
imageAndTextType

} ImageLoadingViewType;

@interface ImageLoadingView : UIView
@property (nonatomic,strong) NSString *labelContent;
@property (nonatomic,strong) UIFont *font;
- (id)initImageLoadingViewWithImages:(NSArray *)imageArray andloadingType:(ImageLoadingViewType)type withSuperView:(UIView *)superView;

- (void)show;
- (void)dismiss;
@end
