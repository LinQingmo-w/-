//
//  LeftAlignmentFlowout.m
//  Video
//
//  Created by Yong Yang on 2017/6/27.
//  Copyright © 2017年 wly. All rights reserved.
//

#import "LeftAlignmentFlowout.h"

@implementation LeftAlignmentFlowout

- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    // 获取系统帮我们计算好的Attributes
    NSArray *answer = [super layoutAttributesForElementsInRect:rect];
    
    NSMutableArray *newArr = [[NSMutableArray alloc] init];
    if (answer.count == 0) {
        return answer;
    }
    [newArr addObject:[answer objectAtIndex:0]];
    // 遍历结果
    for(int i = 1; i < [answer count]; ++i) {
        
        // 获取cell的Attribute，根据上一个cell获取最大的x，定义为origin
        UICollectionViewLayoutAttributes *currentLayoutAttributes = answer[i];//当前
        UICollectionViewLayoutAttributes *prevLayoutAttributes = answer[i - 1];//下一个
        NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
        
        // 设置cell最大间距
        NSInteger maximumSpacing = self.minimumInteritemSpacing;
        
        // 若当前cell和precell在同一行：①判断当前的cell加间距后的最大宽度是否小于ContentSize的宽度，②判断当前cell的x是否大于precell的x（否则cell会出现重叠）
        if (currentLayoutAttributes.frame.origin.y == prevLayoutAttributes.frame.origin.y) {
            //满足则给当前cell的frame属性赋值（不满足的cell会根据系统布局换行）
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = origin + maximumSpacing;
            currentLayoutAttributes.frame = frame;
        } else {
            CGRect frame = currentLayoutAttributes.frame;
            frame.origin.x = self.sectionInset.left;
            currentLayoutAttributes.frame = frame;
        }
        
        [newArr addObject:currentLayoutAttributes];
    }

    UICollectionViewLayoutAttributes *lastLayoutAttributes = [answer lastObject];
    if (lastLayoutAttributes && [self.delegete respondsToSelector:@selector(reladHight:)]) {
        [self.delegete reladHight:CGRectGetMaxY(lastLayoutAttributes.frame) + self.minimumLineSpacing];
    }
    return newArr;
}
@end
