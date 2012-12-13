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
#import "FinalAcceptViewController.h"

@interface ReviewAndSubmitViewController ()
@property (nonatomic, strong) FinalAcceptViewController * finalAcceptViewController;
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
    
    self.requesteCreditLimitArray = [NSMutableArray new];
    
    self.genderArray = [NSArray new];
    self.genderArray = @[@"Male", @"Female"];
    
    self.titleArray = [NSArray new];
    self.titleArray = @[@"Mr.", @"Mrs.", @"Miss.", @"Ms.", @"Dr."];
    
    self.languageOfCorespondaceArray = [NSArray new];
    self.languageOfCorespondaceArray = @[@"English", @"French"];
    
    self.provinceArray = [NSArray new];
    self.provinceArray = @[@"Alberta", @"British Columbia", @"Manitoba", @"New Brunswick", @"Newfoundland & Labrador", @"Nova Scotia", @"Northwest Territories", @"Nunavut", @"Ontario", @"Prince Edward Island", @"Quebec", @"Saskatchewan", @"Yukon"];
    
    self.residentialStatusArray = [NSArray new];
    self.residentialStatusArray = @[@"Own", @"Rent", @"Live w/Parents/Relatives", @"Board"];
    
    self.monthsLivedArray = [NSArray new];
    self.monthsLivedArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12"];
    
    self.yearsLivedArray = [NSArray new];
    self.yearsLivedArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13", @"14", @"15", @"16", @"17", @"18", @"19", @"20", @"21", @"22", @"23", @"24", @"25", @"26", @"27", @"28", @"29", @"30", @"31", @"32", @"33", @"34", @"35", @"36", @"37", @"38", @"39", @"40"];
    
    self.occupationArray = [NSArray new];
    self.occupationArray = @[@"Accounting/Finance/Insurance",
    @"Administrative/Clarical",
    @"Banking/Real Estate/Mortgage Professionals",
    @"Biotech/R&D/Science",
    @"Building Construction/Skilled Trades",
    @"Business/Strategic Management",
    @"Creative Design",
    @"Customer Support/Client Care",
    @"Editorial/Writing",
    @"Education/Training",
    @"Engineering/Architect",
    @"Food Services/Hospitality",
    @"Human Resources",
    @"IT/Software Development",
    @"Installation/Maintenance/Repair",
    @"Legal",
    @"Logistics/Transportation",
    @"Manufacturing/Production/Operations",
    @"Marketing/Production/Operations",
    @"Marketing/Product",
    @"Medical/Health",
    @"Other",
    @"Project/Program Management",
    @"Quality Assurance/Safety",
    @"Sales/Retail/Business Development",
    @"Security/Protective Services",
    @"Trades"];
    
    self.employmentStatusArray = [NSArray new];
    self.employmentStatusArray = @[@"Employed Full Time", @"Employed Part Time", @"Self-employed", @"Unemployed", @"Retired"];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
    
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
    
    //self.accordionViewScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.,0., 1004., 680.)];
    self.accordionViewScrollView.contentSize = CGSizeMake(1, 600.);
    self.accordionViewScrollView.backgroundColor = [UIColor whiteColor];
    
   // [self.view addSubview:self.accordionViewScrollView];
    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(0, 0, 988, 900)];
    [self.accordionViewScrollView addSubview:self.accordion];
    
    // Only height is taken into account, so other parameters are just dummy
    self.firstVIew = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.firstVIew.backgroundColor = background;
    
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
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.firstVIew.backgroundColor = [UIColor whiteColor];
    
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
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.secondView.backgroundColor = [UIColor whiteColor];;
        
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
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.firstHeaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.firstHeaderView subviews]) {
        
        if ([tmpLabel isKindOfClass:[UILabel class]]) {
        
            tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
            
        }
        
        
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
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.secondHeaderView.backgroundColor = [UIColor whiteColor];
    
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
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.thirdHeaderView.backgroundColor = [UIColor whiteColor];;
    
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
   
    self.firstNameTextfield.text = self.userInfo.firstName;
    self.lastnameTextField.text = self.userInfo.lastName;
    self.primaryPhonenumberTextField.text = self.userInfo.primaryPhone;
    [self.titleButton setTitle:self.userInfo.title forState:UIControlStateNormal];
    [self.genderButton setTitle:self.userInfo.gender forState:UIControlStateNormal];
    [self.languageOfCorespondaceButton setTitle:self.userInfo.languagOfCorespondace forState:UIControlStateNormal];

    
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
//    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.firstVIew.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"General Information";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstVIew addSubview:firstHeaderTitel];
    
}

