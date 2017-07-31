//
//  TagCollectionViewController.m
//  Video
//
//  Created by Yong Yang on 2017/6/27.
//  Copyright © 2017年 wly. All rights reserved.
//

#import "TagCollectionViewController.h"
#import "LabelItemCollectionViewCell.h"
#import "LeftAlignmentFlowout.h"



@interface TagCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,LeftAlignmentFlowoutHightProtocol>

@property (nonatomic, assign)CGRect frame;

@property (nonatomic, retain) LeftAlignmentFlowout *layout;

@end

@implementation TagCollectionViewController

static NSString * const LabelItemCollectionViewCellIdentifier =  @__STRING(LabelItemCollectionViewCell);

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
     self.clearsSelectionOnViewWillAppear = NO;
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.frame = _frame;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView reloadData];
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:LabelItemCollectionViewCellIdentifier bundle:nil] forCellWithReuseIdentifier:LabelItemCollectionViewCellIdentifier];
    
}

- (instancetype)init {
    _layout = [[LeftAlignmentFlowout alloc] init];
    _layout.minimumLineSpacing = 10;
    _layout.minimumInteritemSpacing = 20;
    _layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _layout.delegete = self;
    
    return [super initWithCollectionViewLayout:_layout];
}

- (instancetype)initWithFrame:(CGRect)frame dataArr:(NSMutableArray *)dataArr hightBlock:(HightBlock)hightBlock {
  
    self.dataSource = dataArr;
    
    _frame = frame;
    _hightBlock = hightBlock;
    return [self init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - 默认设置
- (float)itemhight {
    return (_itemhight > 0) ? _itemhight : 20;
}

- (float)itemInsertEdge {
   return (_itemInsertEdge > 0) ? _itemInsertEdge : 10;
}

- (float)itemMinWidth {
    return (_itemMinWidth > 0) ? _itemMinWidth : 30;
}

- (UIFont *)textFont {
    return  _textFont ? _textFont : [UIFont systemFontOfSize:14];
}

- (UIColor *)itemBackGroundColor {
    return _itemBackGroundColor ? _itemBackGroundColor : [UIColor whiteColor];
}

- (UIColor *)itemBorderColor {
    return _itemBorderColor ? _itemBorderColor : [UIColor whiteColor];
}
//- (void)setDataSource:(NSMutableArray *)dataSource {
//    self.dataSource = dataSource;
//    [self.collectionView reloadData];
//}
#pragma mark - collectionView
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LabelItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LabelItemCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    cell.textLabel.font = self.textFont;
    cell.textLabel.backgroundColor = [UIColor whiteColor];
    cell.textLabel.layer.cornerRadius =  self.itemCornerRadius;
    cell.textLabel.layer.borderColor = self.itemBorderColor.CGColor;
    cell.textLabel.layer.borderWidth = self.itemBorderWidth;
    cell.textLabel.layer.masksToBounds = YES;
    cell.backgroundColor = self.itemBackGroundColor;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *itemString = [self.dataSource objectAtIndex:indexPath.row];
    CGFloat width = [itemString boundingRectWithSize:CGSizeMake(kWidth - self.layout.sectionInset.left - self.layout.sectionInset.right, self.itemhight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : self.textFont} context:nil].size.width + 3;
    if (width < self.itemMinWidth) {
        width = self.itemMinWidth;
    }
    return CGSizeMake(width + (self.itemInsertEdge * 2), self.itemhight);
}
#pragma mark - layoutDelegate
- (void)reladHight:(CGFloat)hight {
    
    if (!_showAllHight) {
        if ((CGRectGetMinY(_frame) + hight) > kHeight) {
            hight = kHeight - CGRectGetMinY(_frame);
        }
    }
    
    
    CGRect frame = self.collectionView.frame;
    frame.size.height = hight;
    self.collectionView.frame = frame;
    
    if (_hightBlock) {
        _hightBlock(hight);
    }
    
}

@end
