//
//  Constants.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/2/19.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#define IsIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >=7.0 ? YES : NO)

#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(640, 960),  [[UIScreen mainScreen] currentMode].size) : NO)

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(640, 1136),  [[UIScreen mainScreen] currentMode].size) : NO)

#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define TAB_BAR_HEIGHT					49
#define SEARCH_BAR_HEIGHT				44
#define NAVIGATION_BAR_HEIGHT           44
#define STATUS_BAR_HEIGHT               20
#define SCREEN_SCALE                    (SCREEN_WIDTH/320.f)
#define kScaleNum(x)                    x*SCREEN_SCALE
#define NAV_BG_COLOR [UIColor colorWithHexString:@"#00be9c"]
#define ARROW_BUTTON_WIDTH 44
typedef void (^ReturnValueBlock) (id returnValue);
typedef void (^ErrorCodeBlock) (id errorCode);

typedef void (^ReturnDataBlock) (id returnData);
typedef void (^ErrorDataBlock) (id errorData);

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion ([[UIDevice currentDevice] systemVersion])
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])
//格式化字符串的简写方式
#define StrFMT(fmt, ...)    [NSString stringWithFormat:(fmt),##__VA_ARGS__]
//取图的简写方式
#define IMG(imageName) [UIImage imageNamed:imageName]
#define WEAKSELF __weak __typeof(&*self)weakSelf = self;
#define STRONGSELF typeof(weakSelf) __strong strongSelf = weakSelf;
#define SafeGetDictionaryValue(object) ([object isKindOfClass:[NSDictionary class]]?object:nil)//判断是否字典安全
#define SafeGetStringValue(object) (object!=nil && ![object isKindOfClass:[NSNull class]])?([object isKindOfClass:[NSString class]]?object:[object stringValue]):@""//判断是否字符串安全
#define SafeGetAddStringValue(object) (object!=nil && ![object isKindOfClass:[NSNull class]])?([object isKindOfClass:[NSString class]]?object:[object stringValue]):@"无法解析您的数据"
#define SafeGetArrayValue(object) ([object isKindOfClass:[NSArray class]]?object:nil)//判断数组安全

#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define JD_RELEASE_SAFELY(__POINTER) { if ([__POINTER respondsToSelector:@selector(setDelegate:)]) {\
[__POINTER performSelector:@selector(setDelegate:) withObject:nil];\
} \
if ([__POINTER respondsToSelector:@selector(setDataSource:)]) {\
[__POINTER performSelector:@selector(setDataSource:) withObject:nil];\
} \
[__POINTER release]; __POINTER = nil; }


#define JD_ARC_RELEASE_SAFELY(__POINTER) { if ([__POINTER respondsToSelector:@selector(setDelegate:)]) {\
[__POINTER performSelector:@selector(setDelegate:) withObject:nil];\
} \
if ([__POINTER respondsToSelector:@selector(setDataSource:)]) {\
[__POINTER performSelector:@selector(setDataSource:) withObject:nil];\
} \
__POINTER = nil; }

#define BASE_URL @"http://m.yergoo.com/"
#define ZIXUN_GET_URL @"http://m.yergoo.com/api/news/app/lists/"
