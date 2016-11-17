//
//  MovieListViewController.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/14/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieClient.h"
#import <PromiseKit/PMKFoundation.h>

@interface MovieListViewController : UITableViewController

- (instancetype)initWithClient:(MovieClient *)client forEndpoint:(NSString *)endpoint;

@end
