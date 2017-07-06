//
//  MovieVM.m
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/6.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MovieVM.h"

@implementation MovieVM
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initRequestCommand];
    }
    return self;
}

- (void)initRequestCommand {
    if (!_requestDataCommand) {
        _requestDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                //request data
                [[NetworkManager getInstance]getWithUrl:movie_search success:^(NSDictionary *dict, NSError *error) {
                    
                    NSString *json = [dict yy_modelToJSONString];
                    MovieData *data = [MovieData yy_modelWithDictionary:dict];
                    [subscriber sendNext:data.subjects];
                    [subscriber sendCompleted];
                } failure:^(NSDictionary *dict, NSError *error) {
                    [subscriber sendError:error];
                }];
                return nil;
            }];
        }];
    }
}
@end
