//
//  ModalViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/15/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController (){
    NSString *dialogTitle;
}

@end



@implementation ModalViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
     
    }
    
    return self;
}

- (void)whichModalToPresent:(NSString *)modalName
{
    NSString *urlAddress;
   
    
    if ([modalName isEqualToString:@"privacy"]) {
        [self.dialogTitle setText:@"Privacy"];
        urlAddress = @"http://www.td.com/privacyandsecurity/privacycommitment/index.jsp";
    
    }else if([modalName isEqualToString:@"security"]){
        [self.dialogTitle setText:@"Security"];
        urlAddress = @"http://www.td.com/privacyandsecurity/index.jsp";
        
    }else if([modalName isEqualToString:@"legal"]){
        [self.dialogTitle setText:@"Legal"];

        urlAddress = @"http://www.td.com/legal/index_inc.jsp";
        
    }
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [self.webView loadRequest:requestObj];
    
}

- (IBAction)closeModal:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
   
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
