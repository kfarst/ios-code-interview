//
//  LoadingView.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 2/2/17.
//  Copyright © 2017 Kevin Farst. All rights reserved.
//

#import "LoadingView.h"

@interface LoadingView()

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation LoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self != nil)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.activityIndicatorView];
        
        [self setNeedsUpdateConstraints];
    }
    return self;
}

- (void)updateConstraints
{
    [self addConstraints:self.constraints];
    [super updateConstraints];
}

- (NSArray *)constraints
{
    NSMutableArray *constraints = [[super constraints] mutableCopy];
    
    [constraints addObjectsFromArray:@[
                                       [NSLayoutConstraint constraintWithItem:self.activityIndicatorView
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0],
                                       
                                       [NSLayoutConstraint constraintWithItem:self.activityIndicatorView
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0
                                                                     constant:0.0],
                                       ]];
    
    return constraints;
}

- (UIActivityIndicatorView *)activityIndicatorView
{
    if (_activityIndicatorView == nil)
    {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] init];
        _activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
        _activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        [_activityIndicatorView startAnimating];
    }
    return _activityIndicatorView;
}


@end
