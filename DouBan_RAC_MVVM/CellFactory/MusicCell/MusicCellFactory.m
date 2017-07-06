//
//  MusicCellFactory.m
//  DouBan
//
//  Created by 刘一峰 on 2017/5/8.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MusicCellFactory.h"
#import "MusicCell.h"
@implementation MusicCellFactory
- (BaseCell *)createCell {
    return [[MusicCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"music"];
}
@end