#pragma mark
#pragma mark editSecondViewAction

- (void)editSecondViewAction:(id)sender
{
    
    self.currentHomeAddress.text = self.userInfo.street;
    self.postalCode.text = self.userInfo.postalCode;
    self.cityTextfield.text = self.userInfo.city;
    [self.provinceButton setTitle:self.userInfo.province forState:UIControlStateNormal];
    [self.residentialStatusButton setTitle:self.userInfo.resincialStatus forState:UIControlStateNormal];
    self.totalMontlyCostsTextfield.text = self.userInfo.monthlyHouseCosts;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = NSDateFormatterMediumStyle;
	NSLog(@"%@",self.userInfo.addressYearsAndMonths);
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    
    dateString = [formatter stringFromDate:self.userInfo.addressYearsAndMonths];
    
    if (self.userInfo.addressYearsAndMonths == nil) {
    
        [self.yearsAndMontsButton setTitle:@"Years & Months" forState:UIControlStateNormal];
        self.yearsAndMontsButton.enabled = YES;
        
        
    }else{
     
        [self.yearsAndMontsButton setTitle:dateString forState:UIControlStateNormal];
        
    }
    
    
    
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
//    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.secondView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Current Home Address";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondView addSubview:firstHeaderTitel];
    
    
}

#pragma mark
#pragma mark editThirdViewAction

- (void)editThirdViewAction:(id)sender
{
    
    [self.currentOccupation setTitle:self.userInfo.currentOcupation forState:UIControlStateNormal];
    [self.currentEmploymentStatus setTitle:self.userInfo.employmentStatus forState:UIControlStateNormal];
    
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
    
//    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Your Financial Details";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstHeaderView addSubview:firstHeaderTitel];
    
}

#pragma mark
#pragma mark editForthViewAction

- (void)editForthViewAction:(id)sender
{
    
    self.employerNametextField.text = self.userInfo.employerName;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = NSDateFormatterMediumStyle;
	NSLog(@"%@",self.userInfo.addressYearsAndMonths);
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    
    dateString = [formatter stringFromDate:self.userInfo.startDateForWork];
    
    [self.employmentStatDate setTitle:dateString forState:UIControlStateNormal];
    self.employerStreetAddress.text = self.userInfo.employerStreetAddress;
    [self.employerProvince setTitle:self.userInfo.employerProvince forState:UIControlStateNormal];
    self.employerCity.text = self.userInfo.employerCity;
    
    
    
    
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
    
//    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Employer's Details";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondHeaderView addSubview:firstHeaderTitel];
    
}

#pragma mark
#pragma mark editFifthViewAction

- (void)editFifthViewAction:(id)sender
{
    
    [self.creditLimitButton setTitle:self.userInfo.requestedCreditLimit forState:UIControlStateNormal];
    self.grossAnualIncome.text = self.userInfo.grossAnualIncome;
    self.householdIncome.text = self.userInfo.householdIncome;
    
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
    
//    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
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
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate addInfoToUser:self.titleButton.titleLabel.text andFieldToAddItTo:@"title"];
    [appDelegate addInfoToUser:self.firstNameTextfield.text andFieldToAddItTo:@"firstName"];
    [appDelegate addInfoToUser:self.lastnameTextField.text andFieldToAddItTo:@"lastName"];
//    [appDelegate addInfoToUser:self.areaCode.text andFieldToAddItTo:@"areaCode"];
    [appDelegate addInfoToUser:self.primaryPhonenumberTextField.text andFieldToAddItTo:@"primaryPhone"];
//    [appDelegate addInfoToUser:self.emailAddress.text andFieldToAddItTo:@"email"];
    [appDelegate addInfoToUser:self.genderButton.titleLabel.text andFieldToAddItTo:@"gender"];
    [appDelegate addInfoToUser:self.languageOfCorespondaceButton.titleLabel.text andFieldToAddItTo:@"languagOfCorespondace"];
