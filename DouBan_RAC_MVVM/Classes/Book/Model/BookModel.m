//
//  BookModel.m
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/05
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "BookModel.h"
#import "Tags.h"
#import "Images.h"
#import "Rating.h"
#import "Series.h"
@implementation BookModel
+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"tags":[Tags class],@"images":[Images class],@"rating":[Rating class],@"series":[Series class]};
}
@end
