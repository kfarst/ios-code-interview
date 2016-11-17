//
//  MovieClient.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/14/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieClient : NSObject

- (instancetype)init;

- (void)fetchMovieList:(NSString *)listType forResult:(void (^)(NSData *data, NSURLResponse *response, NSError *error))completionHandler;

@end
