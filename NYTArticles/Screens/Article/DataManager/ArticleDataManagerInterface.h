//
//  ArticleDataManagerInterface.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ArticleModel;

@protocol ArticleDataManagerInterface

@required

- (void)getArticlesWithSuccess:(void(^)(NSArray<ArticleModel *> *articles))successBlock
                         error:(void(^)(NSError *error))errorBlock;

@end
