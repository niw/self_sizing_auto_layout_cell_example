//
//  AppDelegate.m
//  SelfSizingAutoLayoutCell
//
//  Created by Yoshimasa Niwa on 11/4/17.
//  Copyright © 2017 Yoshimasa Niwa. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions
{
    UIViewController *viewController = [[ViewController alloc] init];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];

    return YES;
}

@end

NS_ASSUME_NONNULL_END
