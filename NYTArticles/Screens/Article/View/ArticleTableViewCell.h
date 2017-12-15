//
//  ArticleTableViewCell.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ArticleModel;

@interface ArticleTableViewCell : UITableViewCell

#pragma mark - Setup

- (void)setupWithArticle:(ArticleModel *)article;

@end
