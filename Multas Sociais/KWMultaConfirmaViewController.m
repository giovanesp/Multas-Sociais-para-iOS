//
//  KWMultaInfoViewController.m
//  Multas Sociais
//
//  Created by Maurilio Henrique Reis Campos on 7/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KWMultaConfirmaViewController.h"


@implementation KWMultaConfirmaViewController

@synthesize imgViolator = _imgViolator;
@synthesize imgViewViolator = _imgViewViolator;
@synthesize btnBack = _btnBack;
@synthesize btnNext = _btnNext;


-(void)viewDidLoad
{
    //Round Corners
    [[_btnNext layer] setCornerRadius:8];
    [[_btnBack layer] setCornerRadius:8];
    [[_btnNext layer] setMasksToBounds:YES];
    [[_btnBack layer] setMasksToBounds:YES];
}

-(void)setViolatorImage:(UIImage *)img
{
    self.imgViolator = img;
    [self.imgViewViolator setImage:_imgViolator];
}

-(IBAction)goBack
{
    [self.navigationController popViewControllerAnimated:YES];
}


-(IBAction)goAhead
{
    KWMultaInfoViewController *mivc = [[KWMultaInfoViewController alloc] 
                                                        initWithNibName:@"KWMultaInfoViewController" 
                                                        bundle:nil];
    [mivc setImgViolator:_imgViolator];
    [self.navigationController pushViewController:mivc animated:YES];
}


@end
