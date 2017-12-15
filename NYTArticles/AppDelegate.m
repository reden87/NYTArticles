//
//  AppDelegate.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 14..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "AppDelegate.h"
#import <Fabric/Fabric.h>
#import <Crashlytics/Crashlytics.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Fabric with:@[[Crashlytics class]]];
    
    return YES;
}

@end
