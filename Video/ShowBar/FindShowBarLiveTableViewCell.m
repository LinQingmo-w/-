//
//  FindShowBarLiveTableViewCell.m
//  TiZong
//
//  Created by Yong Yang on 2017/5/5.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import "FindShowBarLiveTableViewCell.h"

@interface FindShowBarLiveTableViewCell ()

@end

@implementation FindShowBarLiveTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self xibControlsStandardAndLocalizable];
}
//xib控件规范和国际化
- (void)xibControlsStandardAndLocalizable {
    _timeLabel.font = [UIFont systemFontOfSize:14];
    _watchingLabel.font = [UIFont systemFontOfSize:14];
    _transferBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    _commentBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    _prasiedBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    
}
- (IBAction)transferClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(transferClick)]) {
        [self.delegate transferClick];
    }
}
- (IBAction)praiseClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(prasmieClick)]) {
        [self.delegate prasmieClick];
    }
}
- (IBAction)commentClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(commentClick)]) {
        [self.delegate commentClick];
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
