//
//  ReactController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/16.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "ReactController.h"
#import "Masonry.h"
#import "RCTRootView.h" 
#import "SSZipArchive.h"
@interface ReactController(){
    UIButton *button;
    
}@end
@implementation ReactController
-(void)viewDidLoad{
    
    [super viewDidLoad];
    #if defined(DEBUG)
     [self download];
    #endif
   
    
}
-(void)download{
    WS(weakself)
    [NetRequest NetRequestDownloadWithRequestURL:@"http://192.168.7.43:8080/MobileSpringMVC/files/news_jsbundle.zip" WithParameter:nil WithReturnValeuBlock:^(id returnValue) {
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
        NSString* unzipfrom = [documentpath stringByAppendingFormat:@"%@%@",@"/",returnValue];
        
        NSRange range = [returnValue rangeOfString:@"."];
        NSString * result = [returnValue substringToIndex:range.location];NSString* unzipto = [documentpath stringByAppendingFormat:@"%@%@",@"/",result];
        
        [SSZipArchive unzipFileAtPath:unzipfrom toDestination:unzipto];
        [weakself initReactModule:result];
        
    } WithErrorCodeBlock:^(id errorCode) {
        
    }];
}
-(void)initReactModule:(NSString*)filename{
    WS(weakself)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentpath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString* unzipto = [documentpath stringByAppendingFormat:@"%@%@",@"/",filename];

    NSBundle *bundle=[NSBundle bundleWithPath:unzipto];
    NSURL *jsCodeLocation= [bundle URLForResource:@"news.ios" withExtension:@"jsbundle"];
    NSLog(@"%@", [bundle resourcePath]);
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                        moduleName:@"topnews"
                                                 initialProperties:nil
                                                     launchOptions:nil];
    //rootView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_BAR_HEIGHT-NAVIGATION_BAR_HEIGHT);
    rootView.appProperties = @{@"iosnativevaule" :@"From IosNative value" };
    [self.view addSubview:rootView];
    [rootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT-STATUS_BAR_HEIGHT-NAVIGATION_BAR_HEIGHT);
        make.top.equalTo(weakself.view);
    }];

}
@end