//    [appDelegate addInfoToUser:self.sinNumber.text andFieldToAddItTo:@"sin"];
    
    
    
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.firstViewOpen = NO;
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.firstVIew.backgroundColor = background;
    
    [self changeFirstHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
}

- (IBAction)closeCurrentAddress:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate addInfoToUser:self.currentHomeAddress.text andFieldToAddItTo:@"street"];
    [appDelegate addInfoToUser:self.postalCode.text andFieldToAddItTo:@"postalCode"];
//    [appDelegate addInfoToUser:self.totalMonthlyHousingCosts.text andFieldToAddItTo:@"monthlyHouseCosts"];
    [appDelegate addInfoToUser:self.cityTextfield.text andFieldToAddItTo:@"city"];
    [appDelegate addInfoToUser:self.residentialStatusButton.titleLabel.text andFieldToAddItTo:@"resincialStatus"];
    [appDelegate addInfoToUser:self.provinceButton.titleLabel.text andFieldToAddItTo:@"province"];
    
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.secondViewOpen = NO;
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.secondView.backgroundColor = background;
    
    [self changeSecondHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
    
}

- (IBAction)closeFInancialDetails:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    [appDelegate addInfoToUser:self.currentOccupation.titleLabel.text andFieldToAddItTo:@"currentOcupation"];
    [appDelegate addInfoToUser:self.currentEmploymentStatus.titleLabel.text andFieldToAddItTo:@"employmentStatus"];
    
    
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.thirdViewOpen = NO;
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.firstHeaderView.backgroundColor = background;
    
    [self changeThirdHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
    
}

- (IBAction)closeEmployerDetails:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate addInfoToUser:self.employerNametextField.text andFieldToAddItTo:@"employerName"];
    [appDelegate addInfoToUser:self.employerStreetAddress.text andFieldToAddItTo:@"employerStreetAddress"];
    [appDelegate addInfoToUser:self.provinceButton.titleLabel.text andFieldToAddItTo:@"employerProvince"];
    [appDelegate addInfoToUser:self.employerCity.text andFieldToAddItTo:@"employerCity"];
    
    

    
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.forthViewOpen = NO;
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.secondHeaderView.backgroundColor = background;
    
    [self changeForthHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
    
}

- (IBAction)closeIncomeAndCredit:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate addInfoToUser:self.creditLimitButton.titleLabel.text andFieldToAddItTo:@"employerAreaCode"];
    [appDelegate addInfoToUser:self.grossAnualIncome.text andFieldToAddItTo:@"grossAnualIncome"];

    
    
    self.editFirstView.enabled = YES;
    self.editSecondView.enabled = YES;
    self.editThirdView.enabled = YES;
    self.editForthView.enabled = YES;
    self.editFifthView.enabled = YES;
    self.fifthViewOpen = NO;
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.thirdHeaderView.backgroundColor = background;
    
    [self changeFifthHeaderHeightAndAddInfo];
    
    [self.accordion setSelectedIndex:10];
    [self.accordion setNeedsDisplay];
    
}

- (IBAction)nextStep:(id)sender {
    
    if (self.finalAcceptViewController == nil) {
        self.finalAcceptViewController = [[FinalAcceptViewController alloc] initWithNibName:@"FinalAcceptViewController" bundle:nil];
    }
    
    self.finalAcceptViewController.delegate = self;
    self.finalAcceptViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:self.finalAcceptViewController animated:YES completion:^{}];
    
}


- (void)chooseCard:(FinalAcceptViewController *)controller andButton:(NSString *)string
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    if ([string isEqualToString:@"cancel"]) {
        
        NSLog(@"back to cards");
        
    }else{
        
        NSLog(@"move to next part of the app");
      ;
       // [appDelegate setNewRootView:appDelegate.thankYouViewController];
        //[appDelegate.thankYouViewController refresh];
        
        [appDelegate setNewRootView:appDelegate.thankYouViewController];
        
//        [appDelegate.rootViewController.navigationController pushViewController:appDelegate.thankYouViewController animated:YES];
    }
    
}

