//
//  FindShowbarViewController.m
//  TiZong
//
//  Created by Yong Yang on 2017/5/4.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import "FindShowbarViewController.h"
#import "FindShowBarFlowLayout.h"//flowLayout
#import "FindShowBarCollectionViewCell.h"//v
#import "FindShowBarDetialViewController.h"//vc



static NSString * const FindShowBarCollectionViewCellIdentifier =  @__STRING(FindShowBarCollectionViewCell);

@interface FindShowbarViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (retain, nonatomic)  UICollectionView *collectionView;

@end

@implementation FindShowbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view addSubview:self.collectionView];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    self.navigationController.navigationBar.shadowImage = [UIImage new];
//    self.navigationController.navigationBar.barTintColor = [UIColor clearColor];
//    self.navigationController.navigationBar.translucent = YES;
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
//    //设置导航栏颜色
//    self.navigationController.navigationBar.barTintColor = [UIColor redColor];
//    self.navigationController.navigationBar.translucent = NO;
}

#pragma mark - collection Delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
       FindShowBarCollectionViewCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:FindShowBarCollectionViewCellIdentifier forIndexPath:indexPath];
  
    return item;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    FindShowBarDetialViewController *controller = [[FindShowBarDetialViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - lazy
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        FindShowBarFlowLayout *layout = [[FindShowBarFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerNib:[UINib nibWithNibName:FindShowBarCollectionViewCellIdentifier bundle:nil] forCellWithReuseIdentifier:FindShowBarCollectionViewCellIdentifier];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor lightGrayColor];
        //数据不够一屏时上下滚动
        _collectionView.alwaysBounceVertical = YES;
    }
    return _collectionView;
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
