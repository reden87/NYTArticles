//
//  MediaResponse.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "MediaResponse.h"

@implementation MediaResponse

#pragma mark - key mapping

+ (JSONKeyMapper *)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"metadata": @"media-metadata",
                                                                  }];
}

@end
