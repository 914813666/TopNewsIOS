//
//  AboutUsController.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "BaseViewController.h"

@interface AboutUsController : BaseViewController<UIScrollViewDelegate>
  @property (strong, nonatomic) NSArray * views;
  @property (strong, nonatomic) NSArray * views_1;
  @property (strong, nonatomic) UIScrollView * scrollView;
@end
