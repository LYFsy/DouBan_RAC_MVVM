//
//  MusicAttrs.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/06
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface MusicAttrs : NSObject

@property (nonatomic, strong) NSArray<NSString *> *singer;

@property (nonatomic, strong) NSArray<NSString *> *pubdate;

@property (nonatomic, strong) NSArray<NSString *> *tracks;

@property (nonatomic, strong) NSArray<NSString *> *title;

@property (nonatomic, strong) NSArray<NSString *> *media;

@property (nonatomic, strong) NSArray<NSString *> *publisher;

@property (nonatomic, strong) NSArray<NSString *> *version;

@property (nonatomic, strong) NSArray<NSString *> *discs;

@end