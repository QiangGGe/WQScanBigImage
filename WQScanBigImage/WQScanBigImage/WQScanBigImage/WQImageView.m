//
//  WQImageView.m
//  WQScanBigImageDemo
//
//  Created by qiangWang on 16/8/10.
//  Copyright © 2016年 qiangWang. All rights reserved.
//

#import "WQImageView.h"

@implementation WQImageView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        
    }
    return self;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"...began");
    
    NSLog(@"touches  count  %lu",(unsigned long)touches.count);
    
    // 手指的数量
    if (touches.count == 2)
    {
        NSArray *array = [touches allObjects];
        UITouch *touch1 = array[0];
        
        UITouch *touch2 = array[1];
        
        CGPoint point1 = [touch1 locationInView:[self superview]];
        CGPoint point2 = [touch2 locationInView:[self superview]];
        
        // 手指刚触摸到view时两个手指之间的距离
        distance = fabs(point1.x - point2.x);
        
        
        // 每个手指点击的次数
        NSLog(@"tagCount  %lu",(unsigned long)touch1.tapCount);
    }
    
}


// 5   10(frame+5)  15(+5)


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"...move");
    
    if (touches.count == 2)
    {
        NSArray *array = [touches allObjects];
        UITouch *touch1 = array[0];
        UITouch *touch2 = array[1];
        
        CGPoint point1 = [touch1 locationInView:[self superview]];
        CGPoint point2 = [touch2 locationInView:[self superview]];
        
        // 手指刚触摸到view时两个手指之间的距离
        float changedX = fabs(point1.x - point2.x);
        
        float chaX = changedX - distance;
        
        CGRect rect = self.frame;
        rect.origin.x = rect.origin.x - chaX / 2;
        rect.origin.y = rect.origin.y - chaX / 2;
        rect.size.width = rect.size.width + chaX;
        rect.size.height = rect.size.height + chaX;
        
        self.frame = rect;
        
        // 现在已经改变过frame了,下一次再改变应该在现在的基础上去计算差值
        distance = changedX;
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"...end");
}
@end
