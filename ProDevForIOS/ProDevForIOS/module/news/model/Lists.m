//
//  Lists.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "Lists.h"
#import "ListItem.h"
@implementation Lists
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"lists" : ListItem.class};
}
@end
