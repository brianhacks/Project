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

@synthesize gender, titleString, languageOfCorespondaceString, editFirstView, monthsLivedArray, yearsLivedArray;

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
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 220.0, 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseTitle)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.titlePicker = [[UIPickerView alloc]init];//Date picker
    self.titlePicker.frame = CGRectMake(0,44,220, 116);
    self.titlePicker.dataSource = self;
    self.titlePicker.delegate = self;
    self.titlePicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.titlePicker];
    
    popoverContent.view = popoverView;
    self.popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController2.delegate = self;
    
    [self.popoverController2 setPopoverContentSize:CGSizeMake(220, 200) animated:NO];
    [self.popoverController2 presentPopoverFromRect:CGRectMake(15.0, 220.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
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
    [appDelegate addInfoToUser:self.selectLanguageOfCorespondace.titleLabel.text andFieldToAddItTo:@"languagOfCorespondace"];
    [appDelegate addInfoToUser:self.sinNumber.text andFieldToAddItTo:@"sin"];
    [appDelegate addInfoToUser:self.streetAddress.text andFieldToAddItTo:@"street"];
    [appDelegate addInfoToUser:self.postalCode.text andFieldToAddItTo:@"postalCode"];
    [appDelegate addInfoToUser:self.totalMonthlyHousingCosts.text andFieldToAddItTo:@"monthlyHouseCosts"];
    [appDelegate addInfoToUser:self.currentCity.text andFieldToAddItTo:@"city"];
    [appDelegate addInfoToUser:self.residentialStatusButton.titleLabel.text andFieldToAddItTo:@"resincialStatus"];
    [appDelegate addInfoToUser:self.totalMonthlyHousingCosts.text andFieldToAddItTo:@"monthlyHouseCosts"];
    [appDelegate addInfoToUser:self.provinceButton.titleLabel.text andFieldToAddItTo:@"province"];
    
    [appDelegate setNewRootView:appDelegate.financialInfoViewController];
    [appDelegate.financialInfoViewController refresh];
    
    
}

- (IBAction)selectGender:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    //    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    doneButton.frame = CGRectMake(150., 0., 60., 44.);
    //    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    //    [doneButton addTarget:self action:@selector(selectGender) forControlEvents:UIControlEventTouchUpInside];
    //    [popoverView addSubview:doneButton];
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 220.0, 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(selectGender)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.genderPicker = [[UIPickerView alloc]init];//Date picker
    self.genderPicker.frame = CGRectMake(0,44,220, 116);
    self.genderPicker.dataSource = self;
    self.genderPicker.delegate = self;
    self.genderPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.genderPicker];
    
    popoverContent.view = popoverView;
    self.popoverController1 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController1.delegate = self;
    
    [self.popoverController1 setPopoverContentSize:CGSizeMake(220, 204) animated:NO];
    [self.popoverController1 presentPopoverFromRect:CGRectMake(545.0, 220.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
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

#pragma mark
#pragma mark closeGeneralView

- (IBAction)closeGeneralInfoView:(id)sender
{
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    for (UIButton *tmpButton in [self.secondHeaderView subviews]) {
        [tmpButton removeFromSuperview];
    }
    
    if (self.secondHeaderView.frame.size.height > 50) {
        
        self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height - 50);
        
    }
    
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Current Home Address";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondHeaderView addSubview:firstHeaderTitel];
    
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
    
    //    NSString *str=@"^\\+(?:[0-9] ?){6,14}[0-9]$";
    //    NSPredicate *no=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
    
    if(self.primaryPhoneNumber.text.length < 1){
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
    
    //sin is optional
    //    if(self.sinNumber.text.length > 9 ){
    //        //mark field as invalid
    //        self.sinNumber.backgroundColor = [UIColor yellowColor];
    //    }else{
    //        self.sinNumber.backgroundColor = [UIColor whiteColor];
    //
    //    }
    
    //mail is optional
    //    NSString *email_regex_str=@".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    //    NSPredicate *email_no=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",email_regex_str];
    //
    //    if(self.emailAddress.text.length > 0 && [email_no evaluateWithObject:self.emailAddress.text]==NO){
    //        //mark field as invalid
    //        self.emailAddress.backgroundColor = [UIColor yellowColor];
    //    }else{
    //        self.emailAddress.backgroundColor = [UIColor whiteColor];
    //
    //    }
    
    
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    //TODO need to modify accordion to replace panel with infopanel and hide header.
    [self.accordion setSelectedIndex:1];
    UIImage *image2 = [UIImage imageNamed:@"banner-3a.png"];

    [self.personalHeader setImage:image2];
    [self changeFirstHeaderHeightAndAddInfo];
    self.firstViewClosed = YES;
    
    
}

- (void)changeFirstHeaderHeightAndAddInfo
{
    self.firstHeaderView.frame = CGRectMake(self.firstHeaderView.frame.origin.x, self.firstHeaderView.frame.origin.y, self.firstHeaderView.frame.size.width, self.firstHeaderView.frame.size.height + 50);
    self.firstHeaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.firstHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    
    self.editFirstView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editFirstView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editFirstView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editFirstView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editFirstView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editFirstView addTarget:self action:@selector(editFirstViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.firstHeaderView addSubview:self.editFirstView];
    
    UILabel* userName = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 200., 30.)];
    userName.textColor = [UIColor blackColor];
    userName.font = [UIFont fontWithName:@"Helvetica" size:16];
    userName.backgroundColor = [UIColor clearColor];
    userName.text = [NSString stringWithFormat:@"%@ %@",self.firstName.text, self.lastName.text];
    [self.firstHeaderView addSubview:userName];
    
    UILabel* phoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(290., 33., 200., 30.)];
    phoneNumber.textColor = [UIColor blackColor];
    phoneNumber.font = [UIFont fontWithName:@"Helvetica" size:16];
    phoneNumber.backgroundColor = [UIColor clearColor];
    phoneNumber.text = [NSString stringWithFormat:@"%@",self.primaryPhoneNumber.text];
    [self.firstHeaderView addSubview:phoneNumber];
    
    UILabel* email = [[UILabel alloc] initWithFrame:CGRectMake(290., 63., 200., 30.)];
    email.textColor = [UIColor blackColor];
    email.font = [UIFont fontWithName:@"Helvetica" size:16];
    email.backgroundColor = [UIColor clearColor];
    email.text = [NSString stringWithFormat:@"%@",self.emailAddress.text];
    [self.firstHeaderView addSubview:email];
    
    UILabel* genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 3., 100., 30.)];
    genderLabel.textColor = [UIColor blackColor];
    genderLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    genderLabel.backgroundColor = [UIColor clearColor];
    genderLabel.text = [NSString stringWithFormat:@"%@",self.gender];
    [self.firstHeaderView addSubview:genderLabel];
    
    UILabel* preferedLanguage = [[UILabel alloc] initWithFrame:CGRectMake(590., 33., 100., 30.)];
    preferedLanguage.textColor = [UIColor blackColor];
    preferedLanguage.font = [UIFont fontWithName:@"Helvetica" size:16];
    preferedLanguage.backgroundColor = [UIColor clearColor];
    preferedLanguage.text = [NSString stringWithFormat:@"%@",self.selectLanguageOfCorespondace.titleLabel.text];
    [self.firstHeaderView addSubview:preferedLanguage];
}

