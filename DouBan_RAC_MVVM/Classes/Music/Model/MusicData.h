//
//  MusicData.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MusicModel,MusicAttrs,MusicRating,MusicAuthor,MusicTags;

@interface MusicData : NSObject

@property (nonatomic, strong) NSArray<MusicModel *> *musics;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger start;

@end