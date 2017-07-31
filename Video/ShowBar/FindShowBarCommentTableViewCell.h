//
//  FindShowBarCommentTableViewCell.h
//  TiZong
//
//  Created by Yong Yang on 2017/5/5.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShowBarCommentModel;

@protocol FindShowBarCommentCellProtocol <NSObject>


/**
 回复某条子评论
 */
//- (void)replayCommentWithOldCommentId:(NSString *)commentId;

/**
 点击更多评论

 @param cell 这个cell
 */
-(void)moreCommentClickWithCell:(UITableViewCell *)cell;

@end

@interface FindShowBarCommentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UITableView *subCommentTableView;
@property (weak, nonatomic) IBOutlet UIImageView *subCommentBG;

@property (nonatomic, retain) NSMutableArray *dataArr;
@property (nonatomic, retain) ShowBarCommentModel *model;
@property (nonatomic, weak) id <FindShowBarCommentCellProtocol> delegate;


@end
