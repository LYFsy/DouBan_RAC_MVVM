//
//  NetworkManager.h
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/5.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataCompletionBlock)(NSDictionary * dict,NSError * error);


@interface NetworkManager : NSObject

@property(nonatomic,strong)NSOperationQueue *networkQueue;
+ (NetworkManager *)getInstance;

- (void)getWithUrl:(NSString *)urlStr success:(DataCompletionBlock)success failure:(DataCompletionBlock)failure;
@end
