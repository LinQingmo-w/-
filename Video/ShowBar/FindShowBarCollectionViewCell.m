//
//  FindShowBarCollectionViewCell.m
//  TiZong
//
//  Created by Yong Yang on 2017/5/4.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import "FindShowBarCollectionViewCell.h"

@implementation FindShowBarCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)prasiedBtnClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    int count = [sender.titleLabel.text intValue];
    if (sender.selected) {
        [sender setTitle:[NSString stringWithFormat:@"%d", ++count] forState:UIControlStateNormal];
    } else {
        [sender setTitle:[NSString stringWithFormat:@"%d", --count] forState:UIControlStateNormal];
    }
}

@end
