//
//  ArticleDetailViewController.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "ArticleDetailViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "ArticleModel.h"

@interface ArticleDetailViewController () <UIWebViewDelegate>

@property (nonatomic, weak) IBOutlet UIWebView *webView;

@property (nonatomic, strong) ArticleModel *articleModel;

@end

@implementation ArticleDetailViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.articleModel.title;
    
    [self setupWebView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [SVProgressHUD dismiss];
}

#pragma mark - Setup

- (void)setupWebView
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:self.articleModel.url];
    [self.webView loadRequest:request];
    [SVProgressHUD show];
    
    self.webView.delegate = self;
}

#pragma mark - Setting Data

- (void)setObject:(id)object
{
    if ([object isKindOfClass:[ArticleModel class]])
    {
        self.articleModel = object;
    }
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [SVProgressHUD dismiss];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [SVProgressHUD dismiss];
    
    // TODO: show error to the user
}

@end
