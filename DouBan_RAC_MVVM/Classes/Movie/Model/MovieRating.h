//
//  MovieRating.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MovieRating : NSObject

@property (nonatomic, copy) NSString *stars;

@property (nonatomic, assign) NSInteger average;

@property (nonatomic, assign) NSInteger min;

@property (nonatomic, assign) NSInteger max;

@end