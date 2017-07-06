/*********************************************************/
/*                                                       *
 *                                                       *
 *   Follow your heart, but take your brain with you.    *
 *                                                       *
 *                                                       *
 *********************************************************/
//  MusicVM.m
//  DouBan_RAC_MVVM
//
//  Created by 刘一峰 on 2017/7/6.
//  Copyright © 2017年 刘一峰. All rights reserved.
//

#import "MusicVM.h"
@implementation MusicVM
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
                [[NetworkManager getInstance]getWithUrl:music_search success:^(NSDictionary *dict, NSError *error) {
                    
                    MusicData * data = [MusicData yy_modelWithDictionary:dict];
                    [subscriber sendNext:data.musics];
                    [subscriber sendCompleted];
//                    BookData *data = [BookData yy_modelWithDictionary:dict];

                } failure:^(NSDictionary *dict, NSError *error) {
                    [subscriber sendError:error];
                }];
                return nil;
            }];
        }];
    }
}
@end
