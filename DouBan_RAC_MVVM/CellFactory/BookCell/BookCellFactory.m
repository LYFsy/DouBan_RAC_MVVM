//
//  BookCellFactory.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/7.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "BookCellFactory.h"
#import "BookCell.h"
@implementation BookCellFactory
- (BaseCell *)createCell {
    return [[BookCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"book"];
}
@end
