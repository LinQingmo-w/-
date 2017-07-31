//
//  FindShowBarDetialViewController.m
//  TiZong
//
//  Created by Yong Yang on 2017/5/5.
//  Copyright © 2017年 huayu. All rights reserved.
//

#import "FindShowBarDetialViewController.h"
//v
#import "FindShowBarLiveTableViewCell.h"
#import "FindShowBarCommentTableViewCell.h"
#import "CircleCommentView.h"
//m
#import "ShowBarCommentModel.h"

static NSString * const LiveTableViewCellIdentifier =  @__STRING(FindShowBarLiveTableViewCell);
static NSString * const CommentTableViewCellIdentifier =  @__STRING(FindShowBarCommentTableViewCell);

@interface FindShowBarDetialViewController ()<UITableViewDelegate, UITableViewDataSource,CircleCommentViewProtocol,FindShowBarCommentCellProtocol>
//头视图
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIButton *focuseBtn;
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (nonatomic, retain)UITableView *tableView;
@property (strong, nonatomic)  CircleCommentView *bottomCommentView;//添加评论
@property (nonatomic, retain) NSMutableArray *dataSource;

@end

@implementation FindShowBarDetialViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //添加页面
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.bottomCommentView];
    [self.view addSubview:self.tableView];
    
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.right.top.equalTo(self.view);
        make.height.mas_equalTo(64);
    }];
    [self.bottomCommentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(44);
        
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.headerView.mas_bottom);
        make.bottom.equalTo(self.bottomCommentView.mas_top);
    }];
    
    //控件规范和国际化
    [self xibControlsStandardAndLocalizable];

    [self testDataSource];
}

- (void)testDataSource {
    ShowBarCommentModel *model1 = [[ShowBarCommentModel alloc] init];
    model1.replyCommnetArray = [[NSMutableArray alloc] initWithArray:@[@"张小花：哈哈哈哈哈哈哈哈" , @"林大雨：有没有一个人，坚强，独立，果决，美好，却让你心疼？" ,@"不管你有没有，我有了",@"遇到她的时候，她已经是凛然不可侵犯的样子，稍有触及，侵入她的领域，就会遭遇她竖起的刺，锋利，坚硬，能把人刺得鲜血淋漓。",@"我原本以为我是喜欢柔软温婉的女孩子的，矜持，端庄，如微风吹拂，杨柳依依，多么美好。",@"直到我见到她，才知道美好从来就不只一种样子。",@"不，也许美好以后就只有一种样子了，那就是她的样子。",@"我很难想象，果决和勇烈这种气质会出现在一个看起来软萌的姑娘身上。在面临抉择的时候，她也犹豫过，纠结过的吧，可最后她表现出来的那种勇气，让我这个男人汗颜。"]];
    [self.dataSource addObject:model1];
    
    ShowBarCommentModel *model2 = [[ShowBarCommentModel alloc] init];
    model2.replyCommnetArray = [[NSMutableArray alloc] initWithArray:@[@"陌上红尘，独自行走，谁负了你，你有亏欠了谁？也许一切早有定数，就在那个转身之间，注定了有些人只能用来怀念。你是人间的四月天，温润而不柔弱，坚强却不尖锐。",@"梦中江南，手撑着一把油纸伞，漫步在迷离的雨巷，邂逅那时你们的爱情。江南，是你们梦的起点，却也是你们的终点。原来所谓爱情，可以像江南的雨，细细绵绵，却在某个午后，轰轰烈烈，而后戛然而止。",@"江南，是你的故乡，在这座诗意的古城里，你是最美的风景。你宛若一朵白莲，亭亭而立，在这诗意的江南开出一片清白。",@"那一晚你和我分定了方向", @"两人各认取个生活的模样" , @"到如今我的船仍然在海面飘", @"细弱的桅杆常在风涛里摇",@"我一直相信，所有的爱情都是冥冥之中就已经注定的了，我爱你的画意诗情，你怜我的遗世独立。所以，林徽因才在花季的十六岁邂逅才子徐志摩，从此，两颗心便连结在一起，任凭时光撕扯，那份爱，一直都在。哪怕徐志摩已有家室，哪怕林徽因仍处花季。一开始爱得有多疯狂，到最后伤得就有多痛。都说初恋是无比美好的，自林徽因在伦敦邂逅徐志摩之后，便开始了一场爱的角逐。那时，时光静好，可以不顾世人的眼光，可以无视年龄的差别。也许，初恋的美好便是如此，我们无所顾忌，我们相见恨晚。青春，给了我们无限犯错的可能，人一旦失去了青春，就再也没资格去随心所欲。然而，初恋的残酷也是如此，没有生活的支撑，度得了昨天，爱得了今天，却走不到明天。"]];
    [self.dataSource addObject:model2];
    
    ShowBarCommentModel *model3 = [[ShowBarCommentModel alloc] init];
    model3.replyCommnetArray = [[NSMutableArray alloc] initWithArray:@[@"记得当时年纪小",@"你爱谈天我爱笑",@"有一回并肩坐在桃树下",@"风在林梢鸟儿在叫",@"我们不知怎样睡着了", @"梦里花落知多少 "]];
    [self.dataSource addObject:model3];
    
    ShowBarCommentModel *model4 = [[ShowBarCommentModel alloc] init];
    model4.replyCommnetArray = [[NSMutableArray alloc] initWithArray:@[@"夜阑卧听风吹雨",@"铁马冰河入梦来"]];
    [self.dataSource addObject:model4];
    
    [self.tableView reloadData];
}

