//
//  ArticleList.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "ArticleList.h"

@implementation ArticleList

#pragma mark - key mapping

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"articleList": @"results",
                                                                  }];
}

@end
