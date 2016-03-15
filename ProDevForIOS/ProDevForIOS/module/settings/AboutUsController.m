//
//  AboutUsController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "AboutUsController.h"
#import "Masonry.h"

@implementation AboutUsController
-(void)viewDidLoad{
    [super viewDidLoad];
    // 防止block中的循环引用
    int padding1 = 10;
    __weak typeof(self) weakSelf = self;
    UIView *greenview = [UIView new];
    greenview.backgroundColor = [UIColor greenColor];
    [weakSelf.view addSubview:greenview];
    
    UIView *blueview = [UIView new];
    greenview.backgroundColor = [UIColor blueColor];
    [weakSelf.view addSubview:blueview];
    
    UIView *redview = [UIView new];
    redview.backgroundColor = [UIColor redColor];
    [weakSelf.view addSubview:redview];
    
    UIView *grayview = [UIView new];
    grayview.backgroundColor = [UIColor grayColor];
    [weakSelf.view addSubview:grayview];
    
    [greenview mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.center.equalTo(weakSelf.self.view);
        make.top.mas_equalTo(padding1);
        make.left.mas_equalTo(padding1);
        make.right.mas_equalTo(@[redview.mas_left,blueview.mas_left]).offset(-padding1);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(@[redview,blueview]);
    }];
    [redview mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.center.equalTo(weakSelf.self.view);
        make.top.mas_equalTo(padding1);
        make.left.mas_equalTo(greenview.mas_right).offset(padding1);
        make.right.mas_equalTo(blueview.mas_left).offset(-padding1);
        make.top.height.mas_equalTo(greenview);
    }];
    [blueview mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.center.equalTo(weakSelf.self.view);
        make.top.mas_equalTo(padding1);
        make.left.mas_equalTo(@[greenview.mas_left,redview.mas_right]).offset(padding1);
        make.right.mas_equalTo(-padding1);
        make.top.height.mas_equalTo(redview);
    }];

}
@end
