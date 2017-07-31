//
//  FindShowBarLiveTableViewCell.h
//  TiZong
//
//  Created by Yong Yang on 2017/5/5.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FindShowBarLiveCellProtocol <NSObject>

- (void)transferClick;
- (void)commentClick;
- (void)prasmieClick;

@end

@interface FindShowBarLiveTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *transferBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentBtn;
@property (weak, nonatomic) IBOutlet UIButton *prasiedBtn;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *watchingLabel;

@property (nonatomic, weak) id<FindShowBarLiveCellProtocol>delegate;

@end
