//
//  MusicData.m
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "MusicData.h"
#import "MusicModel.h"

@implementation MusicData

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"musics" : [MusicModel class]};
}

@end
