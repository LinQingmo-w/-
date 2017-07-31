//
//  FindShowBarFlowLayout.m
//  TiZong
//
//  Created by Yong Yang on 2017/5/4.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import "FindShowBarFlowLayout.h"

static CGFloat const colCount = 2;
static const float leftAspectRatio = 527.0/360.0;//左边的cell的宽高比
static const float rightAspectRatio = 683.0/360.0;//右边cell的宽高比

@interface FindShowBarFlowLayout ()

@property(nonatomic,strong)NSMutableArray *maxYArr;//存放列的高度
@property(nonatomic,strong)NSMutableArray *attributesArray;//cell的位置信息

@end

@implementation FindShowBarFlowLayout
- (void)prepareLayout {
    [super prepareLayout];
    
    _maxYArr = [[NSMutableArray alloc] init];
    _attributesArray = [[NSMutableArray alloc] init];
    
    float top = 0;
    for (int i = 0; i < colCount; i++) {
        [_maxYArr addObject:[NSNumber numberWithFloat:top]];
    }
    
    
    //根据collectionView获取总共有多少个item
    NSInteger itemCount = [self.collectionView numberOfItemsInSection:0];
    //为每一个item创建一个attributes并存入数组
    for (int i = 0; i < itemCount; i++) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [_attributesArray addObject:attributes];
    }
}

- (CGSize)collectionViewContentSize {
    CGSize size = self.collectionView.frame.size;
    float maxHeight = [[_maxYArr objectAtIndex:0] floatValue];
    //查找最高的列的高度
    for (int i = 0; i < _maxYArr.count; i++) {
        float colHeight = [[_maxYArr objectAtIndex:i] floatValue];
        if (colHeight > maxHeight) {
            maxHeight = colHeight;
        }
    }
    size.height = maxHeight + 3;//加上间距
    return size;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    //查找最低的列
    int minLine = 0;
    //最低高度
    float minHight = [[_maxYArr objectAtIndex:minLine] floatValue];
    for (int i = 0; i < _maxYArr.count; i++) {
        float colHeight = [[_maxYArr objectAtIndex:i] floatValue];
        if (colHeight < minHight) {
            minHight = colHeight;
            minLine = i;
        }
    }
    
    //itemSize
    CGFloat itemWidth = (kWidth - 3)/2;
    CGSize leftSize = CGSizeMake(itemWidth, itemWidth * leftAspectRatio);
    CGSize rightSize = CGSizeMake(itemWidth, itemWidth * rightAspectRatio);
    
    //获得frame并更新最高数组
    CGRect frame = CGRectMake(0, 0, 0, 0);
    CGFloat newHight = minHight;
    switch (minLine) {
        case 0:
        {
            frame.size = leftSize;
            frame.origin.x = 0;
            frame.origin.y = minHight;
            
            newHight += leftSize.height + 3;
        }
            break;
        case 1:
        {
            frame.size = rightSize;
            frame.origin.x = itemWidth + 3;
            frame.origin.y = minHight;
            
            newHight += rightSize.height + 3;
        }
            break;
        default:
            break;
    }
    //修改min数据源
    [_maxYArr replaceObjectAtIndex:minLine withObject:[NSNumber numberWithFloat:newHight]];
    //获得attribut 并返回
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = frame;
    return attributes;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesArray;
}
@end
