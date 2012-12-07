//
//  PersonalInfoViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/23/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "AppDelegate.h"
#import "AccordionView.h"

@interface PersonalInfoViewController ()

@end

@implementation PersonalInfoViewController

@synthesize gender, titleString, languageOfCorespondaceString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)titleSelection:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(150., 0., 60., 44.);
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(chooseTitle) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:doneButton];
    
    self.titlePicker = [[UIPickerView alloc]init];//Date picker
    self.titlePicker.frame = CGRectMake(0,44,220, 116);
    self.titlePicker.dataSource = self;
    self.titlePicker.delegate = self;
    self.titlePicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.titlePicker];
    
    popoverContent.view = popoverView;
    self.popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController2.delegate = self;
    
    [self.popoverController2 setPopoverContentSize:CGSizeMake(220, 220) animated:NO];
    [self.popoverController2 presentPopoverFromRect:CGRectMake(30.0, 220.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

- (void)chooseTitle
{
    
    self.titleString = [NSString stringWithFormat:@"%@",[self.titleArray objectAtIndex:[self.titlePicker selectedRowInComponent:0]]];
    [self.selectTitelButton setTitle:[NSString stringWithFormat:@"%@",self.titleString] forState:UIControlStateNormal];
    [self.popoverController2 dismissPopoverAnimated:YES];
    
}

- (void)refresh
{
    /* self.sageataImage = [[UIImageView alloc] initWithFrame:CGRectMake(349.0, 62.0, 94., 81)];
     self.sageataImage.image = [UIImage imageNamed:@"sageata.png"];
     [self.view addSubview:self.sageataImage];
     */
    [self.accordion setNeedsLayout];
}

#pragma mark
#pragma mark previousStep

- (IBAction)previousStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate backOneView];
    
}

#pragma mark
#pragma mark nextStep

- (IBAction)nextStep:(id)sender
{
    
    if ([self.titleString isEqualToString:@""] || self.firstName.text.length < 1 || self.lastName.text.length < 1 || self.primaryPhoneNumber.text.length < 1 || [self.gender isEqualToString:@""] || self.streetAddress.text.length < 1 || self.currentCity.text.length < 1 || [self.provinceButton.titleLabel.text isEqualToString:@"Province"] || self.postalCode.text.length < 1 || [self.residentialStatusButton.titleLabel.text isEqualToString:@"Choose"]) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        return;
        
    }
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate addInfoToUser:self.titleString andFieldToAddItTo:@"title"];
    [appDelegate addInfoToUser:self.firstName.text andFieldToAddItTo:@"firstName"];
    [appDelegate addInfoToUser:self.lastName.text andFieldToAddItTo:@"lastName"];
    [appDelegate addInfoToUser:self.areaCode.text andFieldToAddItTo:@"areaCode"];
    [appDelegate addInfoToUser:self.primaryPhoneNumber.text andFieldToAddItTo:@"primaryPhone"];
    [appDelegate addInfoToUser:self.emailAddress.text andFieldToAddItTo:@"email"];
    [appDelegate addInfoToUser:self.gender andFieldToAddItTo:@"gender"];
    [appDelegate addInfoToUser:self.languageOfCorespondaceString andFieldToAddItTo:@"languagOfCorespondace"];
    [appDelegate addInfoToUser:self.sinNumber.text andFieldToAddItTo:@"sin"];
    [appDelegate addInfoToUser:self.streetAddress.text andFieldToAddItTo:@"street"];
    [appDelegate addInfoToUser:self.postalCode.text andFieldToAddItTo:@"postalCode"];
    [appDelegate addInfoToUser:self.totalMonthlyHousingCosts.text andFieldToAddItTo:@"monthlyHouseCosts"];
    [appDelegate addInfoToUser:self.currentCity.text andFieldToAddItTo:@"city"];
    [appDelegate addInfoToUser:self.residentialStatusButton.titleLabel.text andFieldToAddItTo:@"resincialStatus"];
    [appDelegate addInfoToUser:self.totalMonthlyHousingCosts.text andFieldToAddItTo:@"monthlyHouseCosts"];
    [appDelegate setNewRootView:appDelegate.financialInfoViewController];
    [appDelegate.financialInfoViewController refresh];
    
    
}

