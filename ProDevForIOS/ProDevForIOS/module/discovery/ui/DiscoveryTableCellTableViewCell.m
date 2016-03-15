//
//  CustomTableCellTableViewCell.m
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/2/26.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import "DiscoveryTableCellTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIColor+Hex.h"

@implementation DiscoveryTableCellTableViewCell

 - (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
 {
         self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
         if (self) {
             /*----------------------------------*/
             UIImageView *picView = [[UIImageView alloc] init];
             [self.contentView addSubview:picView];
              picView.frame = CGRectMake(10, 0, kScaleNum(90), kScaleNum(90));
              picView.contentMode=UIViewContentModeScaleAspectFit;
             _picImg = picView;
             /*----------------------------------*/
             UILabel *titleLabel = [[UILabel alloc] init];
             titleLabel.numberOfLines = 0;
             titleLabel.font = [UIFont systemFontOfSize:15];
             titleLabel.textColor=[UIColor blackColor];
             titleLabel.frame =CGRectMake(kScaleNum(90)+30, 10, SCREEN_WIDTH-picView.frame.size.width, 20);
             [self.contentView addSubview:titleLabel];
             _titleLabel = titleLabel;
             /*----------------------------------*/
             UILabel *explaLable = [[UILabel alloc] init];
             //explaLable.frame =CGRectMake(kScaleNum(90)+30, 30,0,0);
             [self.contentView addSubview:explaLable];
             _explaLable = explaLable;
             /*----------------------------------*/
             UIButton *buyButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
             buyButton.titleLabel.font = [UIFont systemFontOfSize: 12.0];
             [buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
             [buyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
             buyButton.backgroundColor=[UIColor colorWithHexString:@"#00be9c"];
             _buyButton=buyButton;
            [self.contentView addSubview:buyButton];
             
            /*----------------------------------*/
        }
         return self;
     }

-(void)refreshCellData:(Content *)content{
    //CGRect frame=[self frame];
    [_titleLabel setText:content.txt];
    [_explaLable setText:content.explain];
    _explaLable.numberOfLines = 4;
    _explaLable.lineBreakMode = NSLineBreakByWordWrapping;
    _explaLable.textColor=[UIColor grayColor];
    UIFont * tfont = [UIFont systemFontOfSize:12];
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName,nil];
    CGSize size =CGSizeMake(320,MAXFLOAT);
    CGSize  actualsize =[_explaLable.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin  attributes:tdic context:nil].size;
    _explaLable.font=tfont;
    _explaLable.frame =CGRectMake(kScaleNum(90)+30,_titleLabel.frame.size.height+10, actualsize.width, actualsize.height);
    _buyButton.frame =CGRectMake(SCREEN_WIDTH-kScaleNum(60)-10, 10+_titleLabel.frame.size.height+_explaLable.frame.size.height,kScaleNum(60),kScaleNum(30));
    NSString* img=content.img;
    if([img rangeOfString:@"http:"].location ==NSNotFound)
    {
        img=[@"http:" stringByAppendingString:img];
    }
     NSURL *url=[NSURL URLWithString:img];
    [_picImg sd_setImageWithURL:url];
    /*if(_picImg.frame.size.height>_titleLabel.frame.size.height+actualsize.height+_buyButton.frame.size.height+20){
        frame.size.height=_picImg.frame.size.height;
    }else{
        frame.size.height=_titleLabel.frame.size.height+actualsize.height+_buyButton.frame.size.height+20;
    }
    
    self.frame=frame;*/
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(NSInteger)getCellHeight{
    return self.frame.size.height;
}
@end
