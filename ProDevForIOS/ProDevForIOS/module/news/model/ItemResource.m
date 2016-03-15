//
//  Resource.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "ItemResource.h"
#import "ImageUrls.h"

@implementation ItemResource
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"images" : ImageUrls.class};
}@end
