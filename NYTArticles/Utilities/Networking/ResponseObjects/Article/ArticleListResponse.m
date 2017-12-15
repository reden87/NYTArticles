//
//  ArticleListResponse.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "ArticleListResponse.h"

@implementation ArticleListResponse

#pragma mark - key mapping

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"articleList": @"results",
                                                                  }];
}

@end
