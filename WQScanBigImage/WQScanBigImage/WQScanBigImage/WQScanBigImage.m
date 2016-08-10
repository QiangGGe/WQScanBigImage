//
//  WQScanBigImage.m
//  WQScanBigImageDemo
//
//  Created by qiangWang on 16/8/10.
//  Copyright © 2016年 qiangWang. All rights reserved.
//

#import "WQScanBigImage.h"
#import "WQImageView.h"

static CGRect oldframe;

@implementation WQScanBigImage

+ (void)showWidget:(id)widget{
    UIImage *image = nil;
    UIWindow *window=[UIApplication sharedApplication].keyWindow;
    if ([widget isKindOfClass:[UIButton class]]) {
        UIButton *btn = (UIButton *)widget;
        if (btn.currentImage){
            image = btn.currentImage;
        } else if (btn.currentBackgroundImage){
            image = btn.currentBackgroundImage;
        } else{
            image = [UIImage imageNamed:@"default"];
        }
        
        oldframe=[btn convertRect:btn.bounds toView:window];
    } else if ([widget isKindOfClass:[UIImageView class]]){
        UIImageView *imageView = (UIImageView *)widget;
        if (imageView.image) {
            image = imageView.image;
        } else{
            image = [UIImage imageNamed:@"default"];
        }
        oldframe=[imageView convertRect:imageView.bounds toView:window];
    }
    
    
    UIView *backgroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    backgroundView.backgroundColor=[UIColor blackColor];
    backgroundView.alpha=0;
    WQImageView *imageView=[[WQImageView alloc]initWithFrame:oldframe];
    imageView.image=image;
    imageView.tag=1;
    [backgroundView addSubview:imageView];
    [window addSubview:backgroundView];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
    [backgroundView addGestureRecognizer: tap];
    
    [UIView animateWithDuration:0.3 animations:^{
        imageView.frame=CGRectMake(0,([UIScreen mainScreen].bounds.size.height-image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width)/2, [UIScreen mainScreen].bounds.size.width, image.size.height*[UIScreen mainScreen].bounds.size.width/image.size.width);
        backgroundView.alpha=1;
    } completion:^(BOOL finished) {
        
    }];
}

+ (void)hideImage:(UITapGestureRecognizer*)tap{
    UIView *backgroundView=tap.view;
//    UIImageView *imageView=(UIImageView*)[tap.view viewWithTag:1];
    [UIView animateWithDuration:0.3 animations:^{
//        imageView.frame=oldframe;
        backgroundView.alpha=0;
    } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
    }];
}
@end
