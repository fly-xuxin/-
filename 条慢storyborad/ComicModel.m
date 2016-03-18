//
//  ComicModel.m
//  条慢storyborad
//
//  Created by 千锋 on 16/3/14.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import "ComicModel.h"

@implementation ComicModel
-(instancetype)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        _author=dict[@"author"];
    }
    return self;
}

@end
