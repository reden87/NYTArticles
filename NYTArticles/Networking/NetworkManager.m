//
//  NetworkManager.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "NetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import <Crashlytics/Crashlytics.h>
#import <JSONModel/JSONModel.h>

@implementation NetworkManager

#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static NetworkManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [self new];
    });
    return sharedMyManager;
}

#pragma mark - Networking

- (void)GET:(NSString *)api
responseClass:(Class)responseClass
    success:(void(^)(id result))successBlock
      error:(void(^)(NSError *error))errorBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // set custom headers if necessary
    
    NSLog(@"ℹ️[POST] %@", api);
    [manager GET:api parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"ℹ️[POST] %@ SUCCESS: %@", api, responseObject);
        
        NSError *error;
        JSONModel *response = [[responseClass alloc] initWithData:responseObject error:&error];
        
        if (!error)
        {
            if (successBlock)
            {
                successBlock(response);
            }
            return;
        }
        
        if (errorBlock)
        {
            errorBlock(error);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSString *responseString = [[NSString alloc] initWithData:error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        NSLog(@"⚠️[POST] %@ server response: %@", api, responseString);
        NSLog(@"⚠️[POST] %@ error: %@", api, error);
        
        NSUInteger statusCode = 0;
        if ([task.response isKindOfClass:[NSHTTPURLResponse class]]) {
            statusCode = ((NSHTTPURLResponse *)task.response).statusCode;
        }
        
        [CrashlyticsKit recordError:error withAdditionalUserInfo:@{
                                                                   @"response status code": @(statusCode),
                                                                   }];
        
        if (errorBlock)
        {
            errorBlock(error);
        }
    }];
}

@end
