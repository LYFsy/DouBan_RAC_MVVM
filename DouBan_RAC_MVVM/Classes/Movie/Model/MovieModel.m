//
//  MovieModel.m
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "MovieModel.h"
#import "MovieCasts.h"

@implementation MovieModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"casts" : [MovieCasts class]};
}

@end
