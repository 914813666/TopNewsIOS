//
//  CustomTableCellTableViewCell.h
//  ProDevForIOS
//
//  Created by 曹亚民 on 16/2/26.
//  Copyright © 2016年 曹亚民. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Content.h"

@interface DiscoveryTableCellTableViewCell : UITableViewCell

 @property (nonatomic, weak) UIImageView *picImg;
 @property (nonatomic, weak) UILabel *titleLabel;
 @property (nonatomic, weak) UILabel *explaLable;
 @property (nonatomic, weak) UIButton *buyButton;
-(void)refreshCellData:(Content *)content;
@end
