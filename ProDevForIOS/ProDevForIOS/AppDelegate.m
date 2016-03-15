//
//  AppDelegate.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/2/19.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "UIColor+Hex.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    _window.backgroundColor =[UIColor colorWithHexString:@"#f0f0f0"];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHexString:@"#ffffff"]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    HomeViewController *splashController=[[HomeViewController alloc]init];
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:splashController];
    [_window setRootViewController:navigationController];
    [_window makeKeyAndVisible];
    // 监听网络状态改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange) name:kReachabilityChangedNotification object:nil];
    // 创建Reachability
    self.conn = [Reachability reachabilityForInternetConnection];
    [self.conn startNotifier];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)networkStateChange
{
    // 1.检测wifi状态
    Reachability *wifi = [Reachability reachabilityForLocalWiFi];
    
    // 2.检测手机是否能上网络(WIFI\3G\2.5G)
    Reachability *conn = [Reachability reachabilityForInternetConnection];

    // 3.判断网络状态
    if ([wifi currentReachabilityStatus] != NotReachable) { // 有wifi
        NSLog(@"有wifi");
    } else if ([conn currentReachabilityStatus] != NotReachable) {
        // 没有使用wifi, 使用手机自带网络进行上网
        NSLog(@"使用手机自带网络进行上网");
    } else { // 没有网络
        NSLog(@"没有网络");
    }
}
//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url { // 只要下面的方法使用了，便不会再度调用这个方法，下个方法就是为了替代当前方法而来的
//    NSLog(@"调用些方法%s",__FUNCTION__);
//    return NO; // no 也可以打开，有问题
//}

//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    // 从其他app内打开本app会调用本app的此方法
//    NSLog(@"调用了方法%s",__FUNCTION__);
//    return NO;
//}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
@end
