//
//  MovieModel.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MovieImages,MovieRating,MovieCasts,MovieAvatars;

@interface MovieModel : NSObject

@property (nonatomic, strong) MovieRating *rating;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *original_title;

@property (nonatomic, assign) NSInteger collect_count;

@property (nonatomic, strong) NSArray *directors;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *year;

@property (nonatomic, strong) NSArray<MovieCasts *> *casts;

@property (nonatomic, strong) NSArray<NSString *> *genres;

@property (nonatomic, strong) MovieImages *images;

@property (nonatomic, copy) NSString *subtype;

@property (nonatomic, copy) NSString *alt;

@end