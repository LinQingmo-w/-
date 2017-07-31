//
//  LeftAlignmentFlowout.h
//  Video
//
//  Created by Yong Yang on 2017/6/27.
//  Copyright © 2017年 wly. All rights reserved.
//

#import <UIKit/UIKit.h>

//代理获取排序wan
@protocol LeftAlignmentFlowoutHightProtocol <NSObject>

- (void)reladHight:(CGFloat)hight;

@end

@interface LeftAlignmentFlowout : UICollectionViewFlowLayout

@property (nonatomic, weak)id <LeftAlignmentFlowoutHightProtocol> delegete;

@end
