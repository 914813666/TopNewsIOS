//
//  NewsBrowserController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "NewsBrowserController.h"

@implementation NewsBrowserController

- (void)viewWillAppear:(BOOL)animated {
   [self.navigationController setNavigationBarHidden:NO];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    [self makeUI];
    _weburl=[@"http://m.yergoo.com/api/news/app/" stringByAppendingString:_weburl];
    NSURL *URL=[NSURL URLWithString:_weburl];
    [_webView loadRequest:[ NSURLRequest requestWithURL: URL ]];
}
-(void)makeUI{
    [self.view setBackgroundColor:[UIColor colorWithHexString:@"f0f0f0"]];
    //self.automaticallyAdjustsScrollViewInsets=NO;
    if(!_webView){
        _webView=[[UIWebView alloc] initWithFrame:CGRectMake(0, NAVIGATION_BAR_HEIGHT-TAB_BAR_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_BAR_HEIGHT-NAVIGATION_BAR_HEIGHT)];
        _webView.delegate=self;
        [self.view addSubview:_webView];
        [_webView  setUserInteractionEnabled: YES ];

    }
}
//当网页视图已经开始加载一个请求之后得到通知
- (void) webViewDidStartLoad:(UIWebView  *)webView {
   
}

//当网页视图结束加载一个请求之后得到通知
- (void) webViewDidFinishLoad:(UIWebView *)webView{
 
}

@end
