//
//  ArticleList.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "Article.h"

@protocol Article;

@interface ArticleList : JSONModel

@property (nonatomic, strong) NSArray<Article> *articleList;

@end
