//
//  ListItem.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ItemResource.h"
@interface ListItem : NSObject
@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) ItemResource *resource;
@end
