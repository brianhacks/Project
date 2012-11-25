//
//  GettingStartedViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/18/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "GettingStartedViewController.h"

@interface GettingStartedViewController ()

@end

@implementation GettingStartedViewController

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
}

- (IBAction)showBirthDatePicker:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    
    
    UIDatePicker *datePicker=[[UIDatePicker alloc]init];//Date picker
    datePicker.frame=CGRectMake(0,44,320, 216);
    datePicker.datePickerMode = UIDatePickerModeDate;
//    [datePicker setMinuteInterval:5];
    [datePicker setTag:10];
    [datePicker addTarget:self action:@selector(result) forControlEvents:UIControlEventValueChanged];
    [popoverView addSubview:datePicker];
    
    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(250., 0., 60., 44.);
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [popoverView addSubview:doneButton];
    
    popoverContent.view = popoverView;
    self.popoverController1 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController1.delegate = self;
//    [popoverContent release];
    
    [self.popoverController1 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [self.popoverController1 presentPopoverFromRect:self.birthDateButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];//tempButton.frame where you need you can put that frame
    
}

- (void)result
{
    
}

- (IBAction)areYouACanadianResidentSwitch:(id)sender {
}

- (IBAction)bankruptcySwitch:(id)sender {
}

- (IBAction)existingTDCanadaCustomer:(id)sender
{
    
    if (self.existingTDCanadaCustomer.isOn) {
        
        self.existingTDCustomerHiddenView.hidden = NO;
        
    }else{
        
        self.existingTDCustomerHiddenView.hidden = YES;
        
    }
    
}

- (void)refresh
{
    self.sageataImage = [[UIImageView alloc] initWithFrame:CGRectMake(169.0, 62.0, 94., 81)];
    self.sageataImage.image = [UIImage imageNamed:@"sageata.png"];
    [self.view addSubview:self.sageataImage];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
