//
//  DiscoveryViewController.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/1.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DiscoveryViewController : UIViewController<UITableViewDataSource
, UITableViewDelegate>
//@property (nonatomic,strong) UITextField *account;
//@property (nonatomic,strong) UITextField *password;
//@property (nonatomic,strong) UIButton *loginButton;
//@property (nonatomic,strong) CornerBgView *bgView;
@property (strong, nonatomic)  UITableView *tableView;
@property (nonatomic, strong) NSMutableArray  *resultArray;

@end
