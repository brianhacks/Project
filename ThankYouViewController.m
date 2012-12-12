//
//  ThankYouViewController.m
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/7/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "ThankYouViewController.h"
#import "AppDelegate.h"
@interface ThankYouViewController ()

@end

@implementation ThankYouViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)refresh{
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int min = 1000000; //Get the current text from your minimum and maximum textfields.
    int max = 9999999;
    
    int randNum = (arc4random() % (max-min)) + min;//rand()%(max-min)+min; //create the random number.
    
    NSString *num = [NSString stringWithFormat:@"%d", randNum]; //Make the number into a string.
    
    [self.referenceNum setText:num];
    
    
    // Do any additional setup after loading the view from its nib.
    //GENERATE AND SAVE THE REF NUM
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [appDelegate addInfoToUser:num andFieldToAddItTo:@"referenceNumber"];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
