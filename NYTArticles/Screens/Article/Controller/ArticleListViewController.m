//
//  ArticleListViewController.m
//  NYTArticles
//
//  Created by Gergo Nemeth on 2017. 12. 15..
//  Copyright © 2017. Gergo Nemeth. All rights reserved.
//

#import "ArticleListViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "ArticleDataManager.h"
#import "ArticleTableViewCell.h"

static NSString * const articleCellIdentifier = @"ArticleTableViewCell";

@interface ArticleListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

// the data manager should be loaded with dependency injection
@property (nonatomic, weak) id<ArticleDataManagerInterface> dataManager;

@property (nonatomic, strong) NSArray<ArticleModel *> *allArticles;

@end

@implementation ArticleListViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"NY Times Most Popular", nil);
    
    [self setupDataManager];
    [self setupNavigationBar];
    [self setupTableView];
    [self loadData];
}

#pragma mark - Setup

- (void)setupDataManager
{
    // I'm using ArticleDataManagerInterface protocol because the data manager in large-scale project
    // should be loaded with dependency injection. This way we can easily use the data manager class we have now
    // or we can use an ArticleMockDataManager instance in case of Mock environment.
    self.dataManager = [ArticleDataManager sharedInstance];
}

- (void)setupNavigationBar
{
    UIImage *menuImage = [UIImage imageNamed:@"menuIcon"];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:menuImage
                                                                             style:UIBarButtonItemStyleDone
                                                                            target:self
                                                                            action:@selector(menuButtonPressed)];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonPressed)];
    
    UIImage *verticalMenuImage = [UIImage imageNamed:@"verticalMenuIcon"];
    UIBarButtonItem *verticalMenuButton = [[UIBarButtonItem alloc] initWithImage:verticalMenuImage
                                                                           style:UIBarButtonItemStyleDone
                                                                          target:self
                                                                          action:@selector(verticalMenuTapped)];
    
    self.navigationItem.rightBarButtonItems = @[verticalMenuButton, searchButton];
}

- (void)setupTableView
{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableFooterView = [UIView new]; // hide separators when no data
    
    UINib *cellNib = [UINib nibWithNibName:articleCellIdentifier bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:articleCellIdentifier];
}

#pragma mark - Load Data

- (void)loadData
{
    __weak typeof(self) weakSelf = self;
    [SVProgressHUD show];
    [self.dataManager getArticlesWithSuccess:^(NSArray<ArticleModel *> *articles) {
        [SVProgressHUD dismiss];
        
        weakSelf.allArticles = articles;
        [weakSelf.tableView reloadData];
    } error:^(NSError *error) {
        [SVProgressHUD dismiss];
        
        // TODO: show error to the user
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allArticles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:articleCellIdentifier forIndexPath:indexPath];
    
    ArticleModel *article = self.allArticles[indexPath.row];
    [cell setupWithArticle:article];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"tableView:didSelectRowAtIndexPath:");
}

#pragma mark - Actions

- (void)menuButtonPressed
{
    NSLog(@"menuButtonPressed");
}

- (void)searchButtonPressed
{
    NSLog(@"searchButtonPressed");
}

- (void)verticalMenuTapped
{
    NSLog(@"verticalMenuTapped");
}

@end
