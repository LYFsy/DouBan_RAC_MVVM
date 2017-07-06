//
//  MusicRating.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MusicRating : NSObject

@property (nonatomic, assign) NSInteger min;

@property (nonatomic, copy) NSString *average;

@property (nonatomic, assign) NSInteger max;

@property (nonatomic, assign) NSInteger numRaters;

@end