//
//  FindShowBarCommentTableViewCell.m
//  TiZong
//
//  Created by Yong Yang on 2017/5/5.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import "FindShowBarCommentTableViewCell.h"
#import "SubCommentTableViewCell.h"//v
#import "ShowBarCommentModel.h"//m

static NSString * const SubCommentCellIdentifier =  @__STRING(SubCommentTableViewCell);

@interface FindShowBarCommentTableViewCell ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableviewHight;

@end

@implementation FindShowBarCommentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _subCommentTableView.delegate = self;
    _subCommentTableView.dataSource = self;
    _subCommentTableView.rowHeight = UITableViewAutomaticDimension;
    _subCommentTableView.estimatedRowHeight = 20;
    [_subCommentTableView registerNib:[UINib nibWithNibName:SubCommentCellIdentifier bundle:nil] forCellReuseIdentifier:SubCommentCellIdentifier];
}

#pragma mark - tableviewDelagate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_model.isFold) {
        return 2;
    }
    return self.dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SubCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SubCommentCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.textString = [_dataArr objectAtIndex:indexPath.row];
    
    return cell;
   
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (_model.isFold) {
        return 30;
    }
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (_model.isFold) {
        UILabel *footerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kWidth, 30)];
        footerLabel.text =[NSString stringWithFormat:@"更多%lu条评论", (_model.replyCommnetArray.count -2 )];
        footerLabel.textAlignment = NSTextAlignmentCenter;
        footerLabel.textColor = [UIColor grayColor];
        footerLabel.font = [UIFont systemFontOfSize:12];
        footerLabel.backgroundColor = [UIColor clearColor];
        
        //footer点击事件 ： 代理到vc，设置isFold = no; 刷新数据,重新设置高度
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(footerLabelClick:)];
        [footerLabel addGestureRecognizer:tap];
        return footerLabel;
        
    }
        return [[UIView alloc] init];
 
}
- (void)footerLabelClick:(UITapGestureRecognizer *)gestureRecognizer {
    NSLog(@"点击点击");
    if ([self.delegate respondsToSelector:@selector(moreCommentClickWithCell:)]) {
        [self.delegate moreCommentClickWithCell:self];
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

- (void)setDataArr:(NSMutableArray *)dataArr {
    _dataArr = dataArr;

    CGFloat totalHight = 0.0f;
    for (NSString *commentString in dataArr) {
         CGFloat hight = [commentString boundingRectWithSize:CGSizeMake(kWidth - 65 - 15 - 16, 100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height; //宽度 - tableviw左约束 - 右约束 - cell约束
        totalHight += (hight +2 + 10);//hight+间隔+上下约束和
    }
    _tableviewHight.constant = totalHight + 15;
    
    [self.subCommentTableView reloadData];
    
}

- (void)setModel:(ShowBarCommentModel *)model {
    _model = model;
    
   _timeLabel.text = @"23:33";
    _nameLabel.text = @"张小花";
    _commentLabel.text = @"我有时候会想，你是不是也在爱里受过伤害，热情被时间损耗，交付出一颗真心，却没被一个滚烫的胸膛接纳，在风雨里慢慢冷掉，再收回来的时候，已经没有当初那么热烈了。从此，藏在自己的城堡里，质疑每一个前来叩门的人，他是真的想要进来吗，他也会走的吧，要不还是算了，没可能的，没必要了。";
    
    //setDataArr
    _dataArr = model.replyCommnetArray;
    
    if (model.isFold) {
        CGFloat totalHight = 0.0f;
        
        //前两个回复的高度
        NSString *firstString =[NSString stringWithFormat:@"%@：%@" , @"张小花" ,[model.replyCommnetArray objectAtIndex:0]];
        
        CGFloat hight1 = [firstString boundingRectWithSize:CGSizeMake(kWidth - 65 - 15 - 15, 500)options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height; //宽度 - tableviw左约束 - 右约束 - cell约束
        
        totalHight += (hight1 +2 + 10);//hight+间隔+上下约束和
        
        NSString *SecondString =[NSString stringWithFormat:@"%@：%@" , @"张小花" ,[model.replyCommnetArray objectAtIndex:1]];
        
        CGFloat hight2 = [SecondString boundingRectWithSize:CGSizeMake(kWidth - 65 - 15 - 15, 500)options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;//宽度 - tableviw左约束 - 右约束 - cell约束
       
        totalHight += (hight2 +2 + 10);//hight+间隔+上下约束和
        
        //添加footer高度
        totalHight += 30;
        
        _tableviewHight.constant = totalHight + 15;//上下段头间距
    }else
    {
        CGFloat totalHight = 0.0f;
        for (NSString *commentString in model.replyCommnetArray) {
            
            CGFloat hight = [[NSString stringWithFormat:@"%@：%@" , @"张小花" ,commentString ] boundingRectWithSize:CGSizeMake(kWidth - 65 - 15 - 15, 500) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;//宽度 - tableviw左约束 - 右约束 - cell约束

            totalHight += (hight +2 + 10);//hight+间隔+上下约束和
        }
        _tableviewHight.constant = totalHight + 15;//上下段头间距
    }
    
    [self.subCommentTableView reloadData];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
