//
//  ShowBarCommentModel.h
//  TiZong
//
//  Created by Yong Yang on 2017/5/9.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowBarCommentModel : NSObject

@property (nonatomic, retain) NSMutableArray *replyCommnetArray;//回复数组 现在存字符串，之后改成存model

/**
 是否折叠回复，判断replyCommnetArray 当回复数大于2的时候默认折叠，点击“更多几条”显示剩下的信息（即不折叠）
 判断方面：1.当replyCommnetArray.count >2时，设置默认 isFold = yes;
         2.当 isFold == yes时，子回复的tableview显示2条信息，显示footer“更多几条”；当isFold == no; 子回复的tableview显示全部 replyCommnetArray.count条信息，不显示footer
         3.点击更多几条，设置isFold = yes;并且显示全部信息，刷新子回复的tableview
 */
@property (nonatomic, assign) BOOL isFold;


@end
