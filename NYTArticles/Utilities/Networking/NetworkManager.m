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

static NSString * const baseURL = @"https://api.nytimes.com/svc/mostpopular/v2/";
static NSString * const tokenSuffix = @"?api-key=5cf6665b021a48979dcf2e0cd5bfadbc";

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

- (void)GET:(NSString *)apiUrl
responseClass:(Class)responseClass
    success:(void(^)(id result))successBlock
      error:(void(^)(NSError *error))errorBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // set custom headers if necessary
    
    NSString *fullUrl = [baseURL stringByAppendingString:apiUrl];
    fullUrl = [fullUrl stringByAppendingString:tokenSuffix];
    
    NSLog(@"ℹ️[POST] %@", apiUrl);
    [manager GET:fullUrl parameters:nil progress:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError *error;
        JSONModel *response = [[responseClass alloc] initWithData:responseObject error:&error];
        
        NSLog(@"ℹ️[POST] %@ SUCCESS: %@", apiUrl, response);
        
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
        NSLog(@"⚠️[POST] %@ server response: %@", apiUrl, responseString);
        NSLog(@"⚠️[POST] %@ error: %@", apiUrl, error);
        
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
