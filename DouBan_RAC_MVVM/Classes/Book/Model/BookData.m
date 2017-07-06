//
//  BookData.m
//  ReactiveObjC
//
//  Created by 刘一峰 on 17/07/05
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "BookData.h"
#import "BookModel.h"

@implementation BookData

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"books":[BookModel class]};
}

@end
