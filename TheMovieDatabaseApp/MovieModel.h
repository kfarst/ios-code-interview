//
//  MovieModel.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/15/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface MovieModel : JSONModel

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *overview;
@property (nonatomic) NSString *posterPath;
@property (nonatomic) NSString *releaseDate;

@end
