//
//  MovieTableViewCell.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/16/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"

@interface MovieTableViewCell : UITableViewCell

- (void)configureWithMovie:(MovieModel *)movie;

@end
