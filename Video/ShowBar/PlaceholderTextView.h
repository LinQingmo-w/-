//
//  PlaceholderTextView.h
//  TiZong
//
//  Created by Yong Yang on 2017/3/29.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlaceholderTextView : UITextView
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
/** 带属性的string */
@property (nonatomic, strong) UIImage *placeholderImage;

@end
