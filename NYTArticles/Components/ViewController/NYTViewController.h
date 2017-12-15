//
//  NYTViewController.h
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYTViewController : UIViewController

#pragma mark - Setting Data

/**
 *  This method is used to pass data between ViewControllers.
 *  Usually we use a global navigator which is responsible for the navigation between screens.
 *  We pass the screen's identifier and the data we want to send to the next screen and the navigator calls
 *  this method to set the data.
 */
- (void)setObject:(id)object;

@end
