//
//  GettingStartedViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/18/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "GettingStartedViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface GettingStartedViewController ()

@end


@implementation GettingStartedViewController

@synthesize datePicker;
@synthesize chooseDateButton2;

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
    
    self.firstBorderView.layer.cornerRadius = 15.0;
    self.firstBorderView.layer.borderColor = [UIColor colorWithRed:.733 green:.733 blue:.733 alpha:1.0].CGColor;//bbbbbb 187x3 / .733
    self.firstBorderView.layer.backgroundColor = [UIColor colorWithRed:.963 green:.963 blue:.963 alpha:1.0].CGColor;
    self.firstBorderView.layer.borderWidth = 2.0f;
        
    self.secondBorderView.layer.cornerRadius = 15.0;
    self.secondBorderView.layer.borderColor = [UIColor colorWithRed:.733 green:.733 blue:.733 alpha:1.0].CGColor;//bbbbbb 187x3 / .733
    self.secondBorderView.layer.backgroundColor = [UIColor colorWithRed:.963 green:.963 blue:.963 alpha:1.0].CGColor;
    self.secondBorderView.layer.borderWidth = 2.0f;
    


    self.thirdBorderView.layer.cornerRadius = 15.0;
    self.thirdBorderView.layer.borderColor = [UIColor colorWithRed:.733 green:.733 blue:.733 alpha:1.0].CGColor;//bbbbbb 187x3 / .733
    self.thirdBorderView.layer.backgroundColor = [UIColor colorWithRed:.963 green:.963 blue:.963 alpha:1.0].CGColor;
    self.thirdBorderView.layer.borderWidth = 2.0f;
    


    self.fourthBorderView.layer.cornerRadius = 15.0;
    self.fourthBorderView.layer.borderColor = [UIColor colorWithRed:.733 green:.733 blue:.733 alpha:1.0].CGColor;//bbbbbb 187x3 / .733
    self.fourthBorderView.layer.backgroundColor = [UIColor colorWithRed:.963 green:.963 blue:.963 alpha:1.0].CGColor;
    self.fourthBorderView.layer.borderWidth = 2.0f;
    
    

    
}

- (IBAction)showBirthDatePicker:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    datePicker=[[UIDatePicker alloc]init];//Date picker
    datePicker.frame=CGRectMake(0,44,320, 216);
    datePicker.datePickerMode = UIDatePickerModeDate;
//    [datePicker setMinuteInterval:5];
    [datePicker setTag:10];
    [datePicker addTarget:self action:@selector(result:) forControlEvents:UIControlEventValueChanged];
    [popoverView addSubview:datePicker];
    
    chooseDateButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    chooseDateButton2.frame = CGRectMake(250., 0., 60., 44.);
    [chooseDateButton2 setTitle:@"Done" forState:UIControlStateNormal];
    [chooseDateButton2 addTarget:self action:@selector(closePopover) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:chooseDateButton2];
    
    popoverContent.view = popoverView;
    self.popoverController1 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController1.delegate = self;
//    [popoverContent release];
    
    [self.popoverController1 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [self.popoverController1 presentPopoverFromRect:self.birthDateButton.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];//tempButton.frame where you need you can put that frame
    
}

- (void)closePopover
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;

    //Use NSDateFormatter to write out the date in a friendly format
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = NSDateFormatterMediumStyle;
	NSLog(@"%@",datePicker.date);
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    
    dateString = [formatter stringFromDate:datePicker.date];
    [self.birthDateButton setTitle:dateString forState:UIControlStateNormal ];
    [appDelegate addInfoToUser:datePicker.date andFieldToAddItTo:@"birthDate"];
    
    [self.popoverController1 dismissPopoverAnimated:YES];
    
}

- (void)result:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    //Use NSDateFormatter to write out the date in a friendly format
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = NSDateFormatterMediumStyle;
	NSLog(@"%@",[NSString stringWithFormat:@"%@",[df stringFromDate:datePicker.date]]);

    [appDelegate addInfoToUser:datePicker.date andFieldToAddItTo:@"birthDate"];
    
}

