//
//  CircleCommentView.h
//  TiZong
//
//  Created by Yong Yang on 2017/3/30.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaceholderTextView.h"

@protocol CircleCommentViewProtocol <NSObject>

- (void)sendCommentText:(NSString *)textString;
- (void)commentViewHightChanged:(CGFloat)hight;

@end

@interface CircleCommentView : UIView

@property (nonatomic, weak) id <CircleCommentViewProtocol> delegate;
@property (weak, nonatomic) IBOutlet PlaceholderTextView *commentLable;
@property (weak, nonatomic) IBOutlet UIButton *commentSendBtn;

@property (nonatomic, assign) NSInteger bplrId;//被评论人id  就是回复谁的
@property (nonatomic, copy) NSString *bplrNicheng;//被评论人昵称
@property (nonatomic, copy) NSString *plid;//评论id

@end
