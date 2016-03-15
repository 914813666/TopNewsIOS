//
//  NewsBrowserController.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface NewsBrowserController :BaseViewController <UIWebViewDelegate>
 @property (strong, nonatomic)  UIWebView *webView;
 @property (strong, nonatomic)  NSString *weburl;
 @property (strong, nonatomic)  NSString *webtitle;
@end
