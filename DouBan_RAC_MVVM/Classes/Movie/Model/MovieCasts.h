//
//  MovieCasts.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieAvatars;

@interface MovieCasts : NSObject

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, strong) MovieAvatars *avatars;

@property (nonatomic, copy) NSString *name;

@end