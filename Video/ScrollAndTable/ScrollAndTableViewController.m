//
//  ScrollAndTableViewController.m
//  Video
//
//  Created by Yong Yang on 2017/7/31.
//  Copyright © 2017年 wly. All rights reserved.
//

#import "ScrollAndTableViewController.h"

@interface ScrollAndTableViewController ()<UIScrollViewDelegate, UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, retain) UIScrollView *scrollView;
@property (nonatomic, retain) UIScrollView *smallScrollview;

@property (nonatomic, retain) UIScrollView *titleScrollView;

@property (nonatomic, retain) UITableView *tableView1;
@property (nonatomic, retain) UITableView *tableView2;

@property (nonatomic, assign) float lastContent;

@end

@implementation ScrollAndTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.titleScrollView];
    [self.scrollView addSubview:self.smallScrollview];
    
    [self.smallScrollview addSubview:self.tableView1];
    [self.smallScrollview addSubview:self.tableView2];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if ([scrollView isEqual: self.tableView1] ) {
        if( scrollView.contentOffset.y <= 0) {
            CGPoint tableViewContent = scrollView.contentOffset;
            CGPoint scrollViewContent = self.scrollView.contentOffset;
            scrollViewContent.y = scrollViewContent.y + tableViewContent.y ;
            self.scrollView.contentOffset = scrollViewContent;
            self.tableView1.contentOffset = CGPointMake(0, 0);
        } else {
            if (self.scrollView.contentOffset.y < (self.titleScrollView.frame.origin.y - 20)) {
                CGPoint tableViewContent = scrollView.contentOffset;
                CGPoint scrollViewContent = self.scrollView.contentOffset;
                scrollViewContent.y = scrollViewContent.y + tableViewContent.y ;
                self.scrollView.contentOffset = scrollViewContent;
                self.tableView1.contentOffset = CGPointMake(0, 0);
            } else {
                self.scrollView.contentOffset = CGPointMake(0,self.titleScrollView.frame.origin.y - 20);
            }
        }
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    if (scrollView != self.scrollView  && self.scrollView.contentOffset.y < 0) {
        [UIView animateWithDuration:0.3 animations:^{
            self.scrollView.contentOffset = CGPointMake(0, 0);
        }];
        
    }
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}

#pragma mark - lazy
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
        _scrollView.contentSize = CGSizeMake(kWidth, kHeight * 2);
        _scrollView.backgroundColor = [UIColor orangeColor];
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (UIScrollView *)smallScrollview {
    if (!_smallScrollview) {
        _smallScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 330, kWidth, kHeight - 60)];
        _smallScrollview.contentSize = CGSizeMake(kWidth * 3, kHeight);
        _smallScrollview.backgroundColor = [UIColor greenColor];
        _smallScrollview.delegate = self;
        _smallScrollview.pagingEnabled = YES;
    }
    return _smallScrollview;
}

- (UITableView *)tableView1 {
    if (!_tableView1) {
        _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,kWidth ,kHeight - 60 ) style:UITableViewStylePlain];
        _tableView1.delegate = self;
        _tableView1.dataSource = self;
    }
    return _tableView1;
}

- (UITableView *)tableView2 {
    if (!_tableView2) {
        _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(kWidth, 0 ,kWidth ,kHeight - 60) style:UITableViewStylePlain];
        _tableView2.delegate = self;
        _tableView2.dataSource = self;
    }
    return _tableView2;
}

- (UIScrollView *)titleScrollView {
    if (!_titleScrollView ) {
        _titleScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 300, kWidth, 30)];
        _titleScrollView.contentSize = CGSizeMake(kWidth, 30);
        _titleScrollView.backgroundColor = [UIColor blueColor];
    }
    return _titleScrollView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
