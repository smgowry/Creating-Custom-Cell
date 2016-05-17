//
//  AppDelegate.m
//  GSCollapsibleTableView
//
//  Created by Gowri Sammandhamoorthy on 09/24/15.
//  Copyright © 2015 Gowri Sammandhamoorthy. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:109.0/255.0 blue:26.0/255.0 alpha:1.0f]];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [[UIToolbar appearance]setBarTintColor:[UIColor colorWithRed:255.0/255.0 green:109.0/255.0 blue:26.0/255.0 alpha:1.0f]];
    [[UIToolbar appearance]setTranslucent:NO];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
}

@end
