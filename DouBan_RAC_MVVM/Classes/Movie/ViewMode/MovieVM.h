//
//  MovieVM.h
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/6.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieVM : NSObject
@property(nonatomic,strong)RACCommand * requestDataCommand;
@end
