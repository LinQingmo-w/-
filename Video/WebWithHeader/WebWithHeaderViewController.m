//
//  WebWithHeaderViewController.m
//  Video
//
//  Created by Yong Yang on 2017/7/31.
//  Copyright © 2017年 wly. All rights reserved.
//

#import "WebWithHeaderViewController.h"
#import "WebHeaderView.h"

@interface WebWithHeaderViewController ()<UIScrollViewDelegate,UIWebViewDelegate>

@property (nonatomic, retain) UIWebView *web;
@property (nonatomic, retain) WebHeaderView *headerView;
@end

@implementation WebWithHeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight )];
    [_web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.apple.com"]]];
    /* 加载本地 */
//     NSString *pathFile = [[NSBundle mainBundle] pathForResource:@"myH5" ofType:@"html"];
//     NSString *htmlString = [NSString stringWithContentsOfFile:pathFile encoding:NSUTF8StringEncoding error:nil];
//     [_web loadHTMLString:htmlString baseURL:nil];
//    [_web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:pathFile]]];
     /* */
    _web.delegate = self;
    [self.view addSubview:_web];
    
    //添加随着滑动的端头
    //webView可以滑动时因为它有一个scrollview属性，因此可以修改这个属性,添加额外滚动区域的内容
    _web.scrollView.contentInset = UIEdgeInsetsMake(240, 0, 0, 0);
    _web.scrollView.delegate = self;
    //创建这个页面
    _headerView = [WebHeaderView loadViewWithNib];
    _headerView.frame = CGRectMake(0, -240, kWidth, 240);
    [_web.scrollView addSubview:_headerView];
    
}

#pragma mark - webView delegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"url : %@", request.URL);
    if (![request.URL.absoluteString  isEqualToString:@"https://www.apple.com/"]  ) {
        if ([webView.scrollView.subviews containsObject:_headerView]) {
            webView.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            [_headerView removeFromSuperview];
        }
        webView.scrollView.contentOffset = CGPointZero;
    } else {
        if (![webView.scrollView.subviews containsObject:_headerView]) {
            webView.scrollView.contentInset = UIEdgeInsetsMake(240, 0, 0, 0);
            [webView.scrollView addSubview:_headerView];
        }
        
    }
    return YES;
}
#pragma mark - scrollView 头标题显示修改
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //导航栏透明度
    CGFloat minAlphaOffset = -240;
    CGFloat maxAlphaOffset = 64 - 240;
    CGFloat offset = scrollView.contentOffset.y;
    
    CGFloat alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset);
    self.navigationController.navigationBar.subviews.firstObject.alpha = alpha;

  //段头下拉放大效果
    if (scrollView.contentOffset.y <= (240 + 64)) {
        _headerView.frame = CGRectMake(0, scrollView.contentOffset.y, kWidth, -scrollView.contentOffset.y);
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = YES;
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    if (self.web.scrollView.contentOffset.y < (64 - 240)) {
        self.navigationController.navigationBar.subviews.firstObject.alpha = 0;
    } else {
        self.navigationController.navigationBar.subviews.firstObject.alpha = 1;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.subviews.firstObject.alpha = 1;
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
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
