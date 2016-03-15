//
//  TextUtils.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "TextUtils.h"

@implementation TextUtils
+(void)ajustUILable:(UILabel*)_label text:(NSString*)_text font:(UIFont*)_font x:(CGFloat)x y:(CGFloat)y w:(CGFloat)w h:(CGFloat)h{
    CGFloat width=0;
    CGFloat height=0;
    _label.numberOfLines = 4;
    _label.font=_font;
    _label.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = CGSizeMake(320.f, MAXFLOAT);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_font,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize  actualsize =[_text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    // ios7之前使用方法获取文本需要的size，7.0已弃用下面的方法。此方法要求font，与breakmode与之前设置的完全一致
    /* CGSize actualsize = [tstring sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByCharWrapping];*/
    if(w!=0&&actualsize.width>w){
        width=w;
    }else{
        width=actualsize.width;
    }
    if(h!=0){
        height=h;
    }else{
        height=actualsize.height;
    }
    _label.frame =CGRectMake(x,y,width,height);
    
}
+(CGSize)getActualCGSize:(NSString*)_text font:(UIFont *)_font{
    CGSize size = CGSizeMake(320.f, MAXFLOAT);
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:_font,NSFontAttributeName,nil];
    //ios7方法，获取文本需要的size，限制宽度
    CGSize  actualsize =[_text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    return actualsize;
}
@end
