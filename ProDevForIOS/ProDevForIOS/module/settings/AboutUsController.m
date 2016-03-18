//
//  AboutUsController.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/3/15.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "AboutUsController.h"
#import "Masonry.h"
static const CGFloat ITEM_SIZE = 80;
@implementation AboutUsController
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
}
-(void)viewDidLoad{
    [super viewDidLoad];
    //int padding1 = 10;
     //__weak typeof(self) weakSelf = self;
    _scrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-STATUS_BAR_HEIGHT)];
     _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 460*2);
    _scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_scrollView];
     _scrollView.delegate = self;
    
    //UIView *greenview = [UIView new];
    UIButton *greenview = [UIButton buttonWithType:UIButtonTypeCustom];
    greenview.backgroundColor = [UIColor greenColor];
    //[self.view addSubview:greenview];
    
    UIButton *blueview =[UIButton buttonWithType:UIButtonTypeCustom];
    blueview.backgroundColor = [UIColor blueColor];
    //[self.view  addSubview:blueview];
    
    UIButton *redview =[UIButton buttonWithType:UIButtonTypeCustom];
    redview.backgroundColor = [UIColor redColor];
    //[self.view  addSubview:redview];
    //////
    UIView *yellowview = [UIView new];
    yellowview.backgroundColor = [UIColor yellowColor];
    [_scrollView addSubview:yellowview];
    /////
    
    UIButton *greenview1 = [UIButton buttonWithType:UIButtonTypeCustom];
    greenview1.backgroundColor = [UIColor greenColor];
    //[self.view addSubview:greenview];
    
    UIButton *blueview1 =[UIButton buttonWithType:UIButtonTypeCustom];
    blueview1.backgroundColor = [UIColor blueColor];
    //[self.view  addSubview:blueview];
    
    UIButton *redview1 =[UIButton buttonWithType:UIButtonTypeCustom];
    redview1.backgroundColor = [UIColor redColor];
    
    UIButton *purpleview =[UIButton buttonWithType:UIButtonTypeCustom];
    purpleview.backgroundColor = [UIColor purpleColor];
    ////
    [yellowview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, ITEM_SIZE));
        make.top.mas_equalTo(SCREEN_WIDTH/3);
    }];
 
    _views=@[greenview,blueview,redview];
    _views_1=@[purpleview,blueview1,greenview1,redview1];
    
    for (NSUInteger i = 0; i < [_views count]; i++) {
        UIButton *itemView = _views[i];
        [_scrollView addSubview:itemView];
        
        [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, SCREEN_WIDTH/3));
             make.top.mas_equalTo(0);
            //make.centerY.equalTo(baseview.mas_centerY);
            if(i==0){
                make.left.equalTo(self.view.mas_left);
            }else if(i==[_views count]-1){
                 make.left.equalTo(itemView.mas_right);
                 make.right.equalTo(self.view.mas_right);
            }else{
                 UIButton *middleView = _views[i-1];
                 make.left.equalTo(middleView.mas_right);
            }
            
        }];
    }
    for (NSUInteger j = 0; j < [_views_1 count]; j++) {
        UIButton *itemView = _views_1[j];
        [_scrollView addSubview:itemView];
        
        [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/4, SCREEN_WIDTH/4));
            make.top.equalTo(yellowview.mas_bottom);
            //make.centerY.equalTo(baseview.mas_centerY);
            if(j==0){
                make.left.equalTo(self.view.mas_left);
            }else if(j==[_views_1 count]-1){
                make.left.equalTo(itemView.mas_right);
                make.right.equalTo(self.view.mas_right);
            }else{
                UIButton *middleView = _views_1[j-1];
                make.left.equalTo(middleView.mas_right);
            }
            
        }];
    }
    
}
// 是否支持滑动至顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
    return YES;
}

// 滑动到顶部时调用该方法
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScrollToTop");
}

// scrollView 已经滑动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewDidScroll");
}

// scrollView 开始拖动
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

// scrollView 结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
}
@end
