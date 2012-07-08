//
//  KWMultaInfoViewController.h
//  Multas Sociais
//
//  Created by Maurilio Henrique Reis Campos on 7/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "KWMultaInfoViewController.h"


@interface KWMultaConfirmaViewController : UIViewController

-(IBAction)goBack;
-(IBAction)goAhead;

-(void)setViolatorImage:(UIImage *)img;

@property (nonatomic, strong) UIImage *imgViolator;
@property (nonatomic, strong) IBOutlet UIImageView *imgViewViolator;
@property (nonatomic, strong) IBOutlet UIButton *btnNext;
@property (nonatomic, strong) IBOutlet UIButton *btnBack;

@end
