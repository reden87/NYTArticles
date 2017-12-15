//
//  MediaMetadataResponse.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface MediaMetadataResponse : JSONModel

@property (nonatomic, assign) NSUInteger width;
@property (nonatomic, assign) NSUInteger height;
@property (nonatomic, strong) NSURL *url;

@end