- (IBAction)areYouACanadianResidentSwitch:(id)sender
{
}

- (IBAction)bankruptcySwitch:(id)sender
{
}

- (IBAction)existingTDCanadaCustomer:(id)sender
{

    
}

- (IBAction)nextStep:(id)sender
{

    if (!self.areYouACanadianResidentSwitch.isOn) {
    
        UIAlertView* alerView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"You must be a Canadian Resident to be eligible. Please speak to a TD representative or visit a TD Canada Trust branch if you have any questions or need assistance." delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles:@"CANCEL", nil];
        [alerView show];
        
        return;
        
    }
    
    NSDate* now = [NSDate date];
    
    NSLog(@"%f",[datePicker.date timeIntervalSinceDate:now]);
    
    NSTimeInterval theTimeInterval = [datePicker.date timeIntervalSinceDate:now];
    
    NSCalendar *sysCalendar = [NSCalendar currentCalendar];
    
    NSDate *date1 = [[NSDate alloc] init];
    NSDate *date2 = [[NSDate alloc] initWithTimeInterval:theTimeInterval sinceDate:date1];
    
    unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    
    NSDateComponents *breakdownInfo = [sysCalendar components:unitFlags fromDate:date1  toDate:date2  options:0];
    
    NSLog(@"Break down: %dyears", [breakdownInfo year]);
    
    if ([breakdownInfo year] >= -18) {
        
        UIAlertView* alerView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Your Date of Birth as specified is invalid" delegate:self cancelButtonTitle:@"TRY AGAIN" otherButtonTitles: nil];
        [alerView show];
        
        return;
        
    }
    
    if (self.bankruptcySwitch.isOn) {
        
        UIAlertView* alerView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Thank you for your interest in applying for this TD Credit Card. We regret to inform you that we are unable to process your application online at this time. Please speak to a TD representative or visit a TD Canada Trust branch if you have any questions or need assistance." delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alerView show];
        
        return;
        
    }

    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    BOOL canadianResident;
    BOOL haveYouDeclaredBanckrupcy;
//    BOOL areYouAnExistingTDCanadianCustomer;
    
    
    if (self.areYouACanadianResidentSwitch.isOn) {
    
        canadianResident = YES;
        [appDelegate addBOOLInfoToUser:canadianResident andFieldToAddItTo:@"canadianResident"];
        
    }else
    {
        canadianResident = NO;
        [appDelegate addBOOLInfoToUser:canadianResident andFieldToAddItTo:@"canadianResident"];
        
    }
    
    if (self.bankruptcySwitch.isOn) {
        
        haveYouDeclaredBanckrupcy = YES;
        [appDelegate addBOOLInfoToUser:haveYouDeclaredBanckrupcy andFieldToAddItTo:@"bankrupcy"];
        
    }else
    {
        haveYouDeclaredBanckrupcy = NO;
        [appDelegate addBOOLInfoToUser:haveYouDeclaredBanckrupcy andFieldToAddItTo:@"bankrupcy"];
        
    }
    
//    if (self.existingTDCanadaCustomer.isOn) {
//        
//        areYouAnExistingTDCanadianCustomer = YES;
//        [appDelegate addBOOLInfoToUser:areYouAnExistingTDCanadianCustomer andFieldToAddItTo:@"canadianResident"];
//        
//    }else
//    {
//        areYouAnExistingTDCanadianCustomer = NO;
//        [appDelegate addBOOLInfoToUser:areYouAnExistingTDCanadianCustomer andFieldToAddItTo:@"canadianResident"];
//        
//    }
    
    
    [appDelegate setNewRootView:appDelegate.personalInfoViewController];
    [appDelegate.personalInfoViewController refresh];

    
}

- (IBAction)previousStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate backOneView];

    
}

- (void)refresh
{
   /* self.sageataImage = [[UIImageView alloc] initWithFrame:CGRectMake(169.0, 62.0, 94., 81)];
    self.sageataImage.image = [UIImage imageNamed:@"sageata.png"];
    [self.view addSubview:self.sageataImage];
    */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
