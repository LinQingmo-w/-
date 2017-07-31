//
//  ShowBarCommentModel.m
//  TiZong
//
//  Created by Yong Yang on 2017/5/9.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import "ShowBarCommentModel.h"

@implementation ShowBarCommentModel
-(void)setReplyCommnetArray:(NSMutableArray *)replyCommnetArray {
    _replyCommnetArray = replyCommnetArray;
    if (_replyCommnetArray.count > 2) {
        _isFold = YES;
    } else {
        _isFold = NO;
    }
        
}
@end