- (void)editFirstViewAction:(id)sender
{
    self.firstHeaderView.frame = CGRectMake(self.firstHeaderView.frame.origin.x, self.firstHeaderView.frame.origin.y, self.firstHeaderView.frame.size.width, self.firstHeaderView.frame.size.height - 50);
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    for (UILabel *tmpLabel in [self.firstHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"General Info";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:0];
    self.firstViewClosed = NO;
}


#pragma mark
#pragma mark closeAddressView
- (IBAction)closeAddressView:(id)sender;
{
    bool isValid=true;
    
    if(self.streetAddress.text.length < 1)
    {
        isValid=false;
        //mark field as invalid
        self.streetAddress.backgroundColor = [UIColor yellowColor];
    }else{
        self.streetAddress.backgroundColor = [UIColor whiteColor];
        
    }
    if(self.currentCity.text.length < 1)
    {
        isValid=false;
        //mark field as invalid
        self.currentCity.backgroundColor = [UIColor yellowColor];
    }else{
        self.currentCity.backgroundColor = [UIColor whiteColor];
        
    }
    if([self.provinceButton.titleLabel.text isEqualToString:@"Province"]){
        isValid = false;
        
        self.provinceButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.provinceButton.backgroundColor = [UIColor whiteColor];
    }
    
    if([self.timeLivedAtCurrentAddress.titleLabel.text isEqualToString:@"Years & Months"]){
        isValid = false;
        
        self.timeLivedAtCurrentAddress.backgroundColor = [UIColor yellowColor];
    }else{
        self.timeLivedAtCurrentAddress.backgroundColor = [UIColor whiteColor];
    }
    
    
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
    
    if(!(totalCosts == 0 && [ self.residentialStatusButton.titleLabel.text  isEqualToString:@"Live with Parents/Relatives"  ]
         )
       )
    {
        //        isValid=false;
        
    }
    
    
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    //geocode address
    
    
    NSString *query = [NSString stringWithFormat:@"%@ %@ %@", self.streetAddress.text, self.currentCity.text, self.provinceButton.titleLabel.text];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
        if ([placemarks count] > 0) {
            
            
            UIImage *image2 = [UIImage imageNamed:@"banner-3b.png"];
            [self.personalHeader setImage:image2];

            self.streetAddress.backgroundColor = [UIColor whiteColor];
            [self.accordion setSelectedIndex:3];
            [self changeSecondHeaderHeightAndAddInfo];
        } else {
            
            self.streetAddress.backgroundColor = [UIColor yellowColor];
            
        }}];
    
    
    
    
    
    
    
}

