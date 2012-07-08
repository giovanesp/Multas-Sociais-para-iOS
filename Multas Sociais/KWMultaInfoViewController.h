//
//  KWMultaInfoViewController.h
//  Multas Sociais
//
//  Created by Maurilio Henrique Reis Campos on 7/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface KWMultaInfoViewController : UIViewController <NSURLConnectionDelegate>

-(IBAction)multarClicked:(id)sender;
-(IBAction)voltarClicked:(id)sender;

@property (strong, nonatomic) UIImage *imgViolator;
@property (strong, nonatomic) IBOutlet UIButton *multar;
@property (strong, nonatomic) IBOutlet UIButton *voltar;
@property (strong, nonatomic) IBOutlet UITextField *placa;
@property (strong, nonatomic) IBOutlet UITextField *descricao;

@end
