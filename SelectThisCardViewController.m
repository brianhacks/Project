//
//  SelectThisCardViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/15/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "SelectThisCardViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface SelectThisCardViewController ()

@end

@implementation SelectThisCardViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
   
    //load the web view
    NSString *urlAddress = @"http://news.ycombinator.com";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    
    [self.selectCardWebView.layer setMasksToBounds:YES];
    [self.selectCardWebView.layer setCornerRadius:12.0f];
    [self.selectCardWebView.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [self.selectCardWebView.layer setBorderWidth:1.0f];
    
    [self.selectCardWebView.layer setShadowOffset:CGSizeMake(0, 0)];
    [self.selectCardWebView.layer setShadowOpacity:1];
    [self.selectCardWebView.layer setShadowRadius:2.0];
    
    [self.selectCardWebView loadRequest:requestObj];
    [self.selectCardWebView.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.selectCardWebView.layer setShadowOffset:CGSizeMake(1.0, 1.0)];
    [self.selectCardWebView.layer setShadowOpacity:0.5];
    [self.selectCardWebView.layer setShadowRadius:1];
   
    
    
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToCards:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
    [self.delegate chooseCard:self andButton:@"back To Cards"];
}

- (IBAction)chooseThisCard:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{}];
    [self.delegate chooseCard:self andButton:@"choose this card"];
    
}
@end
