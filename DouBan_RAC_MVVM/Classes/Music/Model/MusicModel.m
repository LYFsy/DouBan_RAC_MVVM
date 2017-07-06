//
//  MusicModel.m
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "MusicModel.h"
#import "MusicAuthor.h"
#import "MusicTags.h"

@implementation MusicModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"author" : [MusicAuthor class], @"tags" : [MusicTags class]};
}

@end
