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
#import "NYTNavigationController.h"
#import "ArticleListViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Fabric with:@[[Crashlytics class]]];
    
    // setup init screen
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ArticleListViewController *viewController = [ArticleListViewController new];
    NYTNavigationController *navigationController = [[NYTNavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navigationController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
