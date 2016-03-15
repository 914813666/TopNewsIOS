//
//  CustomTableCellTableViewCell.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/2/26.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "CustomTableCellTableViewCell0.h"
#import "UIImageView+WebCache.h"
#import "ImageUrls.h"
#import "UIColor+Hex.h"
#import "TextUtils.h"

@implementation CustomTableCellTableViewCell0

 - (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
 {
         self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
         if (self) {
             UILabel *titleLabel = [[UILabel alloc] init];
      
             titleLabel.textColor=[UIColor blackColor];
             [self.contentView addSubview:titleLabel];
             _titleLabel = titleLabel;
             /*----------------------------------*/
             UIImageView *picView = [[UIImageView alloc] init];
             picView.contentMode=UIViewContentModeScaleAspectFit;
             _picImg= picView;
            [self.contentView addSubview:picView];
     
             //
             UIImageView *picView1 = [[UIImageView alloc] init];
             picView1.contentMode=UIViewContentModeScaleAspectFit;
             _picImg1= picView1;
            [self.contentView addSubview:picView1];
            
             //
             UIImageView *picView2 = [[UIImageView alloc] init];
             picView2.contentMode=UIViewContentModeScaleAspectFit;
             _picImg2= picView2;
            [self.contentView addSubview:picView2];
        
             /*----------------------------------*/
             UILabel *explaLable = [[UILabel alloc] init];
              explaLable.textColor=[UIColor grayColor];
             [self.contentView addSubview:explaLable];
             _explaLable = explaLable;
             /*----------------------------------*/
             UILabel *timeLable = [[UILabel alloc] init];
              timeLable.textColor=[UIColor grayColor];
             [self.contentView addSubview:timeLable];
             _timeLable = timeLable;
        }
         return self;
     }

-(void)refreshCellData:(ItemResource *)content{
  
    [_titleLabel setText:content.title];
    [_explaLable setText:content.source];
    [_timeLable setText:content.source_public_time];
    _titleLabel.textColor=[UIColor blackColor];
    UIFont * t15font = [UIFont systemFontOfSize:15];
    UIFont * t12font = [UIFont systemFontOfSize:12];
    [TextUtils ajustUILable:_titleLabel text:_titleLabel.text font:t15font x:0 y:10 w:0 h:0];
     _picImg.frame = CGRectMake(0,_titleLabel.frame.size.height , SCREEN_WIDTH/3, SCREEN_WIDTH/3);
    _picImg1.frame = CGRectMake(SCREEN_WIDTH/3, _titleLabel.frame.size.height, SCREEN_WIDTH/3, SCREEN_WIDTH/3);
    _picImg2.frame = CGRectMake(SCREEN_WIDTH/3*2, _titleLabel.frame.size.height, SCREEN_WIDTH/3, SCREEN_WIDTH/3);
    //
    ImageUrls *urls=content.images[0];
    ImageUrls *urls1=content.images[1];
    ImageUrls *urls2=content.images[2];
    NSURL *url=[NSURL URLWithString:urls.url];
    NSURL *url1=[NSURL URLWithString:urls1.url];
    NSURL *url2=[NSURL URLWithString:urls2.url];
    [_picImg sd_setImageWithURL:url];
    [_picImg1 sd_setImageWithURL:url1];
    [_picImg2 sd_setImageWithURL:url2];
    [TextUtils ajustUILable:_timeLable text:_timeLable.text font:t12font x:0 y:_titleLabel.frame.size.height+_picImg.frame.size.height w:0 h:0];
    [TextUtils ajustUILable:_explaLable text:_explaLable.text font:t12font x:_timeLable.frame.size.width+5 y:_titleLabel.frame.size.height+_picImg.frame.size.height w:0 h:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