- (void)changeSecondHeaderHeightAndAddInfo
{
    
    self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height + 50);
    self.secondHeaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    
    self.editSecondView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editSecondView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editSecondView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editSecondView addTarget:self action:@selector(editSecondViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondHeaderView addSubview:self.editSecondView];
    
    UILabel* address = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 200., 50.)];
    address.textColor = [UIColor blackColor];
    address.backgroundColor = [UIColor blackColor];
    address.font = [UIFont fontWithName:@"Helvetica" size:16];
    address.numberOfLines = 0;
    address.backgroundColor = [UIColor clearColor];
    address.text = [NSString stringWithFormat:@"%@ %@ %@",self.streetAddress.text, self.currentCity.text, self.provinceButton.titleLabel.text];
    [self.secondHeaderView addSubview:address];
    
    UILabel* residentialStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 3., 200., 30.)];
    residentialStatusLabel.textColor = [UIColor blackColor];
    residentialStatusLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    residentialStatusLabel.backgroundColor = [UIColor clearColor];
    residentialStatusLabel.text = [NSString stringWithFormat:@"Residential Status: %@",self.residentialStatusButton.titleLabel.text];
    [self.secondHeaderView addSubview:residentialStatusLabel];
    
    UILabel* totalMonthlyCostsLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 33., 200., 50.)];
    totalMonthlyCostsLabel.textColor = [UIColor blackColor];
    totalMonthlyCostsLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    totalMonthlyCostsLabel.backgroundColor = [UIColor clearColor];
    totalMonthlyCostsLabel.numberOfLines = 0;
    totalMonthlyCostsLabel.text = [NSString stringWithFormat:@"Total monthly housing costs: %@",self.totalMonthlyHousingCosts.text];
    [self.secondHeaderView addSubview:totalMonthlyCostsLabel];
    
}

- (void)editSecondViewAction:(id)sender
{
    self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height - 50);
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Current Home Address";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:1];
}