- (IBAction)selectGender:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(150., 0., 60., 44.);
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(selectGender) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:doneButton];
    
    self.genderPicker = [[UIPickerView alloc]init];//Date picker
    self.genderPicker.frame = CGRectMake(0,44,220, 116);
    self.genderPicker.dataSource = self;
    self.genderPicker.delegate = self;
    self.genderPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.genderPicker];
    
    popoverContent.view = popoverView;
    self.popoverController1 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController1.delegate = self;
    
    [self.popoverController1 setPopoverContentSize:CGSizeMake(220, 264) animated:NO];
    [self.popoverController1 presentPopoverFromRect:CGRectMake(550.0, 190.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}

- (void)selectGender
{
    
    self.gender = [NSString stringWithFormat:@"%@",[self.genderArray objectAtIndex:[self.genderPicker selectedRowInComponent:0]]];
    [self.selectGenderButton setTitle:[NSString stringWithFormat:@"%@",self.gender] forState:UIControlStateNormal];
    [self.popoverController1 dismissPopoverAnimated:YES];
    
}

- (void)dismissPopover
{
    [self.popoverController1 dismissPopoverAnimated:YES];
    [self.popoverController2 dismissPopoverAnimated:YES];
}

- (IBAction)selectLanguageOfCorrespondace:(id)sender
{
}

- (IBAction)closeGeneralInfoView:(id)sender
{
    
    //validate the fields here!
    bool isValid = true;
    
    if ([self.titleString isEqualToString:@""] ){
        isValid=false;
        //mark field as invalid
        self.selectTitelButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.selectTitelButton.backgroundColor = [UIColor whiteColor];
    }
    
    //
    if(self.firstName.text.length < 1){
        isValid=false;
        //mark field as invalid
        self.firstName.backgroundColor = [UIColor yellowColor];
    }else{
        self.firstName.backgroundColor = [UIColor whiteColor];
    }
    //
    if(self.lastName.text.length < 1){
        isValid=false;
        //mark field as invalid
        self.lastName.backgroundColor = [UIColor yellowColor];
    }else{
        self.lastName.backgroundColor = [UIColor whiteColor];
    }
    
    NSString *str=@"^\\+(?:[0-9] ?){6,14}[0-9]$";
    NSPredicate *no=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
  
    if(self.primaryPhoneNumber.text.length < 1 || [no evaluateWithObject:self.primaryPhoneNumber.text]==NO){
        isValid=false;
        //mark field as invalid
        self.primaryPhoneNumber.backgroundColor = [UIColor yellowColor];
    }else{
        self.primaryPhoneNumber.backgroundColor = [UIColor whiteColor];
    }
    
    
    if( [self.gender isEqualToString:@""] ){
        //mark field as invalid
        self.selectGenderButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.selectGenderButton.backgroundColor = [UIColor whiteColor];
        
    }
    
    if(self.sinNumber.text.length > 9 ){
        //mark field as invalid
        self.sinNumber.backgroundColor = [UIColor yellowColor];
    }else{
        self.sinNumber.backgroundColor = [UIColor whiteColor];
        
    }
    NSString *email_regex_str=@".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSPredicate *email_no=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",email_regex_str];

    if(self.emailAddress.text.length > 0 && [email_no evaluateWithObject:self.emailAddress.text]==NO){
        //mark field as invalid
        self.emailAddress.backgroundColor = [UIColor yellowColor];
    }else{
        self.emailAddress.backgroundColor = [UIColor whiteColor];
        
    }

    
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    //TODO need to modify accordion to replace panel with infopanel and hide header.
    [self.accordion setSelectedIndex:1];
    
}

