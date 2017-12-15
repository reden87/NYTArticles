//
//  NetworkManager.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

#pragma mark - Singleton

+ (instancetype)sharedInstance;

#pragma mark - Networking

- (void)GET:(NSString *)api
responseClass:(Class)responseClass
    success:(void(^)(id result))successBlock
      error:(void(^)(NSError *error))errorBlock;

@end
