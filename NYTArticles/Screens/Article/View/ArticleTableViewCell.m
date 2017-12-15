//
//  ArticleTableViewCell.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "ArticleTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ArticleModel.h"

@interface ArticleTableViewCell ()

@property (nonatomic, weak) IBOutlet UIImageView *mediaImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *authorLabel;
@property (nonatomic, weak) IBOutlet UILabel *publishDateLabel;

@end

@implementation ArticleTableViewCell

#pragma mark - Lifecycle

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.mediaImageView.backgroundColor = [UIColor lightGrayColor];
    self.mediaImageView.clipsToBounds = YES;
    self.mediaImageView.layer.cornerRadius = self.mediaImageView.bounds.size.width / 2.0f;
}

#pragma mark - Setup

- (void)setupWithArticle:(ArticleModel *)article
{
    [self.mediaImageView sd_setImageWithURL:article.mediaUrl];
    self.titleLabel.text = article.title;
    self.authorLabel.text = article.author;
    self.publishDateLabel.text = article.publishDate;
}

@end
