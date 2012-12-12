//
//  FinalAcceptViewController.m
//  TD VISA FORM
//
//  Created by MATTHEW KANTOR on 12/12/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "FinalAcceptViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface FinalAcceptViewController ()

@end

@implementation FinalAcceptViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    // self.view.backgroundColor = background;
    
    //load the web view
    NSString *urlAddress = @"http://news.ycombinator.com";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    
    [self.webShowdowView.layer setMasksToBounds:YES];
    [self.webShowdowView.layer setCornerRadius:12.0f];
    // [self.webShowdowView.layer setBorderColor:[[UIColor blackColor] CGColor]];
    //[self.webShowdowView.layer setBorderWidth:1.0f];
    
    [self.selectCardWebView loadRequest:requestObj];
    [self.webShowdowView.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.webShowdowView.layer setShadowOffset:CGSizeMake(3.0, 3.0)];
    [self.webShowdowView.layer setShadowOpacity:1];
    [self.webShowdowView.layer setShadowRadius:2];
    
    
    
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToCards:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
    [self.delegate chooseCard:self andButton:@"Cancel"];
}

- (IBAction)chooseThisCard:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
    [self.delegate chooseCard:self andButton:@"I Agree"];
    
}

@end
