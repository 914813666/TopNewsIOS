//
//  SettingsViewController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/1.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsGroupItem.h"
#import "MMPopupItem.h"
#import "MMAlertView.h"
#import "MMSheetView.h"
#import "MMPinView.h"
#import "MMDateView.h"
#import "MMPopupWindow.h"
#import "AboutUsController.h"
@interface SettingsViewController()
    

@end
@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:@"我的"];
    [self makeUI];
    [self initConfig];
    [self fetchData];
    
}
-(void)makeUI{
    [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, STATUS_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT - TAB_BAR_HEIGHT - STATUS_BAR_HEIGHT) style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
    }
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.showsVerticalScrollIndicator = NO;
}
-(void)fetchData{
    if (!_groups) {
        _groups = [NSMutableArray array];
    }
    [self setGroup1];
    [self setGroup2];
    [self setGroup3];
    [_tableView reloadData];
}
-(void)initConfig{
    //    [[MMPopupWindow sharedWindow] cacheWindow];
    [MMPopupWindow sharedWindow].touchWildToHide = YES;
    
    MMAlertViewConfig *alertConfig = [MMAlertViewConfig globalConfig];
    MMSheetViewConfig *sheetConfig = [MMSheetViewConfig globalConfig];
    
    alertConfig.defaultTextOK = @"确定";
    alertConfig.defaultTextCancel = @"取消";
    alertConfig.defaultTextConfirm = @"确认";
    
    sheetConfig.defaultTextCancel = @"取消";
}
- (void)setGroup1{
    SettingsGroupItem *group = [[SettingsGroupItem alloc]init];
    SettingsGroupItem *item = [SettingsGroupItem itemWithtitle:@"我的账号" imageName:@"ios7-contact-outline"];
    SettingsGroupItem *item1 = [SettingsGroupItem itemWithtitle:@"我的消息" imageName:@"ios7-bell-outline"];
    SettingsGroupItem *item2 = [SettingsGroupItem itemWithtitle:@"我的收藏"
                                imageName:@"ios7-star-outline"];
    group.items = @[item,item1,item2];
    [_groups addObject:group];
}

- (void)setGroup2{
    
    SettingsGroupItem *group = [[SettingsGroupItem alloc]init];
    SettingsGroupItem *item = [SettingsGroupItem itemWithtitle:@"立即分享" imageName:@"ios7_share"];
    SettingsGroupItem *item1 = [SettingsGroupItem itemWithtitle:@"我去好评" imageName:@"ios7-flag-outline"];
    SettingsGroupItem *item2 = [SettingsGroupItem itemWithtitle:@"关于我们" imageName:@"ios7-help-outline"];
    group.items = @[item,item1,item2];
    [_groups addObject:group];
}

- (void)setGroup3{
    
    SettingsGroupItem *group = [[SettingsGroupItem alloc]init];

    SettingsGroupItem *item = [SettingsGroupItem itemWithtitle:@"退出登录" imageName:@""];
    group.items = @[item];
    [_groups addObject:group];
}

/**
 *  返回有多少组的代理方法
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _groups.count;
}
/**
 *  返回每组有多少行的代理方法
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    SettingsGroupItem *group = _groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"settingscell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell  = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
  
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    SettingsGroupItem *group = _groups[indexPath.section];
    SettingsGroupItem *item = group.items[indexPath.row];
    if(![item.imageName isEqual:@""]&&item.imageName!=nil){
        [cell.imageView setImage:[UIImage imageNamed:item.imageName]];
    }
    cell.textLabel.text = item.title;
    
    return cell;
}
- ( CGFloat )tableView:( UITableView *)tableView heightForHeaderInSection:( NSInteger )section{

    return 2.0 ;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MMPopupItemHandler block = ^(NSInteger index){
        NSLog(@"clickd %@ button",@(index));
    };
    MMPopupCompletionBlock completeBlock = ^(MMPopupView *popupView, BOOL finished){
        NSLog(@"animation complete");
    };
    if(indexPath.section==0){
        if(indexPath.row==0){
            NSArray *items =
            @[MMItemMake(@"微信", MMItemTypeNormal, block),
              MMItemMake(@"QQ", MMItemTypeHighlight, block),
              MMItemMake(@"微博", MMItemTypeNormal, block)];
            MMAlertView *alertView = [[MMAlertView alloc] initWithTitle:@"账号"
                detail:@"您可以使用微信,QQ,微博来登录,获取更好的服务!"
                        items:items];
            alertView.attachedView = self.view;
            alertView.attachedView.mm_dimBackgroundBlurEnabled = YES;
            alertView.attachedView.mm_dimBackgroundBlurEffectStyle = UIBlurEffectStyleLight;
            [alertView show];
        }
    }
    if(indexPath.section==1){
        if(indexPath.row==0){
            NSArray *items =
            @[MMItemMake(@"微信", MMItemTypeNormal, block),
              MMItemMake(@"朋友圈", MMItemTypeNormal, block),
              MMItemMake(@"QQ好友", MMItemTypeNormal, block)];
            
            MMSheetView *sheetView = [[MMSheetView alloc] initWithTitle:@"分享"
                                items:items];
            sheetView.attachedView = self.view;
            sheetView.attachedView.mm_dimBackgroundBlurEnabled = NO;
            [sheetView showWithBlock:completeBlock];
        }
    }
    if(indexPath.section==1){
        if(indexPath.row==2){
            AboutUsController *usController=[AboutUsController alloc];
            [self.navigationController pushViewController:usController animated:YES];
        }
    }

}

@end