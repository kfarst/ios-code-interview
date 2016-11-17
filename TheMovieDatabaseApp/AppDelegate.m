//
//  AppDelegate.m
//  TheMovieDatabaseApp
//
//  Created by Kevin Farst on 11/13/16.
//  Copyright © 2016 Kevin Farst. All rights reserved.
//

#import "AppDelegate.h"
#import "MovieTabsViewController.h"
#import "MovieListViewController.h"
#import "MovieClient.h"

@interface AppDelegate ()

@property (nonatomic, strong) MovieTabsViewController *movieTabsViewController;
@property (nonatomic, strong) NSArray *movieListTypes;
@property (nonatomic, strong) MovieClient *client;

- (NSString *)titleizeEndpoint:(NSString *)endpoint;

@end

@implementation AppDelegate

- (MovieClient *)client
{
    if (_client == nil)
    {
        _client = [[MovieClient alloc] init];
    }
    return _client;
}


- (MovieTabsViewController *)movieTabsViewController
{
    if (_movieTabsViewController == nil) {
        _movieTabsViewController = [[MovieTabsViewController alloc] init];
    }
    return _movieTabsViewController;
}

- (NSArray *)movieListTypes
{
    if (_movieListTypes == nil) {
        _movieListTypes = @[
                                @"now_playing",
                                @"popular",
                                @"top_rated",
                                @"upcoming"
                            ];
    }
    return _movieListTypes;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    NSMutableArray *tabBarControllers = [[NSMutableArray alloc] init];
    
    //////////////////////////////////
    // Add tabs here                //
    //////////////////////////////////
    
    self.movieTabsViewController.viewControllers = tabBarControllers;
    self.window.rootViewController =  self.movieTabsViewController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (NSString *)titleizeEndpoint:(NSString *)endpoint
{
   //////////////////////////////////////////////////////////////
   // Convenience method for converting endpoints into titles  //
   //////////////////////////////////////////////////////////////
}

@end
