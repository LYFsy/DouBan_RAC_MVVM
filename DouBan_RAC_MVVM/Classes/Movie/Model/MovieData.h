//
//  MovieData.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieModel,MovieImages,MovieRating,MovieCasts,MovieAvatars;

@interface MovieData : NSObject

@property (nonatomic, assign) NSInteger start;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<MovieModel *> *subjects;

@property (nonatomic, assign) NSInteger total;

@end