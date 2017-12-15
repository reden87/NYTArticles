//
//  ArticleDataManager.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "ArticleDataManager.h"
#import <ObjectiveSugar/ObjectiveSugar.h>
#import "NetworkManager.h"
#import "ArticleListResponse.h"
#import "ArticleResponse.h"
#import "MediaResponse.h"
#import "MediaMetadataResponse.h"
#import "ArticleModel.h"

static NSString * const mostViewedArticlesAPI = @"mostviewed/all-sections/30.json";

@implementation ArticleDataManager

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static ArticleDataManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [self new];
    });
    return sharedMyManager;
}

#pragma mark - ArticleDataManagerInterface

- (void)getArticlesWithSuccess:(void(^)(NSArray<ArticleModel *> *articles))successBlock
                         error:(void(^)(NSError *error))errorBlock
{
    [[NetworkManager sharedInstance] GET:mostViewedArticlesAPI
                           responseClass:[ArticleListResponse class]
                                 success:^(ArticleListResponse *articleList)
     {
         NSArray<ArticleModel *> *result = [articleList.articleList map:^id(ArticleResponse *anArticle) {
             ArticleModel *articleModel = [ArticleModel new];
             articleModel.articleId = anArticle.articleId;
             articleModel.title = anArticle.title;
             articleModel.author = anArticle.author;
             articleModel.publishDate = anArticle.publishDate;
             articleModel.url = anArticle.url;
             
//             MediaResponse *mediaResponse = anArticle.media.firstObject;
//             MediaMetadataResponse *metadataResponse = (MediaMetadataResponse *)[mediaResponse.metadata select:^BOOL(MediaMetadataResponse *aMetadata) {
//                 return aMetadata.width == 320 && aMetadata.height == 320;
//             }];
//             if (metadataResponse)
//             {
//                 articleModel.mediaUrl = metadataResponse.url;
//             }
             
             return articleModel;
         }];
         
         if (successBlock)
         {
             successBlock(result);
         }
     } error:^(NSError *error) {
         if (errorBlock)
         {
             errorBlock(error);
         }
     }];
}

@end
