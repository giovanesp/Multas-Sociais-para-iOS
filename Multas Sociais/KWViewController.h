//
//  KWViewController.h
//  Multas Sociais
//
//  Created by Maurilio Henrique Reis Campos on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "KWMultaConfirmaViewController.h"

@interface KWViewController : UIViewController <UIImagePickerControllerDelegate, 
                                                UINavigationControllerDelegate>
{
    UIImagePickerController *_imagePicker;
    UIImage *_socialViolator;
}


-(IBAction)multar;

@property (nonatomic, strong) IBOutlet UIButton *btnMultar;
@property (nonatomic, strong) IBOutlet UIImageView *cameraLayer;
@end
