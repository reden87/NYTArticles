//
//  ArticleModel.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleModel : NSObject

@property (nonatomic, strong) NSNumber *articleId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *publishDate;
@property (nonatomic, strong) NSURL *mediaUrl;
@property (nonatomic, strong) NSURL *url;

@end
