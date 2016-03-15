//
//  CustomTableCellTableViewCell.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/2/26.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "CustomTableCellTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Hex.h"
#import "ImageUrls.h"
#import "TextUtils.h"

@implementation CustomTableCellTableViewCell

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
        
        /*----------------------------------*/
        UILabel *explaLable = [[UILabel alloc] init];
        explaLable.textColor=[UIColor grayColor];
        [self.contentView addSubview:explaLable];
        _explaLable = explaLable;
        _explaLable.font = [UIFont systemFontOfSize:12];
        /*----------------------------------*/
        UILabel *timeLable = [[UILabel alloc] init];
        timeLable.textColor=[UIColor grayColor];
        [self.contentView addSubview:timeLable];
        _timeLable = timeLable;
        _timeLable.font = [UIFont systemFontOfSize:12];
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
    [TextUtils ajustUILable:_titleLabel text:_titleLabel.text font:t15font x:0 y:5 w:SCREEN_WIDTH/3*2 h:0];
    //
    _picImg.frame = CGRectMake(SCREEN_WIDTH-SCREEN_WIDTH/3,0 , SCREEN_WIDTH/3, SCREEN_WIDTH/3);
    //
    ImageUrls *urls=content.images[0];
    NSURL *url=[NSURL URLWithString:urls.url];
    [_picImg sd_setImageWithURL:url];
    [TextUtils ajustUILable:_timeLable text:_timeLable.text font:t12font x:0 y:_titleLabel.frame.size.height+10 w:0 h:0];
    [TextUtils ajustUILable:_explaLable text:_explaLable.text font:t12font x:_timeLable.frame.size.width+2 y:_titleLabel.frame.size.height+10 w:0 h:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
