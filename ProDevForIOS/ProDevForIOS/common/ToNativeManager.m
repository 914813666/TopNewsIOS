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
   RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location){
       dispatch_async(dispatch_get_main_queue(), ^{
           UITabBarController  *controller = (UITabBarController*)[[[UIApplication sharedApplication] keyWindow] rootViewController];
           AboutUsController *usController=[AboutUsController alloc];
           usController.hidesBottomBarWhenPushed=YES;
           [controller.navigationController pushViewController:usController animated:true ];
       });
}
@end
