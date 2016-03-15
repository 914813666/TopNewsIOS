//
//  NewsViewController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/1.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "NewsViewController.h"
#import "ItemResource.h"
#import "ListItem.h"
#import "TextUtils.h"
#import "CustomTableCellTableViewCell0.h"
#import "CustomTableCellTableViewCell.h"
#import "NewsBrowserController.h"

@interface NewsViewController()<UITableViewDataSource,UITableViewDelegate,CustomScrollerMenuDelegate>{
     NSInteger curIndex;
     NSString *curMax;
     NSMutableDictionary *params;
     News *news;
     UIFont *t12font;
     UIFont *t15font;
}
@end

@implementation NewsViewController
- (void)viewWillAppear:(BOOL)animated {
     [self.navigationController setNavigationBarHidden:YES];
     [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"00be9c"]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"资讯"];
    curIndex=0;
    curMax=@"0";
    t12font=[UIFont systemFontOfSize:12];
    t15font=[UIFont systemFontOfSize:15];
     _leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    _rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    _leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    _rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    _menusArray=@[@"推荐",@"新闻",@"视频",@"娱乐",@"科技",@"体育"];
    params=[NSMutableDictionary dictionaryWithCapacity:2];
    _menusDataArray=@[@"index/",@"news/",@"video/",@"entertainment/",@"tech/",@"sports/"];
    [self makeUI];
    [self fetchData:curMax type:6];

}
-(void)makeUI{
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    statusBarView.backgroundColor=[UIColor colorWithHexString:@"00be9c"];
    [self.view addSubview:statusBarView];
  
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"f0f0f0"]];
    //[self.navigationController setToolbarHidden:TRUE animated:TRUE];
     self.automaticallyAdjustsScrollViewInsets=NO;
    if(!_scrollMenu){
        _scrollMenu=[[CustomScrollMenu alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, 45) showArrayButton:NO];
         _scrollMenu.delegate=self;
        _scrollMenu.LineColor=[UIColor whiteColor];
        _scrollMenu.selectedColor=[UIColor blackColor];
        _scrollMenu.noSlectedColor=[UIColor whiteColor];
        _scrollMenu.backgroundColor=[UIColor colorWithHexString:@"00be9c"];
        _scrollMenu.myTitleArray=_menusArray;
        [self.view addSubview:_scrollMenu];
        _scrollMenu.currentIndex=curIndex;
    }
    _resultArray= [NSMutableArray array];
    [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT+_scrollMenu.bounds.size.height, SCREEN_WIDTH, SCREEN_HEIGHT - _scrollMenu.bounds.size.height - STATUS_BAR_HEIGHT) style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
               [self fetchData:@"0" type:6];
        }];
        _tableView.mj_header.automaticallyChangeAlpha = YES;
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
               [self fetchData:curMax type:20];
        }];
    }
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.showsVerticalScrollIndicator = NO;

}
- (void)itemDidSelectedWithIndex:(NSInteger)index{
    curIndex=index;
    curMax=@"0";
    [self fetchData:curMax type:6];
}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender{
    curMax=@"0";
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        if(curIndex<[_menusArray count]-1){
            curIndex++;
            [self fetchData:curMax type:6];
            
        }
    }
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
        if(curIndex>=1){
            curIndex--;
             [self fetchData:curMax type:6];
        }
    }
    [_scrollMenu setCurrentIndex:curIndex];
    
    
}
-(void)fetchData:(NSString*)max type:(NSInteger)type{
    NSString *neturl=[ZIXUN_GET_URL stringByAppendingString:_menusDataArray[curIndex]];
    neturl=[neturl stringByAppendingString:[NSString stringWithFormat:@"%ld",(long)type]];
    [params setObject:max forKey:@"beginid"];
     NSString *url=[HTTPHelper encodeurl:neturl Dict:params];
    [NetRequest NetRequestGETWithRequestURL:url WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        [self endRefresh];
        if ([max isEqual:@"0"]) {
            [_resultArray removeAllObjects];
        }
        news=[News yy_modelWithJSON:returnValue];
        curMax=news.data.lists.max;
        [_resultArray addObjectsFromArray: news.data.lists.lists];
        [_tableView reloadData];
    } WithErrorCodeBlock:^(id errorCode) {
        NSLog(@"%@",errorCode);
    }];
}
-(void)endRefresh{
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListItem *content=[_resultArray objectAtIndex:indexPath.row];
    if(content==nil){
        return nil;
    }
    static NSString* cellId0 = @"newsCell0";
    static NSString* cellId = @"newsCell";
    if([content.resource.images count]>1){
        CustomTableCellTableViewCell0* cell0 = [tableView
                                        dequeueReusableCellWithIdentifier:cellId0];
        
        if(cell0 == nil){
            cell0 = [[CustomTableCellTableViewCell0 alloc]
                     initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId0];
            cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell0 refreshCellData:content.resource];
        return cell0;
    }
    else if([content.resource.images count]==1){
        
        CustomTableCellTableViewCell* cell = [tableView
                                        dequeueReusableCellWithIdentifier:cellId];
       
        if(cell == nil){
            cell = [[CustomTableCellTableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        [cell refreshCellData:content.resource];
        return cell;
    }else{
        return nil;
    }
    //cell.layer.cornerRadius = 12;
    //cell.layer.masksToBounds = YES;
}

- (NSInteger)tableView:(UITableView*)tableView
 numberOfRowsInSection:(NSInteger)section{
    
    return _resultArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:
(NSIndexPath *)indexPath{
    ListItem *content=[_resultArray objectAtIndex:indexPath.row];
    if([content.resource.images count]>1){
        return SCREEN_WIDTH/3+[TextUtils getActualCGSize:content.resource.title font:t15font].height+[TextUtils getActualCGSize:content.resource.source font:t12font].height+5;
    }else if([content.resource.images count]==1){
          return SCREEN_WIDTH/3+1;
    }else{
        return kScaleNum(80);
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ListItem *content=[_resultArray objectAtIndex:indexPath.row];
    NewsBrowserController *browserController=[NewsBrowserController alloc];
    browserController.weburl=content.id;
    browserController.webtitle=content.resource.title;
    browserController.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:browserController animated:TRUE];
}

@end
