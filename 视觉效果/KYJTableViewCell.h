//
//  KYJTableViewCell.h
//  视觉效果
//
//  Created by djzx on 2018/4/18.
//  Copyright © 2018年 djzx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KYJTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *cellImv;
/**
 *  背景图片y值设置
 */
- (void)cellOnTableView:(UITableView *)tableView didScrollView:(UIView *)view;
@end