- (IBAction)closeAddressView:(id)sender;
{
    bool isValid=true;
    
    if(self.streetAddress.text.length < 1 || self.streetAddress.text.length >30 )
    {
        isValid=false;
        //mark field as invalid
        self.streetAddress.backgroundColor = [UIColor yellowColor];
    }else{
        self.streetAddress.backgroundColor = [UIColor whiteColor];
        
    }
    if(self.currentCity.text.length < 1 || self.currentCity.text.length > 30 )
    {
        isValid=false;
        //mark field as invalid
        self.currentCity.backgroundColor = [UIColor yellowColor];
    }else{
        self.currentCity.backgroundColor = [UIColor whiteColor];
        
    }
    if([self.provinceButton.titleLabel.text isEqualToString:@"Province"]){
    
    }
    
    //^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$
    
    NSString *zip_regex_str=@"^[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1} *\d{1}[A-Z]{1}\d{1}$";
    NSPredicate *zip_no=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",zip_regex_str];
    

    
    if(self.postalCode.text.length < 1 || [zip_no evaluateWithObject:self.postalCode.text])
    {
        self.postalCode.backgroundColor = [UIColor yellowColor];
    }else{
        self.postalCode.backgroundColor = [UIColor whiteColor];
    }
    
    if([self.residentialStatusButton.titleLabel.text isEqualToString:@"Choose"])
    {
        isValid=false;
        
    }
    /*
    Minimum – 1, Maximum – 12 characters
    Rules (1) If Residential Status = Own, Rent, Board Total Monthly Housing Cost is Required and must be >$0.00
    (2) If Residential Status = Live with Parents/Relatives Total Monthly Housing Cost is NOT Required
    */
    
    int totalCosts = [self.totalMonthlyHousingCosts.text intValue];
    
    if(self.totalMonthlyHousingCosts.text.length>12 ||
       !(totalCosts==0 &&
         [ self.residentialStatusButton.titleLabel.text  isEqualToString:@"Live with Parents/Relatives"  ]
         )
       )
    {
        isValid=false;
        
    }
    
    
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    [self.accordion setSelectedIndex:3];
    
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.selectLanguageOfCorespondace setTitle:@"English" forState:UIControlStateNormal];
    
    self.provinceArray = [NSArray new];
    self.provinceArray = @[@"Alberta", @"British Columbia", @"Manitoba", @"New Brunswick", @"Newfoundland & Labrador", @"Nova Scotia", @"Northwest Territories", @"Nunavut", @"Ontario", @"Prince Edward Island", @"Quebec", @"Saskatchewan", @"Yukon"];
    
    
    self.titleArray = [NSArray new];
    self.titleArray = @[@"Mr.", @"Mrs.", @"Miss.", @"Ms.", @"Dr."];
    
    self.genderArray = [NSArray new];
    self.genderArray = @[@"Male", @"Female"];
    
    self.languageOfCorespondaceArray = [NSArray new];
    self.languageOfCorespondaceArray = @[@"English", @"French"];
    
    self.residentialStatusArray = [NSArray new];
    self.residentialStatusArray = @[@"Own", @"Rent", @"Live w/Parents/Relatives", @"Board"];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
    
    
    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(17, 170, 990, 420)];
    [self.view addSubview:self.accordion];
    
    // Only height is taken into account, so other parameters are just dummy
    UIButton *header1= [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    header1.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    [header1 setTitle:@"General Information" forState:UIControlStateNormal];
    header1.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.doneGeneralInfo = header1;
    
    [self.accordion addHeader:self.doneGeneralInfo withView:self.generalInfoView];
    
    UIButton *header2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    header2.backgroundColor = [UIColor  colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    [header2 setTitle:@"Current Home Address" forState:UIControlStateNormal];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 400)];
    view2.backgroundColor = [UIColor whiteColor];
    
    //need to figure out how to alternate the color of white and green
    [self.accordion addHeader:header2 withView:self.currentHomeAddressView];
    
    [self.accordion setNeedsLayout];
    
    // Set this if you want to allow multiple selection
    [self.accordion setAllowsMultipleSelection:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma mark selectLanguageOfCorespondance

- (IBAction)selectLanguageOfCorespondance:(id)sender
{
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(150., 0., 60., 44.);
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(chooseLanguage:) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:doneButton];
    
    self.languageOfCorespondacePicker = [[UIPickerView alloc]init];//Date picker
    self.languageOfCorespondacePicker.frame = CGRectMake(0,44,220, 116);
    self.languageOfCorespondacePicker.dataSource = self;
    self.languageOfCorespondacePicker.delegate = self;
    self.languageOfCorespondacePicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.languageOfCorespondacePicker];
    
    popoverContent.view = popoverView;
    self.popoverController3 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController3.delegate = self;
    
    [self.popoverController3 setPopoverContentSize:CGSizeMake(220, 194) animated:NO];
    [self.popoverController3 presentPopoverFromRect:CGRectMake(780.0, 190.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}

- (void)chooseLanguage:(UIButton *)sender
{
    
    self.languageOfCorespondaceString = [NSString stringWithFormat:@"%@",[self.languageOfCorespondaceArray objectAtIndex:[self.languageOfCorespondacePicker selectedRowInComponent:0]]];
    [self.selectLanguageOfCorespondace setTitle:self.languageOfCorespondaceString forState:UIControlStateNormal];
    [self.popoverController3 dismissPopoverAnimated:YES];
    
}

- (IBAction)selectProvince:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(200., 0., 60., 44.);
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(chooseProvince) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:doneButton];
    
    self.statesPicker = [[UIPickerView alloc]init];//Date picker
    self.statesPicker.frame = CGRectMake(0,44,320, 216);
    self.statesPicker.dataSource = self;
    self.statesPicker.delegate = self;
    self.statesPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.statesPicker];
    
    popoverContent.view = popoverView;
    self.popoverController4 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController4.delegate = self;
    [self.popoverController4 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [self.popoverController4 presentPopoverFromRect:CGRectMake(360.0, 270.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}

- (void)chooseProvince
{
    
    //    NSLog(@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]);
    [self.provinceButton setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController4 dismissPopoverAnimated:YES];
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == self.statesPicker) {
        
        return [self.provinceArray count];
        
    }else if (pickerView == self.titlePicker){
        
        return [self.titleArray count];
        
    }else if(pickerView == self.languageOfCorespondacePicker){
        
        return [self.languageOfCorespondaceArray count];
        
    }else if (pickerView == self.genderPicker){
        
        return [self.genderArray count];
        
    }else{
        
        return [self.residentialStatusArray count];
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSString* val1;
    
    if (pickerView == self.statesPicker) {
        
        val1 = [self.provinceArray objectAtIndex:row];
        
    }else if (pickerView == self.titlePicker){
        
        val1 = [self.titleArray objectAtIndex:row];
        
    }else if(pickerView == self.languageOfCorespondacePicker){
        
        val1 = [self.languageOfCorespondaceArray objectAtIndex:row];
        
    }else if (pickerView == self.genderPicker){
        
        val1 = [self.genderArray objectAtIndex:row];
        
    }else{
        
        val1 = [self.residentialStatusArray objectAtIndex:row];
    }
    
    return val1;
}

- (IBAction)selectResidentialStatus:(id)sender
{
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(200., 0., 60., 44.);
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(chooseResidentialStatus) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:doneButton];
    
    self.residentialStatusPicker = [[UIPickerView alloc]init];//Date picker
    self.residentialStatusPicker.frame = CGRectMake(0,44,320, 216);
    self.residentialStatusPicker.dataSource = self;
    self.residentialStatusPicker.delegate = self;
    self.residentialStatusPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.residentialStatusPicker];
    
    popoverContent.view = popoverView;
    self.popoverController5 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController5.delegate = self;
    [self.popoverController5 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [self.popoverController5 presentPopoverFromRect:CGRectMake(770.0, 220.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}

- (void)chooseResidentialStatus
{
    
    [self.residentialStatusButton setTitle:[NSString stringWithFormat:@"%@",[self.residentialStatusArray objectAtIndex:[self.residentialStatusPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController5 dismissPopoverAnimated:YES];
    
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.firstName || textField == self.lastName ) {
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORFIRSTNAME && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORFIRSTNAME];
            return NO;
        }
        return YES;
        
    }else if(textField == self.sinNumber){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORSIN && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORSIN];
            return NO;
        }
        return YES;
        
    }else if(textField == self.streetAddress){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORSTREETADDRESS && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORSTREETADDRESS];
            return NO;
        }
        return YES;
        
    }else if(textField == self.currentCity){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORCURRENTCITY && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORCURRENTCITY];
            return NO;
        }
        return YES;
        
    }else if(textField == self.totalMonthlyHousingCosts){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORTOTALMONTHLYCOSTS && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORTOTALMONTHLYCOSTS];
            return NO;
        }
        return YES;
        
    }
    
    return YES;
}

@end
