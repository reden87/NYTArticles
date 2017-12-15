//
//  NYTNavigationController.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "NYTNavigationController.h"
#import "UIColor+NYTColors.h"

@implementation NYTNavigationController

#pragma mark - Initialization

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    
    if (self)
    {
        self.navigationBar.translucent = NO;
        self.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationBar.titleTextAttributes = @{
                                                   NSForegroundColorAttributeName: [UIColor whiteColor],
                                                   };
    }
    
    return self;
}

#pragma mark - Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationBar.barTintColor = [UIColor nyt_navigationBarColor];
}

@end
