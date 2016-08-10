//
//  CustomeTableViewCell.m
//  WQScanBigImageDemo
//
//  Created by qiangWang on 16/8/10.
//  Copyright © 2016年 qiangWang. All rights reserved.
//

#import "CustomeTableViewCell.h"
#import "WQScanBigImage.h"

@implementation CustomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)openImageViewEvent:(UIButton *)sender {
    [WQScanBigImage showWidget:self.customeImageView];
}
- (IBAction)openButtonBackgroundImageEvent:(UIButton *)sender {
    [WQScanBigImage showWidget:sender];
}
- (IBAction)openButtonImageEvent:(UIButton *)sender {
    [WQScanBigImage showWidget:sender];
}

@end
