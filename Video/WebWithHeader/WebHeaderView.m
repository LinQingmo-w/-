//
//  WebHeaderView.m
//  Video
//
//  Created by Yong Yang on 2017/7/31.
//  Copyright © 2017年 wly. All rights reserved.
//

#import "WebHeaderView.h"

@implementation WebHeaderView

+ (instancetype)loadViewWithNib {
    return [[NSBundle mainBundle] loadNibNamed:@"WebHeaderView" owner:self options:nil].firstObject;
}

@end
