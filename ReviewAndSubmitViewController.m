//
//  ReviewAndSubmitViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 12/9/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "ReviewAndSubmitViewController.h"
#import "AppDelegate.h"
#import "User.h"

@interface ReviewAndSubmitViewController ()

@end

@implementation ReviewAndSubmitViewController

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
    
    self.userInfo = nil;
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext* context = [appDelegate managedObjectContext];
    
    NSFetchRequest* request = [NSFetchRequest new];
    //    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"firstName = %@", _firstName];
    //    [request setPredicate:predicate];
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSError* error = nil;
    NSArray* fetchedResult = [context executeFetchRequest:request error:&error];

    
    if (![fetchedResult count] == 0) {
    
        self.userInfo = [fetchedResult objectAtIndex:0];
        
    }
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(12, 172, 988, 520)];
    [self.view addSubview:self.accordion];
    
    // Only height is taken into account, so other parameters are just dummy
    self.firstVIew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.firstVIew.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"General Info";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstVIew addSubview:firstHeaderTitel];
    [self.accordion addHeader:self.firstVIew withView:self.firstView1];
    
    
    self.secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.secondView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    UILabel* secondHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    secondHeaderTitel.backgroundColor = [UIColor clearColor];
    secondHeaderTitel.textColor = [UIColor whiteColor];
    secondHeaderTitel.text = @"Current Home Address";
    secondHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondView addSubview:secondHeaderTitel];
    [self.accordion addHeader:self.secondView withView:self.secondView1];
    
    self.firstHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* thirdHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    thirdHeaderTitel.backgroundColor = [UIColor clearColor];
    thirdHeaderTitel.textColor = [UIColor whiteColor];
    thirdHeaderTitel.text = @"Your Financial Details";
    thirdHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstHeaderView addSubview:thirdHeaderTitel];
    
    [self.accordion addHeader:self.firstHeaderView withView:self.financialDetails];
    
    self.secondHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* forthHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    forthHeaderTitel.backgroundColor = [UIColor clearColor];
    forthHeaderTitel.textColor = [UIColor whiteColor];
    forthHeaderTitel.text = @"Employer's Details";
    forthHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondHeaderView addSubview:forthHeaderTitel];
    
    [self.accordion addHeader:self.secondHeaderView withView:self.employerDetails];
    
    
    self.thirdHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* fifthHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 300., 40.)];
    fifthHeaderTitel.backgroundColor = [UIColor clearColor];
    fifthHeaderTitel.textColor = [UIColor whiteColor];
    fifthHeaderTitel.text = @"Income & Credit Limit Details";
    fifthHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.thirdHeaderView addSubview:fifthHeaderTitel];
    
    [self.accordion addHeader:self.thirdHeaderView withView:self.incomeAndCreditLimts];
    
    [self.accordion setSelectedIndex:10];
    [self changeFirstHeaderHeightAndAddInfo];
    [self changeSecondHeaderHeightAndAddInfo];
    [self changeThirdHeaderHeightAndAddInfo];
    [self changeForthHeaderHeightAndAddInfo];
    [self changeFifthHeaderHeightAndAddInfo];
}


#pragma mark
#pragma mark changeFirstHeaderHeightAndAddInfo

