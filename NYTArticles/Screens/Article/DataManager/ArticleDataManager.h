//
//  ArticleDataManager.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ArticleDataManagerInterface.h"

@interface ArticleDataManager : NSObject <ArticleDataManagerInterface>

#pragma mark - Singleton

+ (instancetype)sharedInstance;

@end
