//
//  ViewController.m
//  Video
//
//  Created by Yong Yang on 2017/6/26.
//  Copyright © 2017年 wly. All rights reserved.
//

#import "ViewController.h"
#import "TagViewViewController.h"
#import "FindShowbarViewController.h"
#import "ScrollAndTableViewController.h"
#import "WebWithHeaderViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

//@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArr = [[NSMutableArray alloc] initWithArray:@[ @"TagViewViewController",@"FindShowbarViewController",@"ScrollAndTableViewController",@"WebWithHeaderViewController"]];
    
    UITableView *tableviw = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    tableviw.delegate = self;
    tableviw.dataSource = self;
    [self.view addSubview:tableviw];
    

    
}

#pragma mark - tableviewdelegate 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [[NSClassFromString(_dataArr[indexPath.row]) alloc] init];

    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
