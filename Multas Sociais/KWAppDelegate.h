//
//  KWAppDelegate.h
//  Multas Sociais
//
//  Created by Maurilio Henrique Reis Campos on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KWViewController;

@interface KWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navController;

@property (strong, nonatomic) KWViewController *viewController;

@end
