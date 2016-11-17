//
//  MovieModel.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/15/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel

+ (JSONKeyMapper *)keyMapper
{
    return [JSONKeyMapper mapperForSnakeCase];
}

@end
