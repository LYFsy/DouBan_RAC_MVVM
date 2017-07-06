//
//  NetworkManager.m
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/5.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "NetworkManager.h"


@implementation NetworkManager

static NetworkManager * manager = nil;

+ (NetworkManager *)getInstance {
    static NetworkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[NetworkManager alloc] initPrivate];
        }
    });
    return manager;
}
- (instancetype)initPrivate {
    //调用父类init方法避免死循环
    return [super init];
}
- (instancetype)init {
    return [NetworkManager getInstance];
}


- (NSOperationQueue *)networkQueue {
    if (_networkQueue == nil) {
        _networkQueue = [[NSOperationQueue alloc]init];
        _networkQueue.maxConcurrentOperationCount = 10;
    }
    return _networkQueue;
}

- (void)getWithUrl:(NSString *)urlStr success:(DataCompletionBlock)success failure:(DataCompletionBlock)failure{
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:[urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            if (error) {
                failure(nil,error);
            }else {
                success(dict,nil);
            }
        }];
        [task resume];
    }];
    [self.networkQueue addOperation:operation];
}

@end
