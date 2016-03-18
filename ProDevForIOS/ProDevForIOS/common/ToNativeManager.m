//
//  ToNativeManager.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/18.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "ToNativeManager.h"
#import "AboutUsController.h"

@implementation ToNativeManager
   RCT_EXPORT_MODULE();
   RCT_EXPORT_METHOD(postNotification:(NSString *)notifiname params:(NSDictionary *)params){
    [[NSNotificationCenter defaultCenter] postNotificationName:notifiname object:self userInfo:params];
}

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
@end
