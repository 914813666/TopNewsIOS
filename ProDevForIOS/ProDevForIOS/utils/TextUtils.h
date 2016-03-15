//
//  TextUtils.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TextUtils : NSObject
+(void)ajustUILable:(UILabel*)_label text:(NSString*)_text font:(UIFont*)_font x:(CGFloat)x y:(CGFloat)y w:(CGFloat)w h:(CGFloat)h;
+(CGSize)getActualCGSize:(NSString*)text font:(UIFont *)font;
@end
