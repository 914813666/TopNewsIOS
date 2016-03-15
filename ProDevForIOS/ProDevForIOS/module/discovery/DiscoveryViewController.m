//
//  DiscoveryViewController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/1.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "DiscoveryViewController.h"
#import "Shop.h"
#import "Content.h"
#import "DiscoveryTableCellTableViewCell.h"

@interface DiscoveryViewController()
{
    Shop *shop;
    NSInteger c_page;
    NSMutableDictionary *params;
}
@end
@implementation DiscoveryViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"最新发现"];
    [self makeUi];
    params=[NSMutableDictionary dictionaryWithCapacity:5];
    c_page=1;
    [self fetchData:c_page];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)makeUi{
    _resultArray= [NSMutableArray array];
    [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - TAB_BAR_HEIGHT - STATUS_BAR_HEIGHT) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            c_page=1;
            [self fetchData:c_page];
        }];
        _tableView.mj_header.automaticallyChangeAlpha = YES;
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            c_page++;
           [self fetchData:c_page];
        }];
    }
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.showsVerticalScrollIndicator = NO;
    /*if (!_bgView) {
     _bgView=[[CornerBgView alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 100)];
     [_bgView setBackgroundColor:[UIColor whiteColor]];
     [[_bgView layer] setCornerRadius:5];
     [[_bgView layer] setMasksToBounds:YES];
     [self.view addSubview:_bgView];
     }
     if (!_account) {
     _account=[[UITextField alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-40, 50)];
     _account.backgroundColor=[UIColor whiteColor];
     _account.layer.cornerRadius=5.0;
     _account.placeholder=[NSString stringWithFormat:@"Email"];
     [_bgView addSubview:_account];
     }
     if (!_password) {
     _password=[[UITextField alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-40, 50)];
     _password.backgroundColor=[UIColor whiteColor];
     _password.layer.cornerRadius=5.0;
     _password.placeholder=[NSString stringWithFormat:@"Password"];
     [_bgView addSubview:_password];
     }
     if(!_loginButton){
     _loginButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
     [_loginButton setFrame:CGRectMake(20, 320, self.view.frame.size.width-40, 50)];
     [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
     [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
     [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
     [self.view  addSubview:_loginButton];
     [_loginButton addTarget:self action:@selector(loginTaped) forControlEvents:UIControlEventTouchUpInside];
     }*/
}

-(void)fetchData:(NSInteger)page{
     NSString *neturl=@"http://ald.taobao.com/recommend.htm";
     [params setObject:@"03507" forKey:@"appId"];
     [params setObject:@"330100" forKey:@"areaId"];
     [params setObject:@"15" forKey:@"size"];
     [params setObject:@(page) forKey:@"page"];
     [params setObject:@"1" forKey:@"type"];
    
    NSString *url=[HTTPHelper encodeurl:neturl Dict:params];
    [NetRequest NetRequestGETWithRequestURL:url WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        [self endRefresh];
        if (page==1) {
            [_resultArray removeAllObjects];
        }
        shop=[Shop yy_modelWithJSON:returnValue];
        [_resultArray addObjectsFromArray: shop.data];
        [_tableView reloadData];
    } WithErrorCodeBlock:^(id errorCode) {
        
    }];
}
-(void)endRefresh{
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellId = @"shopCell";
    DiscoveryTableCellTableViewCell* cell = [tableView
                                          dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil)
    {
        cell = [[DiscoveryTableCellTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.layer.cornerRadius = 12;
    //cell.layer.masksToBounds = YES;
    Content *content=[_resultArray objectAtIndex:indexPath.row];
    [cell refreshCellData:content];
    return cell;
}

- (NSInteger)tableView:(UITableView*)tableView
numberOfRowsInSection:(NSInteger)section{
    
    return _resultArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:
(NSIndexPath *)indexPath{
    
    return kScaleNum(100);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_resultArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  @"删除";
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
}

-(void)dealloc{
    
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

