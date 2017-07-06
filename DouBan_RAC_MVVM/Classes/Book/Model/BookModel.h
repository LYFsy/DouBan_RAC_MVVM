//
//  BookModel.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/05
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Images,Rating,Series,Tags;

@interface BookModel : BaseModel

@property (nonatomic, copy) NSString *isbn13;

@property (nonatomic, copy) NSString *binding;

@property (nonatomic, copy) NSString *publisher;

@property (nonatomic, copy) NSString *pages;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<Tags *> *tags;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *catalog;

@property (nonatomic, copy) NSString *alt;

@property (nonatomic, copy) NSString *isbn10;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *alt_title;

@property (nonatomic, strong) Images *images;

@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *pubdate;

@property (nonatomic, copy) NSString *origin_title;

@property (nonatomic, copy) NSString *id;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, strong) NSArray<NSString *> *translator;

@property (nonatomic, strong) Series *series;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, strong) Rating *rating;

@property (nonatomic, strong) NSArray<NSString *> *author;

@property (nonatomic, copy) NSString *author_intro;


@end