- (void)viewWillDisappear:(BOOL)animated{
    
//    [self.selectTitelButton setTitle:@"Title" forState:UIControlStateNormal];
//    self.firstName.text = @"";
//    self.lastName.text = @"";
//    self.areaCode.text = @"";
//    self.primaryPhoneNumber.text = @"";
//    self.emailAddress.text = @"";
//    [self.selectGenderButton setTitle:@"Gender" forState:UIControlStateNormal];
//    [self.selectLanguageOfCorespondace setTitle:@"Language of Correspondance" forState:UIControlStateNormal];
//    self.sinNumber.text = @"";
//    self.streetAddress.text = @"";
//    self.postalCode.text = @"";
//    self.totalMonthlyHousingCosts.text = @"";
//    self.currentCity.text = @"";
//    [self.residentialStatusButton setTitle:@"Choose" forState:UIControlStateNormal];
//    self.totalMonthlyHousingCosts.text = @"";
//    [self.provinceButton setTitle:@"Province" forState:UIControlStateNormal];
//    
//    [self.accordion setSelectedIndex:0];
//    [self.accordion setNeedsLayout];
    
}


#pragma mark
#pragma mark viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.monthsLivedArray = [NSArray new];
    self.monthsLivedArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12"];
    
    self.yearsLivedArray = [NSArray new];
    self.yearsLivedArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40"];
    
    [self.nextStepButton setImage:[UIImage imageNamed:@"btn-next-inactive.png"] forState:UIControlStateDisabled];
    self.nextStepButton.enabled = NO;
    
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
    
    //MTK - make sure it fits int he shoadows
    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(18, 170, 989, 420)];
    [self.view addSubview:self.accordion];
    
    // Only height is taken into account, so other parameters are just dummy
    self.firstHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"General Info";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstHeaderView addSubview:firstHeaderTitel];
    [self.accordion addHeader:self.firstHeaderView withView:self.generalInfoView];
    
    self.secondHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* secondHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    secondHeaderTitel.backgroundColor = [UIColor clearColor];
    secondHeaderTitel.textColor = [UIColor whiteColor];
    secondHeaderTitel.text = @"Current Home Address";
    secondHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondHeaderView addSubview:secondHeaderTitel];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 400)];
    view2.backgroundColor = [UIColor whiteColor];
    
    UIImageView* bottomCurve = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 243.0, 1024., 46.)];
    bottomCurve.image = [UIImage imageNamed:@"bottom-curve.png"];
    //    [self.accordion addSubview:bottomCurve];
    
    //need to figure out how to alternate the color of white and green
    [self.accordion addHeader:self.secondHeaderView withView:self.currentHomeAddressView];
    
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
    
    //    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    doneButton.frame = CGRectMake(150., 0., 60., 44.);
    //    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    //    [doneButton addTarget:self action:@selector(chooseLanguage:) forControlEvents:UIControlEventTouchUpInside];
    //    [popoverView addSubview:doneButton];
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 220.0, 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseLanguage:)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
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
    [self.popoverController3 presentPopoverFromRect:CGRectMake(660.0, 220.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
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
    
    //    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    doneButton.frame = CGRectMake(200., 0., 60., 44.);
    //    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    //    [doneButton addTarget:self action:@selector(chooseProvince) forControlEvents:UIControlEventTouchUpInside];
    //    [popoverView addSubview:doneButton];
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320.0, 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseProvince)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.statesPicker = [[UIPickerView alloc]init];//Date picker
    self.statesPicker.frame = CGRectMake(0,44,320, 216);
    self.statesPicker.dataSource = self;
    self.statesPicker.delegate = self;
    self.statesPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.statesPicker];
    
    popoverContent.view = popoverView;
    self.popoverController4 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController4.delegate = self;
    [self.popoverController4 setPopoverContentSize:CGSizeMake(320, 260) animated:NO];
    [self.popoverController4 presentPopoverFromRect:CGRectMake(420.0, 340.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

- (void)chooseProvince
{
    
    //    NSLog(@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]);
    [self.provinceButton setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController4 dismissPopoverAnimated:YES];
    
    if (self.firstViewClosed) {
        if (self.streetAddress.text.length > 1 && self.postalCode.text.length && self.currentCity.text.length && ![self.provinceButton.titleLabel.text isEqualToString:@"Province"] && ![self.residentialStatusButton.titleLabel.text isEqualToString:@"Choose"] && self.totalMonthlyHousingCosts.text.length > 1 && ![self.timeLivedAtCurrentAddress.titleLabel.text isEqualToString:@"Years & Months"]) {
            self.nextStepButton.enabled = YES;
        }
    }
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (pickerView == self.timeLivedAtCurrentAddressPicker) {
        return 2;
    }else{
        
        return 1;
        
    }
    
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
        
    }else if(pickerView == self.timeLivedAtCurrentAddressPicker){
        
        if (component == 0) {
            
            return [self.yearsLivedArray count];
        }else if(component == 1){
            
            return [self.monthsLivedArray count];
        }else{
            
            return 100;
        }
        
        
        
    }else{
        
        return [self.residentialStatusArray count];
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSString* val1;
//    NSString* val2;
    
    if (pickerView == self.statesPicker) {
        
        val1 = [self.provinceArray objectAtIndex:row];
        
    }else if (pickerView == self.titlePicker){
        
        val1 = [self.titleArray objectAtIndex:row];
        
    }else if(pickerView == self.languageOfCorespondacePicker){
        
        val1 = [self.languageOfCorespondaceArray objectAtIndex:row];
        
    }else if (pickerView == self.genderPicker){
        
        val1 = [self.genderArray objectAtIndex:row];
        
    }else if(pickerView == self.timeLivedAtCurrentAddressPicker){
        
        if (component == 0) {
            
            val1 = [self.yearsLivedArray objectAtIndex:row];
            
        }else if (component == 1){
            
            val1 = [self.monthsLivedArray objectAtIndex:row];
        }
        
        
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
    
    //    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    //    doneButton.frame = CGRectMake(200., 0., 60., 44.);
    //    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    //    [doneButton addTarget:self action:@selector(chooseResidentialStatus) forControlEvents:UIControlEventTouchUpInside];
    //    [popoverView addSubview:doneButton];
    
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320.0, 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseResidentialStatus)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.residentialStatusPicker = [[UIPickerView alloc]init];//Date picker
    self.residentialStatusPicker.frame = CGRectMake(0,44,320, 216);
    self.residentialStatusPicker.dataSource = self;
    self.residentialStatusPicker.delegate = self;
    self.residentialStatusPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.residentialStatusPicker];
    
    popoverContent.view = popoverView;
    self.popoverController5 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController5.delegate = self;
    [self.popoverController5 setPopoverContentSize:CGSizeMake(320, 260) animated:NO];
    [self.popoverController5 presentPopoverFromRect:CGRectMake(740.0, 305.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
}

- (IBAction)showPrivacy:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    [appDelegate.modalViewController whichModalToPresent:@"privacy"];
    
}

- (IBAction)showLegal:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    [appDelegate.modalViewController whichModalToPresent:@"legal"];
    
}

- (IBAction)showSecurity:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    [appDelegate.modalViewController whichModalToPresent:@"security"];
    
}

