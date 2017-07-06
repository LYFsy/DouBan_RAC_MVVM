//
//  MusicModel.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MusicAttrs,MusicRating,MusicAuthor,MusicTags;

@interface MusicModel : NSObject

@property (nonatomic, strong) MusicRating *rating;

@property (nonatomic, strong) NSArray<MusicAuthor *> *author;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *alt_title;

@property (nonatomic, copy) NSString *mobile_link;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) MusicAttrs *attrs;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, strong) NSArray<MusicTags *> *tags;

@end