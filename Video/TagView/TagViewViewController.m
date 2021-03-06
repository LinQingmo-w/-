//
//  TagViewViewController.m
//  Video
//
//  Created by Yong Yang on 2017/6/29.
//  Copyright © 2017年 wly. All rights reserved.
//

#import "TagViewViewController.h"
#import "TagCollectionViewController.h"

@interface TagViewViewController ()
@property (nonatomic, retain) NSMutableArray *dataSource;
@property (nonatomic, retain) TagCollectionViewController *Controller;
@end

@implementation TagViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
        
    _Controller = [[TagCollectionViewController alloc] initWithFrame:CGRectMake(0, 20, kWidth, 300) dataArr:self.dataSource hightBlock:^(CGFloat hight) {
        NSLog(@"%f",hight);
    }];
    _Controller.itemCornerRadius = 15;
    _Controller.itemhight = 30;
    _Controller.itemInsertEdge = 10;
    _Controller.collectionView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_Controller.collectionView];
}
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] initWithObjects:@"六王毕",@"四海一",@"蜀山兀",@"阿房出",@"覆压三百余里",@"隔离天日",@"骊山北构而西折",@"直走咸阳",@"二川溶溶",@"流入宫墙",@"五步一楼",@"十步一阁；廊腰缦回",@"檐牙高啄；各抱地势",@"钩心斗角",@"盘盘焉",@"囷囷焉",@"蜂房水涡",@"矗不知乎几千万落！长桥卧波",@"未云何龙？複道行空",@"不霁何虹？高低冥迷",@"不知西东",@"歌台暖响",@"春光融融；舞殿冷袖",@"风雨凄凄",@"一日之内",@"一宫之间",@"而气候不齐",@"妃嫔媵嫱",@"王子皇孙",@"辞楼下殿",@"辇来于秦",@"朝歌夜弦",@"为秦宫人",@"明星荧荧",@"开妆镜也；绿云扰扰",@"梳晓鬟也；渭流涨腻",@"弃脂水也；烟斜雾横",@"焚椒兰也",@"雷霆乍惊",@"宫车过也；辘辘远听",@"杳不知其所之也",@"一肌一容",@"尽态极妍",@"缦立远视",@"而望幸焉；有不得见者",@"三十六年", nil];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
