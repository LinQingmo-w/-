//
//  CircleCommentView.m
//  TiZong
//
//  Created by Yong Yang on 2017/3/30.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import "CircleCommentView.h"

@interface CircleCommentView ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hightConstan;

@end


@implementation CircleCommentView
//xib控件规范和国际化
- (void)xibControlsStandardAndLocalizable {
    _commentLable.font = [UIFont systemFontOfSize:12];
    _commentLable.textColor = [UIColor blackColor];
    
    [_commentSendBtn setTitle: @"发送" forState:UIControlStateNormal];
    [_commentSendBtn setTintColor:[UIColor whiteColor]];
    [_commentSendBtn setBackgroundColor:[UIColor grayColor]];
//    
//    RAC(_commentSendBtn,backgroundColor) = [RACSignal combineLatest:@[_commentLable.rac_textSignal] reduce:^id(NSString *text){
//        if (JIsEmpty(text)) {
//            return [UIColor j_colorWithHex:0xd6d6d6];
//        } else {
//            return ThemeColor;
//        }
//    }];
    
//    [_commentLable.rac_textSignal subscribeNext:^(NSString *text) {
//        JLog(@"文字改变：%@" , text);
//    }];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    
    _commentLable.delegate = self;
    _commentLable.placeholder = @"说点什么吧！";
    _commentLable.placeholderColor = [UIColor grayColor];
    _commentLable.font = [UIFont systemFontOfSize:12];
    _commentLable.placeholderImage = [UIImage imageNamed:@"home_detail_reply"];
    [self xibControlsStandardAndLocalizable];
}

- (void)setBplrNicheng:(NSString *)bplrNicheng {
    _bplrNicheng = bplrNicheng;
    if (bplrNicheng) {
        _commentLable.placeholder = [NSString stringWithFormat:@"%@%@" ,@"回复", bplrNicheng];
    } else {
        _commentLable.placeholder = @"说点什么吧！";
    }
    
}

#pragma mark - textViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    
    CGFloat viewHight;
    
    static CGFloat maxHeight =100.0f;
    CGRect frame = textView.frame;
    CGSize constraintSize = CGSizeMake(frame.size.width, MAXFLOAT);
    CGSize size = [textView sizeThatFits:constraintSize];
    if (size.height<=30) {
      
        viewHight = 44;
    } else {
        if (size.height >= maxHeight) {
            size.height = maxHeight;
            textView.scrollEnabled = YES;   // 允许滚动
            viewHight = maxHeight;
        } else {
            textView.scrollEnabled = NO;    // 不允许滚动
            viewHight = size.height +14;
        }
        
    }

    
    UIColor *backgroundColor = [UIColor redColor];
    if (_commentLable.text <= 0){
        backgroundColor = [UIColor grayColor];
    }
    [UIView animateWithDuration:0.3 animations:^{
        _commentSendBtn.backgroundColor = backgroundColor;
    }];
    
    if ([self.delegate respondsToSelector:@selector(commentViewHightChanged:)]) {
        [self.delegate commentViewHightChanged:viewHight];
    }
    
}

#pragma mark - 发送按钮点击
- (IBAction)sendCommentClick:(UIButton *)sender {
   
    
    if ([_commentLable.text isEqualToString:@""]) {
        return;
    }
    NSLog(@"发送信息  ~~~%@~~~", _commentLable.text);
    
    
    [_commentLable resignFirstResponder];
    
    if ([self.delegate respondsToSelector:@selector(sendCommentText:)]) {
        [self.delegate sendCommentText:_commentLable.text];
    }
    
    
    _commentLable.text = @"";
    _bplrNicheng = nil;
    _bplrId = 0;
    _plid = nil;
    
    [self textViewDidChange:_commentLable];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
