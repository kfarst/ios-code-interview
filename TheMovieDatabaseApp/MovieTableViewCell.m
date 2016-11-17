//
//  MovieTableViewCell.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/16/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
#import "MovieTableViewCell.h"
#import "MovieModel.h"

@interface MovieTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *overviewLabel;
@property (nonatomic, strong) UIImageView *posterImageView;

- (float)totalTextHeight;

@end

@implementation MovieTableViewCell

NSString * const POSTER_BASE_URL = @"https://image.tmdb.org/t/p/w185/%@";

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil)
    {
        //////////////////
        // Add subviews //
        //////////////////
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

-(void)updateConstraints
{
    ////////////////////////////////////////////////////////////////////
    // Add constraints, preferrably with visual format language (VFL) //
    ////////////////////////////////////////////////////////////////////
    
    [super updateConstraints];
}

- (void)configureWithMovie:(MovieModel *)movie
{
    //////////////////////////////////////////////
    // Bind movie properties to view properties //
    //////////////////////////////////////////////
}

@end
