//
//  Data.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/2/20.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "Shop.h"
#import "Content.h"

@implementation Shop
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"data" : Content.class};
}
@end
