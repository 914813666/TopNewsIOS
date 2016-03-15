//
//  News.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Datas.h"
@interface News : NSObject
@property (assign, nonatomic) NSInteger status;
@property (strong, nonatomic) NSString *msg;
@property (strong, nonatomic) Datas *data;
@end
