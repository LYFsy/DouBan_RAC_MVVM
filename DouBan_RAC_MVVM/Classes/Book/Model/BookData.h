//
//  BookData.h
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/05
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BookModel;

@interface BookData : NSObject

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<BookModel *> *books;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger start;

@end