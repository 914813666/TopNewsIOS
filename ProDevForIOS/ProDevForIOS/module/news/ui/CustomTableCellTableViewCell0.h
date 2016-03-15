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

@property (nonatomic, strong) UIImageView *picImg;
@property (nonatomic, strong) UIImageView *picImg1;
@property (nonatomic, strong) UIImageView *picImg2;
@property (nonatomic, strong) NSArray *picsArray;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *explaLable;
@property (nonatomic, strong) UILabel *timeLable;
-(void)refreshCellData:(ItemResource *)content;
@end
