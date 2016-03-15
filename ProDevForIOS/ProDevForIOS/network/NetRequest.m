//
//  NetRequest.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/1.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "NetRequest.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "KVNProgress.h"

@implementation NetRequest
#pragma --mark GET请求方式
+ (void) NetRequestGETWithRequestURL: (NSString *) requestURLString
                       WithParameter: (NSDictionary *) parameter
                WithReturnValeuBlock: (ReturnValueBlock) block
                  WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [KVNProgress show];
    [KVNProgress showWithStatus:@"加载中..."];
    AppDelegate *appDlg = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSParameterAssert([appDlg.conn isKindOfClass: [Reachability class]]);
    NetworkStatus status = [appDlg.conn currentReachabilityStatus];
    if (status == NotReachable) {
        [KVNProgress dismiss];
        errorBlock(@"无网络连接!");
        return;
    }
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager GET:requestURLString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [KVNProgress dismiss];
        block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [KVNProgress dismiss];
        NSLog(@"%@",error.description);
        errorBlock(error.description);
    }];
}

#pragma --mark POST请求方式

+ (void) NetRequestPOSTWithRequestURL: (NSString *) requestURLString
                        WithParameter: (NSDictionary *) parameter
                 WithReturnValeuBlock: (ReturnValueBlock) block
                   WithErrorCodeBlock: (ErrorCodeBlock) errorBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.securityPolicy.allowInvalidCertificates = YES;
    //[manager.securityPolicy setValidatesDomainName:NO];
    AppDelegate *appDlg = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSParameterAssert([appDlg.conn isKindOfClass: [Reachability class]]);
    NetworkStatus status = [appDlg.conn currentReachabilityStatus];
    if (status == NotReachable) {
        //[KVNProgress dismiss];
        return;
    }
    [manager POST:requestURLString parameters:parameter constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         block(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         errorBlock(error);
    }];
    
}@end