#pragma mark
#pragma mark picker delegate
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
        
        
        
    }else if(pickerView == self.residentialStatusPicker){
        
        return [self.residentialStatusArray count];
        
    }else if(pickerView == self.occupationPicker){
        
        return [self.occupationArray count];
        
    }else if (pickerView == self.requesteCreditLimitPicker){
        
        return  100;
        
    }else{
        
        return [self.employmentStatusArray count];
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
        
        
    }else if (pickerView == self.residentialStatusPicker){
        
        val1 = [self.residentialStatusArray objectAtIndex:row];
    }else if(pickerView == self.occupationPicker){
        
        val1 = [self.occupationArray objectAtIndex:row];
        
    }else if(pickerView == self.requesteCreditLimitPicker){
        
        if (row == 0) {
            
            val1 = [NSString stringWithFormat:@"$ %i",100];
            
            if ([self.requesteCreditLimitArray containsObject:val1]) {
                
            }else{
                
                [self.requesteCreditLimitArray addObject:val1];
                
            }
            
        }else{
            
            val1 = [NSString stringWithFormat:@"$ %i",100 * (row + 1)];
            
            if ([self.requesteCreditLimitArray containsObject:val1]) {
                
            }else{
                
                [self.requesteCreditLimitArray addObject:val1];
                
            }
        }
        
    }else{
        
        val1 = [self.employmentStatusArray objectAtIndex:row];
        
    }
    
    return val1;
}


-(IBAction)selectGender:(id)sender{
    
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

- (IBAction)startOver:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate startOver];
    
}

- (void)selectGender
{
    
    NSString* gender = [NSString stringWithFormat:@"%@",[self.genderArray objectAtIndex:[self.genderPicker selectedRowInComponent:0]]];
    [self.selectGenderButton setTitle:gender forState:UIControlStateNormal];
    [self.popoverController1 dismissPopoverAnimated:YES];
    
}

#pragma mark
#pragma mark choose title
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
    
    NSString* titleString = [NSString stringWithFormat:@"%@",[self.titleArray objectAtIndex:[self.titlePicker selectedRowInComponent:0]]];
    [self.titleButton setTitle:[NSString stringWithFormat:@"%@",titleString] forState:UIControlStateNormal];
    [self.popoverController2 dismissPopoverAnimated:YES];
    
}

- (IBAction)selectLanguageOfCorespondance:(id)sender
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
    
    NSString* languageOfCorespondaceString = [NSString stringWithFormat:@"%@",[self.languageOfCorespondaceArray objectAtIndex:[self.languageOfCorespondacePicker selectedRowInComponent:0]]];
    [self.languageOfCorespondaceButton setTitle:languageOfCorespondaceString forState:UIControlStateNormal];
    [self.popoverController3 dismissPopoverAnimated:YES];
    
}

- (IBAction)selectProvince:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
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
    
    [self.provinceButton setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController4 dismissPopoverAnimated:YES];
    
}