- (void)changeFirstHeaderHeightAndAddInfo
{
    self.firstVIew.frame = CGRectMake(self.firstVIew.frame.origin.x, self.firstVIew.frame.origin.y, self.firstVIew.frame.size.width, self.firstVIew.frame.size.height + 50);
    self.firstVIew.backgroundColor = [UIColor colorWithRed:1. green:0. blue:0. alpha:0.3];
    
    for (UILabel *tmpLabel in [self.firstVIew subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    
    self.editFirstView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editFirstView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editFirstView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editFirstView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editFirstView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateDisabled];
    [self.editFirstView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editFirstView addTarget:self action:@selector(editFirstViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.firstVIew addSubview:self.editFirstView];
    
    UILabel* userName = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 200., 30.)];
    userName.textColor = [UIColor blackColor];
    userName.font = [UIFont fontWithName:@"Helvetica" size:16];
    userName.backgroundColor = [UIColor clearColor];
    userName.text = [NSString stringWithFormat:@"%@ %@ %@",self.userInfo.title, self.userInfo.firstName, self.userInfo.lastName];
    [self.firstVIew addSubview:userName];
    
    UILabel* phoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(290., 33., 200., 30.)];
    phoneNumber.textColor = [UIColor blackColor];
    phoneNumber.font = [UIFont fontWithName:@"Helvetica" size:16];
    phoneNumber.backgroundColor = [UIColor clearColor];
    phoneNumber.text = [NSString stringWithFormat:@"%@",self.userInfo.primaryPhone];
    [self.firstVIew addSubview:phoneNumber];
    
    UILabel* email = [[UILabel alloc] initWithFrame:CGRectMake(290., 63., 200., 30.)];
    email.textColor = [UIColor blackColor];
    email.font = [UIFont fontWithName:@"Helvetica" size:16];
    email.backgroundColor = [UIColor clearColor];
    email.text = [NSString stringWithFormat:@"%@",self.userInfo.email];
    [self.firstVIew addSubview:email];
    
    UILabel* genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 3., 100., 30.)];
    genderLabel.textColor = [UIColor blackColor];
    genderLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    genderLabel.backgroundColor = [UIColor clearColor];
    genderLabel.text = [NSString stringWithFormat:@"%@",self.userInfo.gender];
    [self.firstVIew addSubview:genderLabel];
    
    UILabel* preferedLanguage = [[UILabel alloc] initWithFrame:CGRectMake(590., 33., 100., 30.)];
    preferedLanguage.textColor = [UIColor blackColor];
    preferedLanguage.font = [UIFont fontWithName:@"Helvetica" size:16];
    preferedLanguage.backgroundColor = [UIColor clearColor];
    preferedLanguage.text = [NSString stringWithFormat:@"%@",self.userInfo.languagOfCorespondace];
    [self.firstVIew addSubview:preferedLanguage];
}

#pragma mark
#pragma mark changeSecondHeaderHeightAndAddInfo

- (void)changeSecondHeaderHeightAndAddInfo
{
    self.secondView.frame = CGRectMake(self.secondView.frame.origin.x, self.secondView.frame.origin.y, self.secondView.frame.size.width, self.secondView.frame.size.height + 50);
    self.secondView.backgroundColor = [UIColor colorWithRed:0. green:1. blue:0. alpha:0.3];
    
    for (UILabel *tmpLabel in [self.secondView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    
    self.editSecondView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editSecondView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editSecondView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateDisabled];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editSecondView addTarget:self action:@selector(editSecondViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondView addSubview:self.editSecondView];
    
    UILabel* address = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 200., 50.)];
    address.textColor = [UIColor blackColor];
    address.backgroundColor = [UIColor blackColor];
    address.font = [UIFont fontWithName:@"Helvetica" size:16];
    address.numberOfLines = 0;
    address.backgroundColor = [UIColor clearColor];
    address.text = [NSString stringWithFormat:@"%@ %@ %@",self.userInfo.street, self.userInfo.city, self.userInfo.province];
    [self.secondView addSubview:address];
    
    UILabel* residentialStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 3., 200., 30.)];
    residentialStatusLabel.textColor = [UIColor blackColor];
    residentialStatusLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    residentialStatusLabel.backgroundColor = [UIColor clearColor];
    residentialStatusLabel.text = [NSString stringWithFormat:@"Residential Status: %@",self.userInfo.resincialStatus];
    [self.secondView addSubview:residentialStatusLabel];
    
    UILabel* totalMonthlyCostsLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 33., 200., 50.)];
    totalMonthlyCostsLabel.textColor = [UIColor blackColor];
    totalMonthlyCostsLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    totalMonthlyCostsLabel.backgroundColor = [UIColor clearColor];
    totalMonthlyCostsLabel.numberOfLines = 0;
    totalMonthlyCostsLabel.text = [NSString stringWithFormat:@"Total monthly housing costs: %@",self.userInfo.monthlyHouseCosts];
    [self.secondView addSubview:totalMonthlyCostsLabel];
}


