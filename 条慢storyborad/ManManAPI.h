//
//  ManManAPI.h
//  条慢storyborad
//
//  Created by 千锋 on 16/3/14.
//  Copyright (c) 2016年 千锋. All rights reserved.
//

#ifndef __storyborad_ManManAPI_h
#define __storyborad_ManManAPI_h
//===========网络接口==============
#define ManManApi @"https://comic.idreamcastle.com/api/"
#define Access_Token @"?access_token=ecpzcknd9wv92hwoafgbj0r28w24h9xl"



#pragma mark =======条漫============
#define Comic_API [[ManManApi stringByAppendingString:@"getHomePage/"] stringByAppendingString:Access_Token]


#pragma mark =======发现============
#define Discover_API [[ManManApi stringByAppendingString:@"getDiscoveries/"] stringByAppendingString:Access_Token]

#pragma mark =====福利社===========
#define Welfare_API [[ManManApi stringByAppendingString:@"getBoons/"] stringByAppendingString:Access_Token]






#endif
