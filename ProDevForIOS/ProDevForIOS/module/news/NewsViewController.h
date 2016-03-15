//
//  NewsViewController.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/1.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomScrollMenu.h"
#import "News.h"

@interface NewsViewController :UIViewController
  @property (strong, nonatomic) NSArray * menusArray;
  @property (strong, nonatomic) NSArray * menusDataArray;
  @property (strong, nonatomic) CustomScrollMenu  *scrollMenu;
  @property (strong, nonatomic)  UITableView *tableView;
  @property (strong, nonatomic) NSMutableArray  *resultArray;
  @property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
  @property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@end
