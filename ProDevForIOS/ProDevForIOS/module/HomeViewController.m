//
//  HomeViewController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/1.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "HomeViewController.h"
#import "SettingsViewController.h"
#import "DiscoveryViewController.h"
#import "ReactNewsController.h"
#import "AppDelegate.h"
@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initRootViewControllerWithTabbar];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavBarStyle];
    [self initTabbarStyle];
}

-(void)initRootViewControllerWithTabbar
{
    DiscoveryViewController *discoveryPage = [[DiscoveryViewController alloc] init];
    [discoveryPage.tabBarItem setImage:[[UIImage imageNamed:@"ios7-lightbulb-outline"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [discoveryPage.tabBarItem setSelectedImage:[[UIImage imageNamed:@"ios7-lightbulb"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [discoveryPage.tabBarItem setTitle:@"发现"];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:discoveryPage];
    
    ReactNewsController *newsPage = [[ReactNewsController alloc] init];
    [newsPage.tabBarItem setImage:[[UIImage imageNamed:@"ios7-paper-outline"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [newsPage.tabBarItem setSelectedImage:[[UIImage imageNamed:@"ios7-paper"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [newsPage.tabBarItem setTitle:@"资讯"];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:newsPage];

    SettingsViewController *settingsPage = [[SettingsViewController alloc] init];
    [settingsPage.tabBarItem setImage:[[UIImage imageNamed:@"ios7-settings-outline"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [settingsPage.tabBarItem setSelectedImage:[[UIImage imageNamed:@"ios7-settings"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [settingsPage.tabBarItem setTitle:@"我的"];
    
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:settingsPage];
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.tabbarController = [[UITabBarController alloc] init];
    //appDelegate.tabbarController.tabBar.backgroundImage = [UIImage imageNamed:@"tabbarback"];
    [appDelegate.tabbarController.tabBar setTranslucent:NO];
    appDelegate.tabbarController.delegate = appDelegate;
    appDelegate.tabbarController.viewControllers = @[nav1,nav2,nav3];
    [appDelegate.tabbarController setSelectedViewController:nav1];
    appDelegate.window.rootViewController = appDelegate.tabbarController;
}
-(void)initNavBarStyle{
    [[UINavigationBar appearance] setBarTintColor:NAV_BG_COLOR];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackTranslucent];
}

-(void)initTabbarStyle
{
    UIColor *titleHighlightColor = [UIColor grayColor];
    UIColor *titleSelectColor =[UIColor blackColor] ;
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleHighlightColor,NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleSelectColor, NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
}
-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end
