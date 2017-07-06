//
//  BaseCell.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BaseModel;
@interface BaseCell : UITableViewCell
@property(nonatomic,strong)BaseModel *model;
@end
