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
#import "Masonry.h"

@implementation CustomTableCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor=[UIColor blackColor];
        [self.contentView addSubview:titleLabel];
        _titleLabel = titleLabel;
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = NSLineBreakByCharWrapping;
        _titleLabel.font = [UIFont systemFontOfSize:14];
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
    __weak typeof(self) weakSelf = self;
    [_titleLabel setText:content.title];
    [_explaLable setText:content.source];
    [_timeLable setText:content.source_public_time];
    _titleLabel.textColor=[UIColor blackColor];
    UIFont * t12font = [UIFont systemFontOfSize:12];
    ImageUrls *urls=content.images[0];
    NSURL *url=[NSURL URLWithString:urls.url];

    [_picImg sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        [_picImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(image.size.width*1.8);
            make.height.mas_equalTo(image.size.height*1.8);
            make.right.equalTo(weakSelf.contentView).offset(-5);
            make.top.mas_equalTo(5);
        }];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.width.mas_equalTo(SCREEN_WIDTH-_picImg.frame.size.width);
            make.left.equalTo(weakSelf.contentView).offset(5);
            make.right.equalTo(_picImg.mas_left).offset(-8);
            make.top.equalTo(_picImg.mas_top);
        }];
        
    }];
    _timeLable.font=t12font;
    [_timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo( [TextUtils getActualCGSize:_timeLable.text font:t12font].height);
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        make.left.equalTo(weakSelf.contentView).offset(5);
    }];
    _explaLable.font=t12font;
    [_explaLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo( [TextUtils getActualCGSize:_explaLable.text font:t12font].height);
        make.top.equalTo(_titleLabel.mas_bottom).offset(5);
        make.left.equalTo(_timeLable.mas_right).offset(5);
        
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
