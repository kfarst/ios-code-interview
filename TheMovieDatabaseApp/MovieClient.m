//
//  MovieClient.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/14/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import "MovieClient.h"

@interface MovieClient ()

@property (nonatomic, strong) NSURLSession *URLSession;
- (NSURLRequest *)requestForMovieListWithType:(NSString *)listType;

@end

@implementation MovieClient

NSString  *const BASE_URL = @"https://api.themoviedb.org/3/movie/%@?api_key=%@";
NSString *const  API_KEY = @"a07e22bc18f5cb106bfe4cc1f83ad8ed";

- (instancetype)init
{
    self = [super init];
    
    if (self != nil) {
        self.URLSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    }
    
    return self;
}

@end

