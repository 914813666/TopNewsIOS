//
//  SettingsGroupItem.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/14.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingsGroupItem : NSObject

@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * imageName;
@property (strong, nonatomic) NSArray * items;
@property (assign, nonatomic) NSUInteger * type;

+ (instancetype)itemWithtitle:(NSString *)title imageName:(NSString*)name;
@end
