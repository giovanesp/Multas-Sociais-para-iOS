//
//  KWViewController.m
//  Multas Sociais
//
//  Created by Maurilio Henrique Reis Campos on 7/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KWViewController.h"


@interface KWViewController (C)
-(void)setupCamera;
@end

@implementation KWViewController
@synthesize btnMultar = _btnMultar;
@synthesize cameraLayer = _cameraLayer;

    
-(void)setupCamera
{   
    _imagePicker = [[UIImagePickerController alloc] init];
    [_imagePicker setSourceType: UIImagePickerControllerSourceTypeCamera];
    [_imagePicker setCameraCaptureMode:UIImagePickerControllerCameraCaptureModePhoto];
    [_imagePicker setCameraDevice:UIImagePickerControllerCameraDeviceRear];    
    [_imagePicker setDelegate: self];    
    [_imagePicker setAllowsEditing:NO];
    [_imagePicker setShowsCameraControls: NO];
    [_imagePicker setWantsFullScreenLayout: NO];
    [_imagePicker setNavigationBarHidden:YES];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle: UIStatusBarStyleDefault];
    
    //start cammera thread
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t mQueue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        [self setupCamera];
        dispatch_async(mQueue, ^{
            _imagePicker.view.frame = CGRectMake(0, 0, _cameraLayer.frame.size.width, _cameraLayer.frame.size.height);
            [_cameraLayer addSubview:_imagePicker.view];
        });
    });
    

    
    //Round corners
    [[_btnMultar layer] setCornerRadius:8];
    [[_btnMultar layer] setMasksToBounds:YES];

}

-(IBAction)multar
{
    [_imagePicker takePicture];
}


// Picture Delegate
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    _socialViolator = image;
    KWMultaConfirmaViewController *mvc = [[KWMultaConfirmaViewController alloc] 
                                                        initWithNibName:@"KWMultaConfirmaViewController" 
                                                        bundle:nil];
    

    [self.navigationController pushViewController:mvc animated:YES];
        [mvc setViolatorImage:image];
}

@end









