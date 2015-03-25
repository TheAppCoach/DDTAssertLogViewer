//
//  AppDelegate.m
//  DDTAssertLogViewer
//
//  Created by Daren David Taylor on 25/03/2015.
//  Copyright (c) 2015 DDT. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Parse setApplicationId:@"JIRhWn62DGwCwOADZibahSjBnspd2cvsSiKbFD5n"
                  clientKey:@"lvqtwpdTmTmjRuEwe5Yy36AIqUdZkb5NwC5TboQJ"];
    
    return YES;
}

@end