#pragma mark - 点击事件
- (IBAction)focuseBtnClick:(UIButton *)sender {
}

- (IBAction)moreBtnClick:(UIButton *)sender {
}


#pragma mark - delegate
#pragma mark  tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count + 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        FindShowBarLiveTableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:LiveTableViewCellIdentifier forIndexPath:indexPath];
        return Cell;
    }
    FindShowBarCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CommentTableViewCellIdentifier forIndexPath:indexPath];
    cell.model = [self.dataSource objectAtIndex:indexPath.row - 1];
   
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return kHeight - 108;
    }
    return tableView.rowHeight;
}

#pragma mark  发布框delegate
- (void)commentViewHightChanged:(CGFloat)hight {
    [_bottomCommentView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(hight);
    }];
    UIColor *backgroundColor = [UIColor redColor];
    if (self.bottomCommentView.commentLable.text.length <= 0){
        backgroundColor = [UIColor grayColor];
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.bottomCommentView.commentSendBtn.backgroundColor = backgroundColor;
    }];
}

//添加评论
- (void)sendCommentText:(NSString *)textString {
    NSLog(@"snedComment:%@" , textString);
    [self.bottomCommentView.commentLable resignFirstResponder];
#warning 发表评论
    //发表成功后bottomView参数制空
//    self.bottomCommentView.bplrNicheng = nil;
//    self.bottomCommentView.bplrId = 0;
//    self.bottomCommentView.plid = nil;
}

#pragma mark - lazy
- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"FindShowBarDetialHeader" owner:self options:nil] lastObject];
    }
    return _headerView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 200;
        [_tableView registerNib:[UINib nibWithNibName:LiveTableViewCellIdentifier bundle:nil] forCellReuseIdentifier:LiveTableViewCellIdentifier];
        [_tableView registerNib:[UINib nibWithNibName:CommentTableViewCellIdentifier bundle:nil ] forCellReuseIdentifier:CommentTableViewCellIdentifier];
        
    }
    return _tableView;
}

- (CircleCommentView *)bottomCommentView {
    if (!_bottomCommentView) {
        _bottomCommentView = [[[NSBundle mainBundle] loadNibNamed:@"CircleCommentView" owner:nil options:nil] lastObject];
        _bottomCommentView.delegate = self;
    }
    return _bottomCommentView;
}
//xib控件规范和国际化
- (void)xibControlsStandardAndLocalizable {
    [_focuseBtn setTitle: @"+ 关注" forState:UIControlStateNormal];
    [_focuseBtn setTitle: @"已关注"  forState:UIControlStateSelected];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
    }
    return _dataSource;
}

#pragma mark  cellDelegate
- (void)moreCommentClickWithCell:(UITableViewCell *)cell {
    NSIndexPath *index = [self.tableView indexPathForCell:cell];
    ShowBarCommentModel *model = [self.dataSource objectAtIndex:index.row-1];
    model.isFold = NO;
    [self.tableView reloadData];
//    [self.tableView reloadRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationNone];
}


#pragma mark - 生命周期
- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