- (void)chooseResidentialStatus
{
    
    [self.residentialStatusButton setTitle:[NSString stringWithFormat:@"%@",[self.residentialStatusArray objectAtIndex:[self.residentialStatusPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController5 dismissPopoverAnimated:YES];
    
    if (self.firstViewClosed) {
        if (self.streetAddress.text.length > 1 && self.postalCode.text.length && self.currentCity.text.length && ![self.provinceButton.titleLabel.text isEqualToString:@"Province"] && ![self.residentialStatusButton.titleLabel.text isEqualToString:@"Choose"] && self.totalMonthlyHousingCosts.text.length > 1 && ![self.timeLivedAtCurrentAddress.titleLabel.text isEqualToString:@"Years & Months"]) {
            self.nextStepButton.enabled = YES;
        }
    }
    
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    if (self.firstViewClosed) {
        if (self.streetAddress.text.length > 1 && self.postalCode.text.length && self.currentCity.text.length && ![self.provinceButton.titleLabel.text isEqualToString:@"Province"] && ![self.residentialStatusButton.titleLabel.text isEqualToString:@"Choose"] && self.totalMonthlyHousingCosts.text.length > 1 && ![self.timeLivedAtCurrentAddress.titleLabel.text isEqualToString:@"Years & Months"]) {
            self.nextStepButton.enabled = YES;
        }
    }
    
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

- (IBAction)choseHowLongYouLivedAtCurrentAddress:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    //    popoverView.backgroundColor = [UIColor grayColor];
    popoverView.backgroundColor = [UIColor blackColor];
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 220.0, 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseTime:)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    UILabel* monthsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0., 60., 60., 20.)];
    monthsLabel.text = @"Years";
    monthsLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    monthsLabel.backgroundColor = [UIColor clearColor];
    monthsLabel.textColor = [UIColor whiteColor];
    [popoverView addSubview:monthsLabel];
    
    monthsLabel = [[UILabel alloc] initWithFrame:CGRectMake(120., 60., 60., 20.)];
    monthsLabel.text = @"Months";
    monthsLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    monthsLabel.backgroundColor = [UIColor clearColor];
    monthsLabel.textColor = [UIColor whiteColor];
    [popoverView addSubview:monthsLabel];
    
    self.timeLivedAtCurrentAddressPicker = [[UIPickerView alloc]init];//Date picker
    self.timeLivedAtCurrentAddressPicker.frame = CGRectMake(0,84,220, 116);
    self.timeLivedAtCurrentAddressPicker.dataSource = self;
    self.timeLivedAtCurrentAddressPicker.delegate = self;
    self.timeLivedAtCurrentAddressPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.timeLivedAtCurrentAddressPicker];
    
    popoverContent.view = popoverView;
    self.popoverController5 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController5.delegate = self;
    
    [self.popoverController5 setPopoverContentSize:CGSizeMake(220, 214) animated:NO];
    [self.popoverController5 presentPopoverFromRect:CGRectMake(220.0, 365.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

- (void)chooseTime:(id)sender
{
    
    [self.timeLivedAtCurrentAddress setTitle:[NSString stringWithFormat:@"%@ year(s) %@ month(s)",[self.monthsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:0]], [self.yearsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:1]]] forState:UIControlStateNormal];
    [self.popoverController5 dismissPopoverAnimated:YES];
    
    NSString* years = [self.yearsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:0]];
    //    int months = [self.monthsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:0]]
    
    if ([years integerValue] <= 2) {
        
        NSLog(@"display the other view");
        // Only height is taken into account, so other parameters are just dummy
        self.thirdHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
        self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
        
        UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
        firstHeaderTitel.backgroundColor = [UIColor clearColor];
        firstHeaderTitel.textColor = [UIColor whiteColor];
        firstHeaderTitel.text = @"Previous Home Address";
        firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
        [self.thirdHeaderView addSubview:firstHeaderTitel];
        
        [self.accordion addHeader:self.thirdHeaderView withView:self.formalHomeAddress];
        
        [self.accordion setSelectedIndex:2];
        
    }else{
        
        if (self.firstViewClosed) {
            if (self.streetAddress.text.length > 1 && self.postalCode.text.length && self.currentCity.text.length && ![self.provinceButton.titleLabel.text isEqualToString:@"Province"] && ![self.residentialStatusButton.titleLabel.text isEqualToString:@"Choose"] && self.totalMonthlyHousingCosts.text.length > 1 && ![self.timeLivedAtCurrentAddress.titleLabel.text isEqualToString:@"Years & Months"]) {
                self.nextStepButton.enabled = YES;
            }
        }
        
    }
    
    
    
}


@end
