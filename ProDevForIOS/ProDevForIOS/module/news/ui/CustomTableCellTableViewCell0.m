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
#import "Masonry.h"

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
            //[self.contentView addSubview:picView];
     
             //
             UIImageView *picView1 = [[UIImageView alloc] init];
             picView1.contentMode=UIViewContentModeScaleAspectFit;
             _picImg1= picView1;
            //[self.contentView addSubview:picView1];
            
             //
             UIImageView *picView2 = [[UIImageView alloc] init];
             picView2.contentMode=UIViewContentModeScaleAspectFit;
             _picImg2= picView2;
            //[self.contentView addSubview:picView2];
        
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
    _titleLabel.numberOfLines = 4;
    _titleLabel.font=t15font;
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo([TextUtils getActualCGSize:_titleLabel.text font:t15font].height);
        make.top.mas_equalTo(5);
        make.left.mas_equalTo(5);
    }];
    _picsArray=@[_picImg,_picImg1,_picImg2];
    for (NSUInteger i = 0; i < [_picsArray count]; i++) {
        UIImageView *itemView = _picsArray[i];
        [self.contentView addSubview:itemView];
        
        [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/3, SCREEN_WIDTH/3));
            make.top.equalTo(_titleLabel.mas_bottom);
            //make.centerY.equalTo(baseview.mas_centerY);
            if(i==0){
                make.left.equalTo(self.contentView.mas_left);
            }else if(i==[_picsArray count]-1){
                make.left.equalTo(itemView.mas_right);
                make.right.equalTo(self.contentView.mas_right);
            }else{
                UIImageView *middleView = _picsArray[i-1];
                make.left.equalTo(middleView.mas_right);
            }
            
        }];
    }
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

    _timeLable.font=t12font;
    [_timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo( [TextUtils getActualCGSize:_timeLable.text font:t12font].height);
        make.top.equalTo(_picImg.mas_bottom);
        
    }];
    _explaLable.font=t12font;
    [_explaLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo( [TextUtils getActualCGSize:_explaLable.text font:t12font].height);
        make.top.equalTo(_picImg.mas_bottom);
        make.left.equalTo(_timeLable.mas_right).offset(5);
        
    }];
    //[TextUtils ajustUILable:_timeLable text:_timeLable.text font:t12font x:0 y:_titleLabel.frame.size.height+_picImg.frame.size.height w:0 h:0];
    //[TextUtils ajustUILable:_explaLable text:_explaLable.text font:t12font x:_timeLable.frame.size.width+5 y:_titleLabel.frame.size.height+_picImg.frame.size.height w:0 h:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