#pragma mark
#pragma mark changeThirdHeaderHeightAndAddInfo

- (void)changeThirdHeaderHeightAndAddInfo
{
    self.firstHeaderView.frame = CGRectMake(self.firstHeaderView.frame.origin.x, self.firstHeaderView.frame.origin.y, self.firstHeaderView.frame.size.width, self.firstHeaderView.frame.size.height + 50);
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0. green:0. blue:1. alpha:0.3];
    
    for (UILabel *tmpLabel in [self.firstHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    
    self.editThirdView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editThirdView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editThirdView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editThirdView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editThirdView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateDisabled];
    [self.editThirdView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editThirdView addTarget:self action:@selector(editThirdViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.firstHeaderView addSubview:self.editThirdView];
    
    UILabel* employmentStatus = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 500., 30.)];
    employmentStatus.textColor = [UIColor blackColor];
    employmentStatus.font = [UIFont fontWithName:@"Helvetica" size:16];
    employmentStatus.backgroundColor = [UIColor clearColor];
    employmentStatus.text = [NSString stringWithFormat:@"Employment Status: %@",self.userInfo.employmentStatus];
    [self.firstHeaderView addSubview:employmentStatus];
    
    UILabel* currentOccupation = [[UILabel alloc] initWithFrame:CGRectMake(290., 33., 500., 30.)];
    currentOccupation.textColor = [UIColor blackColor];
    currentOccupation.font = [UIFont fontWithName:@"Helvetica" size:16];
    currentOccupation.backgroundColor = [UIColor clearColor];
    currentOccupation.text = [NSString stringWithFormat:@"Current Occupation: %@",self.userInfo.currentOcupation];
    [self.firstHeaderView addSubview:currentOccupation];
}

#pragma mark
#pragma mark changeForthHeaderHeightAndAddInfo

- (void)changeForthHeaderHeightAndAddInfo
{
    self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height + 50);
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:1. green:0. blue:0. alpha:0.3];
    
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    
    self.editForthView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editForthView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editForthView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editForthView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editForthView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateDisabled];
    [self.editForthView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editForthView addTarget:self action:@selector(editForthViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondHeaderView addSubview:self.editForthView];
    
    UILabel* employerName = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 300., 30.)];
    employerName.textColor = [UIColor blackColor];
    employerName.font = [UIFont fontWithName:@"Helvetica" size:16];
    employerName.backgroundColor = [UIColor clearColor];
    employerName.numberOfLines = 0;
    employerName.text = [NSString stringWithFormat:@"Employment Name: %@",self.userInfo.employerName];
    [self.secondHeaderView addSubview:employerName];
    
    UILabel* startDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(290., 33., 300., 30.)];
    startDateLabel.textColor = [UIColor blackColor];
    startDateLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    startDateLabel.backgroundColor = [UIColor clearColor];
    startDateLabel.numberOfLines = 0;
    startDateLabel.text = [NSString stringWithFormat:@"Start date:"];
    [self.secondHeaderView addSubview:startDateLabel];
    
    UILabel* employerStreetAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 3., 400., 30.)];
    employerStreetAddressLabel.textColor = [UIColor blackColor];
    employerStreetAddressLabel.numberOfLines = 0;
    employerStreetAddressLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    employerStreetAddressLabel.backgroundColor = [UIColor clearColor];
    employerStreetAddressLabel.text = [NSString stringWithFormat:@"%@",self.userInfo.employerStreetAddress];
    [self.secondHeaderView addSubview:employerStreetAddressLabel];
}

