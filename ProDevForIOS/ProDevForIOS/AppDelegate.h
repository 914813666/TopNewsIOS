//
//  AppDelegate.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/2/19.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) Reachability *conn;
@property (strong, nonatomic) UITabBarController *tabbarController;
@property (strong, nonatomic) UINavigationController *navController;
@end

