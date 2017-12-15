//
//  MediaResponse.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol MediaMetadataResponse;

@interface MediaResponse : JSONModel

@property (nonatomic, strong) NSArray<MediaMetadataResponse> *metadata;

@end