#pragma mark
#pragma mark changeFifthHeaderHeightAndAddInfo

- (void)changeFifthHeaderHeightAndAddInfo
{
    self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height + 50);
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0. green:1. blue:0. alpha:0.3];
    
    for (UILabel *tmpLabel in [self.thirdHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    
    self.editFifthView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editFifthView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editFifthView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editFifthView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editFifthView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateDisabled];
    [self.editFifthView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editFifthView addTarget:self action:@selector(editFifthViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdHeaderView addSubview:self.editFifthView];
    
    UILabel* employerName = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 300., 30.)];
    employerName.textColor = [UIColor blackColor];
    employerName.font = [UIFont fontWithName:@"Helvetica" size:16];
    employerName.backgroundColor = [UIColor clearColor];
    employerName.numberOfLines = 0;
    employerName.text = [NSString stringWithFormat:@"Requested Credit Limit: %@",self.userInfo.requestedCreditLimit];
    [self.thirdHeaderView addSubview:employerName];
    
    UILabel* startDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(290., 33., 300., 30.)];
    startDateLabel.textColor = [UIColor blackColor];
    startDateLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    startDateLabel.backgroundColor = [UIColor clearColor];
    startDateLabel.numberOfLines = 0;
    startDateLabel.text = [NSString stringWithFormat:@"Gross Anual Income: %@", self.userInfo.grossAnualIncome];
    [self.thirdHeaderView addSubview:startDateLabel];
}

- (void)checkToseeWhichViewIsOpen
{
    
    
        
}

#pragma mark
#pragma mark editFirstViewAction

