//
//  KWAppDelegate.m
//  Multas Sociais
//
//  Created by Maurilio Henrique Reis Campos on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KWAppDelegate.h"

#import "KWViewController.h"

@implementation KWAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;
@synthesize navController = _navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.viewController = [[KWViewController alloc] initWithNibName:@"KWViewController" bundle:nil];
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    self.navController.navigationBarHidden = YES;
    
    self.window.rootViewController = self.navController;
    
    [self.window makeKeyAndVisible];

    
    return YES;
}

@end
