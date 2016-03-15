//
//  CustomAlertView.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/14.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomAlertView : UIView
typedef enum {
    IDisplayerPositionTypeCenter = 0, //类似AlertView(默认)
    IDisplayerPositionTypeBottom = 1, //类似ActionSheet
}IDisplayerPositionType;

typedef enum {
    IDisplayerShowTypeBounce  = 0, //弹簧效果(默认) /不支持-> IGDisplayerPositionTypeBottom
    IDisplayerShowTypeDrawer  = 1, //划出效果
}IDisplayerShowType;

typedef void (^ displayerActionBlock)(CustomAlertView *displayer , NSInteger index);

//主视图
@property (nonatomic,strong) UIView *displayer;
//标题控件
@property (nonatomic,strong) UILabel *titleLabel;
//内容控件
@property (nonatomic,strong) UILabel *textLabel;
//自定义内容控件
@property (nonatomic,strong) UIView *customView;

@property (nonatomic,strong) UIButton *cancelButton;
//是否隐藏'取消按钮'
@property (nonatomic) BOOL isHiddenCancelButton;
//是否开启触摸背景层以取消视图,默认为否
@property (nonatomic) BOOL isHiddenDisplayerByTouch;
//按钮点击的回调,取消按钮的index为999
@property (nonatomic,copy) displayerActionBlock displayerActionBlock;
//是否点击后不取消视图,默认为NO
@property (nonatomic) BOOL isHiddenDisplayerWhenSelected;


//展示主视图
-(void)displayerShow;
//隐藏主视图
-(void)displayerHidden;

///尺寸
//主视图宽度
//当displayerPositionType为（IDisplayerPositionTypeBottom）时,该属性无效
@property (nonatomic) CGFloat displayerWidth;
//标题控件与主视图的内边距,默认为(10, 10, 5, 10)
@property (nonatomic) UIEdgeInsets titleEdgeInsets;
//内容视图与主视图的内边距,默认为(0, 10, 0, 10)
@property (nonatomic) UIEdgeInsets contentEdgeInsets;
//自定义内容控件尺寸
//设置该值的时候,contentEdgeInsets的left和right无效
//默认为250*300
@property (nonatomic) CGSize customViewSize;
//是否自定义主视图宽度等于控件宽度,默认为YES
@property (nonatomic) BOOL isCustomWidthEqualToDisplayer;
//按钮之间的间距,默认为0.5
@property (nonatomic) CGFloat buttonsInset;
//按钮的高度 默认为45
@property (nonatomic) CGFloat buttonHeight;

@end
