//
//  SubCommentTableViewCell.h
//  TiZong
//
//  Created by Yong Yang on 2017/5/5.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SubCommentTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (nonatomic, copy) NSString *textString;

@end
