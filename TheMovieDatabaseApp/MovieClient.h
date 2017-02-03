//
//  MovieClient.h
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/14/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PromiseKit/PMKFoundation.h>

@interface MovieClient : NSObject

- (instancetype)init;

- (AnyPromise *)fetchMovieList:(NSString *)listType;

@end
