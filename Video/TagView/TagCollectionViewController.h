//
//  TagCollectionViewController.h
//  Video
//
//  Created by Yong Yang on 2017/6/27.
//  Copyright © 2017年 wly. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HightBlock)(CGFloat hight);

@interface TagCollectionViewController : UICollectionViewController

//初始化函数
- (instancetype)initWithFrame:(CGRect)react dataArr:(NSMutableArray *)dataArr hightBlock:(HightBlock)hightBlock;



@property (nonatomic, retain) NSMutableArray *dataSource;

/**
 高度返回成功回掉
 */
@property (nonatomic, copy) HightBlock hightBlock;

/**
 是否显示全部高度
 no 超过屏幕高度了可以滑动
 yes 显示全部高度  不设置可以滑动的属性
 */
@property (nonatomic, assign) BOOL showAllHight;


//元素属性
/**
   每个元素高度 不设置默认20
 */
@property (nonatomic, assign) float itemhight;

/**
   item左右内间距 默认5 设置为一边的长度 左右各间距设置长度
 */
@property (nonatomic, assign) float itemInsertEdge;

/**
 item最小宽度 默认30
 */
@property (nonatomic, assign) float itemMinWidth;

/**
 文字字体 默认14
 */
@property (nonatomic, retain) UIFont *textFont;

/**
 元素背景色 默认白色
 */
@property (nonatomic, retain) UIColor *itemBackGroundColor;

/**
 元素边框颜色 默认白色
 */
@property (nonatomic, retain) UIColor *itemBorderColor;

/**
 元素边框宽度 默认0
 */
@property (nonatomic, assign) float itemBorderWidth;

/**
 元素圆角 默认0
 */
@property (nonatomic, assign) float itemCornerRadius;

@end
