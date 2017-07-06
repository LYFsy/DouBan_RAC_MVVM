//
//  CellFactory.h
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCell.h"
@interface CellFactory : NSObject
- (BaseCell *)createCell;
@end
