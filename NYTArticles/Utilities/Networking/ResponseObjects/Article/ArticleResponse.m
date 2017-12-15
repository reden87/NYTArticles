//
//  Article.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "ArticleResponse.h"

@implementation ArticleResponse

#pragma mark - key mapping

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"articleId": @"id",
                                                                  @"author": @"byline",
                                                                  @"publishDate": @"published_date",
                                                                  }];
}

@end