- (void)editFirstViewAction:(id)sender
{
   
    [self.accordion setSelectedIndex:0];
    
    self.editFirstView.enabled = NO;
    self.editSecondView.enabled = NO;
    self.editThirdView.enabled = NO;
    self.editForthView.enabled = NO;
    self.editFifthView.enabled = NO;
    
    for (UILabel *tmpLabel in [self.firstVIew subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    for (UIButton *tmpButton in [self.firstVIew subviews]) {
        [tmpButton removeFromSuperview];
    }
    
    if (self.firstVIew.frame.size.height > 50) {
        
        self.firstVIew.frame = CGRectMake(self.firstVIew.frame.origin.x, self.firstVIew.frame.origin.y, self.firstVIew.frame.size.width, self.firstVIew.frame.size.height - 50);
        
    }else{
        
        self.firstVIew.frame = CGRectMake(self.firstVIew.frame.origin.x, self.firstVIew.frame.origin.y, self.firstVIew.frame.size.width, self.firstVIew.frame.size.height + 50);
        
    }
    
    self.firstVIew.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"General Information";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstVIew addSubview:firstHeaderTitel];
    
}

#pragma mark
#pragma mark editFirstViewAction

- (void)editSecondViewAction:(id)sender
{
    
    self.editFirstView.enabled = NO;
    self.editSecondView.enabled = NO;
    self.editThirdView.enabled = NO;
    self.editForthView.enabled = NO;
    self.editFifthView.enabled = NO;
    [self.accordion setSelectedIndex:1];
    
    for (UILabel *tmpLabel in [self.secondView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    for (UIButton *tmpButton in [self.secondView subviews]) {
        [tmpButton removeFromSuperview];
    }
    
    if (self.secondView.frame.size.height > 50) {
        
        self.secondView.frame = CGRectMake(self.secondView.frame.origin.x, self.secondView.frame.origin.y, self.secondView.frame.size.width, self.secondView.frame.size.height - 50);
        
    }else{
        
        self.secondView.frame = CGRectMake(self.secondView.frame.origin.x, self.secondView.frame.origin.y, self.secondView.frame.size.width, self.secondView.frame.size.height + 50);
        
    }
    
    self.secondView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Current Home Address";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondView addSubview:firstHeaderTitel];
    
    
}

#pragma mark
#pragma mark editFirstViewAction

- (void)editThirdViewAction:(id)sender
{
    
    self.editFirstView.enabled = NO;
    self.editSecondView.enabled = NO;
    self.editThirdView.enabled = NO;
    self.editForthView.enabled = NO;
    self.editFifthView.enabled = NO;
    [self.accordion setSelectedIndex:2];
    
    for (UILabel *tmpLabel in [self.firstHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    for (UIButton *tmpButton in [self.firstHeaderView subviews]) {
        [tmpButton removeFromSuperview];
    }
    
    if (self.firstHeaderView.frame.size.height > 50) {
        
        self.firstHeaderView.frame = CGRectMake(self.firstHeaderView.frame.origin.x, self.firstHeaderView.frame.origin.y, self.firstHeaderView.frame.size.width, self.firstHeaderView.frame.size.height - 50);
        
    }else{
        
        self.secondView.frame = CGRectMake(self.firstHeaderView.frame.origin.x, self.firstHeaderView.frame.origin.y, self.firstHeaderView.frame.size.width, self.firstHeaderView.frame.size.height + 50);
        
    }
    
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Your Financial Details";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstHeaderView addSubview:firstHeaderTitel];
    
}

#pragma mark
#pragma mark editFirstViewAction

- (void)editForthViewAction:(id)sender
{
    
    self.editFirstView.enabled = NO;
    self.editSecondView.enabled = NO;
    self.editThirdView.enabled = NO;
    self.editForthView.enabled = NO;
    self.editFifthView.enabled = NO;
    [self.accordion setSelectedIndex:3];
    
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    for (UIButton *tmpButton in [self.secondHeaderView subviews]) {
        [tmpButton removeFromSuperview];
    }
    
    if (self.secondHeaderView.frame.size.height > 50) {
        
        self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height - 50);
        
    }else{
        
        self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height + 50);
        
    }
    
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Employer's Details";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondHeaderView addSubview:firstHeaderTitel];
    
}

#pragma mark
#pragma mark editFirstViewAction

- (void)editFifthViewAction:(id)sender
{
    self.editFirstView.enabled = NO;
    self.editSecondView.enabled = NO;
    self.editThirdView.enabled = NO;
    self.editForthView.enabled = NO;
    self.editFifthView.enabled = NO;
    [self.accordion setSelectedIndex:4];
    
    for (UILabel *tmpLabel in [self.thirdHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    for (UIButton *tmpButton in [self.thirdHeaderView subviews]) {
        [tmpButton removeFromSuperview];
    }
    
    if (self.thirdHeaderView.frame.size.height > 50) {
        
        self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height - 50);
        
    }else{
        
        self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height + 50);
        
    }
    
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Income & Credit Limit";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.thirdHeaderView addSubview:firstHeaderTitel];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeGeneralInfo:(id)sender
{
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.firstViewOpen = NO;
    self.firstVIew.backgroundColor = [UIColor colorWithRed:1. green:0. blue:0. alpha:0.3];
    
    [self changeFirstHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
}

- (IBAction)closeCurrentAddress:(id)sender
{
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.secondViewOpen = NO;
    self.secondView.backgroundColor = [UIColor colorWithRed:0. green:1. blue:0. alpha:0.3];
    
    [self changeSecondHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
    
}

- (IBAction)closeFInancialDetails:(id)sender
{
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.thirdViewOpen = NO;
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0. green:0. blue:1. alpha:0.3];
    
    [self changeThirdHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
    
}

- (IBAction)closeEmployerDetails:(id)sender
{
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.forthViewOpen = NO;
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:1. green:0. blue:0. alpha:0.3];
    
    [self changeThirdHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
    
}

- (IBAction)closeIncomeAndCredit:(id)sender
{
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.fifthViewOpen = NO;
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0. green:1. blue:0. alpha:0.3];
    
    [self changeThirdHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
    
}
@end
