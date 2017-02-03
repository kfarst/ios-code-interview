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

    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    
    [self.client fetchMovieList:self.endpoint].then(^(NSDictionary *data) {
        NSArray *movies = data[@"results"];
        NSError *error;
        weakSelf.movies = [MovieModel arrayOfModelsFromDictionaries:movies error:&error];
        
        if (error != nil) {
            [self presentViewController:self.alertView animated:YES completion:nil];
        } else {
            [weakSelf.tableView reloadData];
        }
    }).catch(^{
        [self presentViewController:self.alertView animated:YES completion:nil];
    }).always(^{
        self.loadingView.hidden = YES;
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MovieTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell configureWithMovie:[self.movies objectAtIndex:indexPath.row]];
    
    [cell layoutSubviews];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UIAlertController *)alertView {
    if (_alertView == nil) {
        _alertView = [UIAlertController alertControllerWithTitle: @"Error"
                                                         message: @"Something went wrong"
                                                  preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [_alertView addAction:defaultAction];
    }
    return _alertView;
}

- (LoadingView *)loadingView {
    if (_loadingView == nil ) {
        _loadingView = [[LoadingView alloc] initWithFrame:self.tableView.frame];
    }
    return _loadingView;
}

@end
