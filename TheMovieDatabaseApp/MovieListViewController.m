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

@interface MovieListViewController ()

@property (nonatomic, strong) MovieClient *client;
@property (nonatomic, strong) NSString *endpoint;
@property (nonatomic, strong) NSArray<MovieModel *> *movies;

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setEstimatedRowHeight:100];
    [self.tableView setRowHeight:UITableViewAutomaticDimension];
    
    // Do any additional setup after loading the view.
    __weak typeof(self) weakSelf = self;
    
    [self.client fetchMovieList:self.endpoint forResult: ^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if ([json isKindOfClass:[NSDictionary class]]) {
            NSArray *movies = json[@"results"];
            weakSelf.movies = [MovieModel arrayOfModelsFromDictionaries:movies error:&error];
            [weakSelf.tableView reloadData];
        }
    }];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
