//
//  MovieListViewController.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/14/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieClient.h"
#import "MovieModel.h"
#import "MovieTableViewCell.h"
#import "LoadingView.h"

@interface MovieListViewController ()

@property (nonatomic, strong) MovieClient *client;
@property (nonatomic, strong) NSString *endpoint;
@property (nonatomic, strong) NSArray<MovieModel *> *movies;
@property (nonatomic, strong) UIAlertController *alertView;
@property (nonatomic, strong) LoadingView *loadingView;

@end

@implementation MovieListViewController

- (instancetype)initWithClient:(MovieClient *)client forEndpoint:(NSString *)endpoint
{
    self = [super init];
    
    if (self != nil) {
        self.client = client;
        self.endpoint = endpoint;
    }
    
    return self;
}

- (void)loadView {
    [super loadView];
    [self.view addSubview:self.loadingView];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.loadingView.frame = ^{
        CGRect frame = self.tableView.frame;
        frame.origin.y = self.tableView.contentOffset.y;
        frame.size.height -= self.tableView.contentInset.bottom;
        return frame;
    }();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setEstimatedRowHeight:100];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];

    ////////////////////////////
    // Fetch movies           //
    ////////////////////////////

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (LoadingView *)loadingView {
    if (_loadingView == nil ) {
        _loadingView = [[LoadingView alloc] initWithFrame:self.tableView.frame];
    }
    return _loadingView;
}

@end
