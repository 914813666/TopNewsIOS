//
//  SettingsGroupItem.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/14.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "SettingsGroupItem.h"

@implementation SettingsGroupItem
+ (instancetype)itemWithtitle:(NSString *)title imageName:(NSString*)name{
    SettingsGroupItem *item = [[SettingsGroupItem alloc]init];
    item.imageName=name;
    item.title = title;
    return item;
}
@end
