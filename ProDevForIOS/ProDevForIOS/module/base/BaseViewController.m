//
//  BaseViewController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "BaseViewController.h"
@interface BaseViewController (){
    UIButton *backButton;
}
@end
@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"ios7-arrow-left"] forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, kScaleNum(30), kScaleNum(30));
    [backButton addTarget:self action:@selector(didBackTaped) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
}
-(void)hideBack{
    [backButton setHidden:TRUE];
}
-(void)didBackTaped{
    [self.navigationController popViewControllerAnimated:TRUE];
}
@end
