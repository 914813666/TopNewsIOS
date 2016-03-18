//
//  ReactNewsController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/18.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "ReactNewsController.h"
#import "SSZipArchive.h"
#import "Masonry.h"
#import "RCTRootView.h"
#import "NewsBrowserController.h"
@interface ReactNewsController(){
    RCTRootView *rootView;
    NSInteger curIndex;
}@end

@implementation ReactNewsController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithHexString:@"00be9c"]];
}

-(void)viewDidLoad{
    
    [super viewDidLoad];
   #if defined(DEBUG)
    [self initMenu];
    [self makeUI];
    [self download];
   #endif
}
-(void)makeUI{
    curIndex=0;
     [self.navigationItem setTitle:@"资讯"];
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
    }
       _scrollMenu.currentIndex=curIndex;
     //WS(weakself)
}
-(void)initMenu{
    _menusArray=@[@"推荐",@"新闻",@"视频",@"娱乐",@"科技",@"体育"];
    _menusDataArray=@[@"index",@"news",@"video",@"entertainment",@"tech",@"sports"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"notificationFReact" object:nil];
}
-(void)download{
    WS(weakself)
    [NetRequest NetRequestDownloadWithRequestURL:@"http://localhost:8080/MobileSpringMVC/files/news_jsbundle.zip" WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        NSString* unzipfrom = [documentpath stringByAppendingFormat:@"%@%@",@"/",returnValue];
        
        NSRange range = [returnValue rangeOfString:@"."];
        NSString * result = [returnValue substringToIndex:range.location];
        NSString* unzipto = [documentpath stringByAppendingFormat:@"%@%@",@"/",result];
        
        [SSZipArchive unzipFileAtPath:unzipfrom toDestination:unzipto];
        [weakself initReactModule:result];
        
    } WithErrorCodeBlock:^(id errorCode) {
        
    }];
}
-(void)initReactModule:(NSString*)filename{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString* unzipto = [documentpath stringByAppendingFormat:@"%@%@",@"/",filename];
    
    NSBundle *bundle=[NSBundle bundleWithPath:unzipto];
    NSURL *jsCodeLocation= [bundle URLForResource:@"news.ios" withExtension:@"jsbundle"];
    NSLog(@"%@", [bundle resourcePath]);
    rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"topnews"
                                    initialProperties:@{@"newsid":@"index"}
                                                     launchOptions:nil];
    [self.view addSubview:rootView];
    [rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT-TAB_BAR_HEIGHT-_scrollMenu.frame.size.height);
        make.top.equalTo(_scrollMenu.mas_bottom);
    }];
}
- (void)itemDidSelectedWithIndex:(NSInteger)index{
    NSLog(@"%ld",(long)index);
    if(curIndex!=index){
         rootView.appProperties = @{@"newsid" :_menusDataArray[index] };
    }
     curIndex=index;
    
}
-(void)handleNotification:(NSNotification*)notification{
    NSString *newsid = [[notification userInfo] valueForKey:@"newsid"];
    NSString *title = [[notification userInfo] valueForKey:@"title"];
    dispatch_async(dispatch_get_main_queue(), ^{
        NewsBrowserController *broserNews=[NewsBrowserController alloc];
        broserNews.weburl=newsid;
        broserNews.webtitle=title;
        broserNews.hidesBottomBarWhenPushed=YES;
        [self.navigationController pushViewController:broserNews animated:YES];
    });

   
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"notificationFReact" object:nil];
}
@end
