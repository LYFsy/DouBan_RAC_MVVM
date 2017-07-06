//
//  ViewModel.h
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/5.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RACCommand;
@interface ViewModel : NSObject
@property(nonatomic,strong)RACCommand *requestDataCommand;
@end
