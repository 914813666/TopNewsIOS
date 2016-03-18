//
//  ReactNewsController.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/18.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomScrollMenu.h"
@interface ReactNewsController : UIViewController<CustomScrollerMenuDelegate>
  @property (strong, nonatomic) CustomScrollMenu  *scrollMenu;
 @property (strong, nonatomic) NSArray * menusArray;
 @property (strong, nonatomic) NSArray * menusDataArray;
@end