- (IBAction)selectResidentialStatus:(id)sender
{
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
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

- (void)chooseResidentialStatus
{
    
    [self.residentialStatusButton setTitle:[NSString stringWithFormat:@"%@",[self.residentialStatusArray objectAtIndex:[self.residentialStatusPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController5 dismissPopoverAnimated:YES];
    
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
    [self.popoverController5 presentPopoverFromRect:CGRectMake(220.0, 405.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

- (void)chooseTime:(id)sender
{
    
    [self.yearsAndMontsButton setTitle:[NSString stringWithFormat:@"%@ year(s) %@ month(s)",[self.monthsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:0]], [self.yearsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:1]]] forState:UIControlStateNormal];
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
        
//        [self.accordion addHeader:self.thirdHeaderView withView:self.formalHomeAddress];
        
//        [self.accordion setSelectedIndex:2];
        
    }
}

- (IBAction)selectEmploymentStatus:(id)sender
{
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320.0, 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseEmploymentStatus)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.employmentStatusPicker = [[UIPickerView alloc]init];//Date picker
    self.employmentStatusPicker.frame = CGRectMake(0,44,320, 216);
    self.employmentStatusPicker.dataSource = self;
    self.employmentStatusPicker.delegate = self;
    self.employmentStatusPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.employmentStatusPicker];
    
    popoverContent.view = popoverView;
    self.popoverController1 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController1.delegate = self;
    [self.popoverController1 setPopoverContentSize:CGSizeMake(320., 260.) animated:NO];
    [self.popoverController1 presentPopoverFromRect:CGRectMake(160.0, 400.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
    
}

- (void)chooseEmploymentStatus
{
    
    [self.currentEmploymentStatus setTitle:[NSString stringWithFormat:@"%@",[self.employmentStatusArray objectAtIndex:[self.employmentStatusPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController1 dismissPopoverAnimated:YES];
    
}

- (IBAction)selectOccupation:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 480., 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(chooseOccupation)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.occupationPicker = [[UIPickerView alloc]init];//Date picker
    self.occupationPicker.frame = CGRectMake(0,44,480, 216);
    self.occupationPicker.dataSource = self;
    self.occupationPicker.delegate = self;
    self.occupationPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.occupationPicker];
    
    popoverContent.view = popoverView;
    self.popoverController3 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController3.delegate = self;
    [self.popoverController3 setPopoverContentSize:CGSizeMake(480, 260) animated:NO];
    [self.popoverController3 presentPopoverFromRect:CGRectMake(450.0, 408.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
    
}

- (void)chooseOccupation
{
    if ([[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]] isEqualToString:@"Other"]) {
        
//        self.otherOccupationTextField.hidden = NO;
        
    }else{
        
//        self.otherOccupationTextField.hidden = YES;
    }
    
    [self.currentOccupation setTitle:[NSString stringWithFormat:@"%@",[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController3 dismissPopoverAnimated:YES];
    
}

- (IBAction)chooseStartDate:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320., 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(selectStartDate)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.startDatePicker = [[UIDatePicker alloc]init];//Date picker
    self.startDatePicker.frame = CGRectMake(0,44,320, 216);
    self.startDatePicker.datePickerMode = UIDatePickerModeDate;
    [self.startDatePicker setTag:10];
//    [self.startDatePicker addTarget:self action:@selector(result:) forControlEvents:UIControlEventValueChanged];
    [popoverView addSubview:self.startDatePicker];
    
    popoverContent.view = popoverView;
    self.popoverController5 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController5.delegate = self;
    [self.popoverController5 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [self.popoverController5 presentPopoverFromRect:CGRectMake(180., 160., 320., 264.) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];//tempButton.frame where you need you can put that frame
    
}

- (void)selectStartDate
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
	df.dateStyle = NSDateFormatterMediumStyle;
	NSLog(@"%@",self.startDatePicker.date);
    NSDateFormatter *formatter;
    NSString        *dateString;
    
    formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    
    dateString = [formatter stringFromDate:self.startDatePicker.date];
    [self.employmentStatDate setTitle:dateString forState:UIControlStateNormal];
    [appDelegate addInfoToUser:self.startDatePicker.date andFieldToAddItTo:@"startDateForWork"];
    
    [self.popoverController5 dismissPopoverAnimated:YES];
}

- (IBAction)requesteCreditLimitAction:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320., 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(selectRequestedCreditLimit)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.requesteCreditLimitPicker = [[UIPickerView alloc]init];//Date picker
    self.requesteCreditLimitPicker.frame = CGRectMake(0,44,320, 216);
    self.requesteCreditLimitPicker.dataSource = self;
    self.requesteCreditLimitPicker.delegate = self;
    self.requesteCreditLimitPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.requesteCreditLimitPicker];
    
    popoverContent.view = popoverView;
    self.popoverController4 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController4.delegate = self;
    [self.popoverController4 setPopoverContentSize:CGSizeMake(320, 260) animated:NO];
    [self.popoverController4 presentPopoverFromRect:CGRectMake(390.0, 400.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

- (void)selectRequestedCreditLimit{

    [self.creditLimitButton setTitle:[NSString stringWithFormat:@"%@",[self.requesteCreditLimitArray objectAtIndex:[self.requesteCreditLimitPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController4 dismissPopoverAnimated:YES];
    
}


@end
