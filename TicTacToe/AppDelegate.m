//
//  AppDelegate.m
//  TicTacToe
//
//  Created by Kristen L. Fisher on 5/15/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "AppDelegate.h"
#import <CheckMate/CheckMate.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [CheckMate
     initializeFramework:@[@"0c6c0421323770989d12d5ef695da768", @"9da9526b8650d4b44fa850e72e3001cf"]];
    // Override point for customization after application launch.
    return YES;
}


@end