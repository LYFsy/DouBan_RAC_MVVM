//
//  MovieData.m
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "MovieData.h"
#import "MovieModel.h"

@implementation MovieData

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"subjects" : [MovieModel class]};
}

@end
