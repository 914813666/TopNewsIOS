//
//  CustomTableCellTableViewCell.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/2/26.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemResource.h"

@interface CustomTableCellTableViewCell0 : UITableViewCell

@property (nonatomic, weak) UIImageView *picImg;
@property (nonatomic, weak) UIImageView *picImg1;
@property (nonatomic, weak) UIImageView *picImg2;
@property (nonatomic, weak) UILabel *titleLabel;
@property (nonatomic, weak) UILabel *explaLable;
@property (nonatomic, weak) UILabel *timeLable;
-(void)refreshCellData:(ItemResource *)content;
@end
