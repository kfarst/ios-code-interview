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

- (void)fetchMovieList:(NSString *)listType forResult:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    NSURLSessionDataTask *task = [self.URLSession dataTaskWithRequest:[self requestForMovieListWithType:listType] completionHandler:completionHandler];
    
    [task resume];
}

- (NSURLRequest *)requestForMovieListWithType:(NSString *)listType
{
    NSString *typeEncoded = [listType stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSString *apiKeyEncoded = [API_KEY stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:BASE_URL, typeEncoded, apiKeyEncoded]];
    
    return [NSURLRequest requestWithURL:url];
}
@end

