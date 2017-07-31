//
//  SubCommentTableViewCell.m
//  TiZong
//
//  Created by Yong Yang on 2017/5/5.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import "SubCommentTableViewCell.h"

@implementation SubCommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTextString:(NSString *)textString {
    NSString *name = @"张小花";
    
    NSString *totalString = [NSString stringWithFormat:@"%@：%@" , name ,textString ];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:totalString attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14] , NSForegroundColorAttributeName : [UIColor blackColor]}];
    [string addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, name.length +1)];
    _commentLabel.attributedText = string;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
