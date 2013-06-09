//
//  LMAppDelegate.m
//  LMLoginExample
//
//  Created by NekOI on 6/9/13.
//  Copyright (c) 2013 LM. All rights reserved.
//

#import "LMAppDelegate.h"

#import "LMViewController.h"

@implementation LMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.window.rootViewController = [LMViewController new];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
