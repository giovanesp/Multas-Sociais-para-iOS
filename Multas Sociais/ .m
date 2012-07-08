//
//  KWMultaInfoViewController.m
//  Multas Sociais
//
//  Created by Maurilio Henrique Reis Campos on 7/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "KWMultaInfoViewController.h"

@implementation KWMultaInfoViewController

@synthesize descricao = _descricao;
@synthesize placa = _placa;
@synthesize multar = _multar;
@synthesize voltar = _voltar;
@synthesize imgViolator = _imgViolator;

-(void)viewDidLoad
{
    //Round Corners
    [[_multar layer] setCornerRadius:8];
    [[_voltar layer] setCornerRadius:8];
    [[_multar layer] setMasksToBounds:YES];
    [[_voltar layer] setMasksToBounds:YES];
    [_placa becomeFirstResponder];
}



-(IBAction)multarClicked:(id)sender
{
    NSString *sUrl = @"http://testes.multassociais.net/multas.json";
    NSURL *url = [NSURL URLWithString:sUrl];
    
    
    NSMutableDictionary *_params = [[NSMutableDictionary alloc] init];
    
    [_params setObject:@"334df152d" forKey:@"api_id"];
    [_params setObject:@"fee18ae10cfb367120ae93a9eb5d3835" forKey:@"api_secret"];
    [_params setObject:@"multa[data_ocorrencia(1i)]" forKey:@"2012"];
    [_params setObject:@"multa[data_ocorrencia(2i)]" forKey:@"7"];
    [_params setObject:@"multa[data_ocorrencia(3i)]" forKey:@"8"];
    [_params setObject:@"multa[data_ocorrencia(4i)]" forKey:@"23"];
    [_params setObject:@"multa[data_ocorrencia(5i)]" forKey:@"59"];
    [_params setObject:@"multa[placa]" forKey:_placa.text];
    [_params setObject:@"multa[descricao]" forKey:_descricao.text];


    // create request
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];                                    
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setHTTPShouldHandleCookies:NO];
    [request setTimeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    
    NSString *boundary = [NSString stringWithString:@"0xKhTmLbOuNdArY"];
    
    // set Content-Type in HTTP header
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // post body
    NSMutableData *body = [NSMutableData data];
    
    // add params (all params are strings)
    int i = 0;
    for (NSString *param in _params) {
        NSString *BoundaryConstant = [NSString stringWithFormat:@"xSosSd%d", i];
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", [_params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        i++;
    }
    
    // add image data
    NSData *imageData = UIImageJPEGRepresentation(_imgViolator, 1.0);
    if (imageData) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", @"multa.jpg"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithString:@"Content-Type: image/jpeg\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:imageData];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    // setting the body of the post to the reqeust
    [request setHTTPBody:body];
    
    // set URL
    [request setURL:url];
    
    NSURLConnection *uConn = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:YES];
    [uConn start];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)d {
    NSString *ret = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    NSLog(@"Did Receive Data: %@", ret);
}

-(IBAction)voltarClicked:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
