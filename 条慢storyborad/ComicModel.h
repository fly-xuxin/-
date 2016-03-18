//
//  ComicModel.h
//  条慢storyborad
//
//  Created by 千锋 on 16/3/14.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ComicModel : NSObject



//作者头像
@property(nonatomic, copy) NSString * author_avatar;

//作者名
@property(nonatomic,copy)  NSString * author;

//封面
@property(nonatomic, copy) NSString * file;

//系列名字
@property(nonatomic, copy) NSString * series_title;

//标题
@property(nonatomic, copy) NSString * post_title;

//点赞数
@property(nonatomic,strong) NSNumber * likes;

//评论数
@property(nonatomic, strong) NSNumber * comments_num;

//第几话
@property(nonatomic, strong) NSNumber * part;

- (instancetype)initWithDict:(NSDictionary *)dict;

@end
