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
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.overviewLabel];
        [self.contentView addSubview:self.posterImageView];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

-(void)updateConstraints
{
    NSMutableArray *constraints = [NSMutableArray new];
    NSDictionary *views = NSDictionaryOfVariableBindings(
                                                         _titleLabel,
                                                         _overviewLabel,
                                                         _posterImageView
                                                         );
    [constraints addObjectsFromArray: [NSLayoutConstraint
      constraintsWithVisualFormat: @"H:|-[_posterImageView(80)][_titleLabel]-|"
      options:0
      metrics:nil
      views:views]];
    
    [constraints addObjectsFromArray: [NSLayoutConstraint
      constraintsWithVisualFormat: @"H:|-[_posterImageView][_overviewLabel]-|"
      options:0
      metrics:nil
      views:views]];
    
    [constraints addObjectsFromArray: [NSLayoutConstraint
      constraintsWithVisualFormat: @"V:|-[_titleLabel][_overviewLabel]-|"
      options:0
      metrics:nil
      views:views]];
    
    [constraints addObjectsFromArray:
     [NSLayoutConstraint
      constraintsWithVisualFormat:@"V:|-[_posterImageView(==100)]-|"
      options:0
      metrics:nil
      views:views]];
    
    [self.contentView addConstraints:constraints];
    [super updateConstraints];
}

- (void)configureWithMovie:(MovieModel *)movie
{
    self.titleLabel.text = movie.title;
    self.overviewLabel.text = movie.overview;
    
    NSString *posterPathEncoded = [movie.posterPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    NSString *urlString = [NSString stringWithFormat:POSTER_BASE_URL, posterPathEncoded];
    
    [self.posterImageView setImageWithURL:[NSURL URLWithString:urlString] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"";
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

- (UILabel *)overviewLabel
{
    if (_overviewLabel == nil)
    {
        _overviewLabel = [[UILabel alloc] init];
        _overviewLabel.text = @"";
        _overviewLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _overviewLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _overviewLabel.font = [UIFont systemFontOfSize:14.0];
        _overviewLabel.numberOfLines = 4;
        _overviewLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _overviewLabel;
}

- (UIImageView *)posterImageView
{
    if (_posterImageView == nil)
    {
        _posterImageView = [[UIImageView alloc] init];
        _posterImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _posterImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _posterImageView;
}

- (float)totalTextHeight
{
    return self.titleLabel.frame.size.height + self.overviewLabel.frame.size.height;
}
@end
