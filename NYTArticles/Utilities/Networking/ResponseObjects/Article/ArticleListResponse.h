//
//  ArticleListResponse.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ArticleResponse;

@interface ArticleListResponse : JSONModel

@property (nonatomic, strong) NSArray<ArticleResponse> *articleList;

@end
