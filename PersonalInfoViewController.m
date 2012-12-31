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

@interface PersonalInfoViewController (){
    bool showThirdHeader;
    bool showForthHeader;
}

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

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    if (interfaceOrientation==UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight) {

        return YES;
        
    }else{
        
        return NO;
    }
    
    
}

#pragma mark
#pragma mark picker view delegate
/* FIGURES OUT THE PICKER WIDTHS */
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
#pragma mark
#pragma mark textfield delegate
/* UNUSED */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
//    if (self.firstViewClosed) {
//        if (self.streetAddress.text.length > 1 && self.postalCode.text.length && self.currentCity.text.length && ![self.provinceButton.titleLabel.text isEqualToString:@"Province"] && ![self.residentialStatusButton.titleLabel.text isEqualToString:@"Choose"] && self.totalMonthlyHousingCosts.text.length > 1 && ![self.timeLivedAtCurrentAddress.titleLabel.text isEqualToString:@"Years & Months"]) {
//            self.nextStepButton.enabled = YES;
//        }
//    }
    
    
    
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
        
    }else if(textField == self.streetAddress || textField == self.previousAddress){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORSTREETADDRESS && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORSTREETADDRESS];
            return NO;
        }
        return YES;
        
    }else if(textField == self.currentCity || textField == self.previousCity){
        
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
        
    }else if(textField == self.areaCode){
        
        int length = [textField.text length] ;
        if (length >= 3 && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:3];
            return NO;
        }
        return YES;
        
    }else if(textField == self.primaryPhonePrefix){
        
        int length = [textField.text length] ;
        if (length >= 3 && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:3];
            return NO;
        }
        return YES;
        
    }else if(textField == self.primaryPhoneNumber){
        
        int length = [textField.text length] ;
        if (length >= 4 && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:4];
            return NO;
        }
        return YES;
        
    }
    
    return YES;
}

#pragma mark
#pragma mark view will disappear
- (void)viewWillDisappear:(BOOL)animated{
    
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    
}


#pragma mark viewDidLoad
- (void)viewDidLoad
{
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(textFieldDidChange:)
     name:UITextFieldTextDidChangeNotification
     object:self.areaCode];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(textFieldDidChange:)
     name:UITextFieldTextDidChangeNotification
     object:self.primaryPhoneNumber];
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(textFieldDidChange:)
     name:UITextFieldTextDidChangeNotification
     object:self.primaryPhonePrefix];
    
    [super viewDidLoad];
    
    [self setDefaultStyles:self.generalInfoView];
    [self setDefaultStyles:self.currentHomeAddressView];
    [self setDefaultStyles:self.formalHomeAddress];
    
    showThirdHeader = false;
   
    // Do any additional setup after loading the view from its nib.
    
    self.monthsLivedArray = [NSArray new];
    self.monthsLivedArray = @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12"];
    
    self.usStatesArray = [NSArray new];
    self.usStatesArray = @[@"Alabama",
    @"Alaska",
    @"Arizona",
    @"Arkansas",
    @"California",
    @"Colorado",
    @"Connecticut",
    @"Delaware",
    @"Florida",
    @"Georgia",
    @"Hawaii",
    @"Idaho",
    @"Illinois",
    @"Indiana",
    @"Iowa",
    @"Kansas",
    @"Kentucky",
    @"Louisiana",
    @"Maine",
    @"Maryland",
    @"Massachusetts",
    @"Michigan",
    @"Minnesota",
    @"Mississippi",
    @"Missouri",
    @"Montana",
    @"Nebraska",
    @"Nevada",
    @"New Hampshire",
    @"New Jersey",
    @"New Mexico",
    @"New York",
    @"North Carolina",
    @"North Dakota",
    @"Ohio",
    @"Oklahoma",
    @"Oregon",
    @"Pennsylvania",
    @"Rhode Island",
    @"South Carolina",
    @"South Dakota",
    @"Tennessee",
    @"Texas",
    @"Utah",
    @"Vermont",
    @"Virginia",
    @"Washington",
    @"West Virginia",
    @"Wisconsin",
    @"Wyoming"];
    
    self.countryArray = [NSArray new];
    self.countryArray = @[@"Afghanistan",@"Albania",@"Algeria",@"Andorra",@"Angola",@"Antigua &amp; Deps",@"Argentina",@"Armenia",@"Australia",@"Austria",@"Azerbaijan",@"Bahamas",@"Bahrain",@"Bangladesh",@"Barbados",@"Belarus",@"Belgium",@"Belize",@"Benin",@"Bhutan",@"Bolivia",@"Bosnia Herzegovina",@"Botswana",@"Brazil",@"Brunei",@"Bulgaria",@"Burkina",@"Burundi",@"Cambodia",@"Cameroon",@"Canada",@"Cape Verde",@"Central African Rep",@"Chad",@"Chile",@"China",@"Colombia",@"Comoros",@"Congo",@"Congo {Democratic Rep}",@"Costa Rica",@"Croatia",@"Cuba",@"Cyprus",@"Czech Republic",@"Denmark",@"Djibouti",@"Dominica",@"Dominican Republic",@"East Timor",@"Ecuador",@"Egypt",@"El Salvador",@"Equatorial Guinea",@"Eritrea",@"Estonia",@"Ethiopia",@"Fiji",@"Finland",@"France",@"Gabon",@"Gambia",@"Georgia",@"Germany",@"Ghana",@"Greece",@"Grenada",@"Guatemala",@"Guinea",@"Guinea-Bissau",@"Guyana",@"Haiti",@"Honduras",@"Hungary",@"Iceland",@"India",@"Indonesia",@"Iran",@"Iraq",@"Ireland {Republic}",@"Israel",@"Italy",@"Ivory Coast",@"Jamaica",@"Japan",@"Jordan",@"Kazakhstan",@"Kenya",@"Kiribati",@"Korea North",@"Korea South",@"Kosovo",@"Kuwait",@"Kyrgyzstan",@"Laos",@"Latvia",@"Lebanon",@"Lesotho",@"Liberia",@"Libya",@"Liechtenstein",@"Lithuania",@"Luxembourg",@"Macedonia",@"Madagascar",@"Malawi",@"Malaysia",@"Maldives",@"Mali",@"Malta",@"Marshall Islands",@"Mauritania",@"Mauritius",@"Mexico",@"Micronesia",@"Moldova",@"Monaco",@"Mongolia",@"Montenegro",@"Morocco",@"Mozambique",@"Myanmar, {Burma}",@"Namibia",@"Nauru",@"Nepal",@"Netherlands",@"New Zealand",@"Nicaragua",@"Niger",@"Nigeria",@"Norway",@"Oman",@"Pakistan",@"Palau",@"Panama",@"Papua New Guinea",@"Paraguay",@"Peru",@"Philippines",@"Poland",@"Portugal",@"Qatar",@"Romania",@"Russian Federation",@"Rwanda",@"St Kitts &amp; Nevis",@"St Lucia",@"Saint Vincent &amp; the Grenadines",@"Samoa",@"San Marino",@"Sao Tome &amp; Principe",@"Saudi Arabia",@"Senegal",@"Serbia",@"Seychelles",@"Sierra Leone",@"Singapore",@"Slovakia",@"Slovenia",@"Solomon Islands",@"Somalia",@"South Africa",@"South Sudan",@"Spain",@"Sri Lanka",@"Sudan",@"Suriname",@"Swaziland",@"Sweden",@"Switzerland",@"Syria",@"Taiwan",@"Tajikistan",@"Tanzania",@"Thailand",@"Togo",@"Tonga",@"Trinidad &amp; Tobago",@"Tunisia",@"Turkey",@"Turkmenistan",@"Tuvalu",@"Uganda",@"Ukraine",@"United Arab Emirates",@"United Kingdom",@"United States",@"Uruguay",@"Uzbekistan",@"Vanuatu",@"Vatican City",@"Venezuela",@"Vietnam",@"Yemen",@"Zambia",@"Zimbabwe"];
   
    
    
    
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
    self.residentialStatusArray = @[@"Own",@"Rent", @"Live w/Parents/Relatives", @"Board"];
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
    
    //MTK - make sure it fits int he shoadows
    
    self.accordionViewScrollView.contentSize = CGSizeMake(1, 660.);

    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(0, 0, 989, 660)];
    [self.accordionViewScrollView addSubview:self.accordion];
    self.accordionViewScrollView.backgroundColor = [UIColor clearColor];
    // Only height is taken into account, so other parameters are just dummy
    self.firstHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"General Information";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    
    [self.firstHeaderView addSubview:firstHeaderTitel];
    [self.accordion addHeader:self.firstHeaderView withView:self.generalInfoView];
    
    self.secondHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
   // self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    self.secondHeaderView.backgroundColor = [UIColor whiteColor];
    
    UILabel* secondHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
    secondHeaderTitel.backgroundColor = [UIColor clearColor];
    secondHeaderTitel.textColor = [UIColor blackColor];
    secondHeaderTitel.text = @"Current Home Address";
    [self setAppFontStyle:@"accordion-header" forView:secondHeaderTitel];
    [self drawTopLineForSubView:self.secondHeaderView];
    [self.secondHeaderView addSubview:secondHeaderTitel];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 400)];
    view2.backgroundColor = [UIColor whiteColor];
    
    //need to figure out how to alternate the color of white and green
    [self.accordion addHeader:self.secondHeaderView withView:self.currentHomeAddressView];
    
    // Only height is taken into account, so other parameters are just dummy
    self.thirdHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];

    UILabel* firstHeaderTitel2 = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
    firstHeaderTitel2.backgroundColor = [UIColor clearColor];
    firstHeaderTitel2.textColor = [UIColor whiteColor];
    firstHeaderTitel2.text = @"Previous Home Address";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel2];
    [self drawTopLineForSubView:self.thirdHeaderView];
    [self.thirdHeaderView addSubview:firstHeaderTitel2];
    
    self.thirdHeaderView.hidden = YES;
    self.formalHomeAddress.hidden = YES;
    
    [self.accordion addHeader:self.thirdHeaderView withView:self.formalHomeAddress];
    
    // Only height is taken into account, so other parameters are just dummy
    self.forthheaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.forthheaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel3 = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
    firstHeaderTitel3.backgroundColor = [UIColor clearColor];
    firstHeaderTitel3.textColor = [UIColor whiteColor];
    firstHeaderTitel3.text = @"Previous Home Address";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel3];
    [self drawTopLineForSubView:self.forthheaderView];
    [self.forthheaderView addSubview:firstHeaderTitel3];
    
    self.forthheaderView.hidden = YES;
    self.formalFormalHomeAddress.hidden = YES;
    
    [self.accordion addHeader:self.forthheaderView withView:self.formalFormalHomeAddress];
    
    [self.accordion setNeedsLayout];
    
    // Set this if you want to allow multiple selection
    [self.accordion setAllowsMultipleSelection:YES];
//    [self.accordion setSelectedIndex:3];
   
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
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate addInfoToUser:self.titleString andFieldToAddItTo:@"title"];
    [appDelegate addInfoToUser:self.firstName.text andFieldToAddItTo:@"firstName"];
    [appDelegate addInfoToUser:self.lastName.text andFieldToAddItTo:@"lastName"];
    [appDelegate addInfoToUser:self.areaCode.text andFieldToAddItTo:@"areaCode"];
    [appDelegate addInfoToUser:self.primaryPhoneNumber.text andFieldToAddItTo:@"primaryPhone"];
    [appDelegate addInfoToUser:self.primaryPhonePrefix.text andFieldToAddItTo:@"primaryPhonePrefix"];
    
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
    
    if(showThirdHeader){
        
        [appDelegate addInfoToUser:self.previousProvinceButton.titleLabel.text andFieldToAddItTo:@"previousProvince"];
        [appDelegate addInfoToUser:self.previousAddress.text andFieldToAddItTo:@"previousAddress"];
        [appDelegate addInfoToUser:self.previousCity.text andFieldToAddItTo:@"previousCity"];
        [appDelegate addInfoToUser:self.previousPostalCode.text andFieldToAddItTo:@"previousPostalCode"];
        
        
        [appDelegate addInfoToUser:self.timeLivedAtPreviousAddressButton.titleLabel.text andFieldToAddItTo:@"previousPreviousAddressYearsAndMonths"];
    
    }
    
    if (showForthHeader) {
        
        [appDelegate addInfoToUser:self.previousProvinceButton.titleLabel.text andFieldToAddItTo:@"previousPreviousProvince"];
        [appDelegate addInfoToUser:self.previousAddress.text andFieldToAddItTo:@"previousPreviousAddress"];
        [appDelegate addInfoToUser:self.previousCity.text andFieldToAddItTo:@"previousPreviousCity"];
        [appDelegate addInfoToUser:self.previousPostalCode.text andFieldToAddItTo:@"previousPreviousPostaCode"];
        
        
        [appDelegate addInfoToUser:self.timeLivedAtPreviousAddressButton.titleLabel.text andFieldToAddItTo:@"previousAddressYearsAndMonths"];
        
    }
    
    [appDelegate setNewRootView:appDelegate.financialInfoViewController];
    [appDelegate.financialInfoViewController refresh];
    
    
}

#pragma mark 
#pragma mark refresh

- (void)refresh
{
    
    [self.accordion setNeedsLayout];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* -------------------------------------*/

#pragma mark
#pragma mark choose title Mr., Mrs., Miss., Ms., Dr.
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
    
    CGRect frame = self.selectTitelButton.frame;
    frame.origin.y = frame.origin.y + 45;
    
    [self.popoverController2 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

// CHOOSE MR/MRS post popover
- (void)chooseTitle
{
    
    self.titleString = [NSString stringWithFormat:@"%@",[self.titleArray objectAtIndex:[self.titlePicker selectedRowInComponent:0]]];
    [self.selectTitelButton setTitle:[NSString stringWithFormat:@"%@",self.titleString] forState:UIControlStateNormal];
    [self.popoverController2 dismissPopoverAnimated:YES];
    
}



#pragma mark
#pragma mark choose gender popover

- (IBAction)selectGender:(id)sender
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
                                                                                action: @selector(closeGenderPopoverGender)];
    
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
    
    CGRect frame = self.selectGenderButton.frame;
    frame.origin.y = frame.origin.y + 45;
    
    [self.popoverController1 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

// POPOVER RESULTS GO TO HERE
- (void)closeGenderPopoverGender
{
    
    self.gender = [NSString stringWithFormat:@"%@",[self.genderArray objectAtIndex:[self.genderPicker selectedRowInComponent:0]]];
    [self.selectGenderButton setTitle:[NSString stringWithFormat:@"%@",self.gender] forState:UIControlStateNormal];
    [self.popoverController1 dismissPopoverAnimated:YES];
    
}


#pragma mark
#pragma mark close first header (general info)

/* BUTTON CLICKED FOR FIRST SUBVIEW IN ACCORDION 
 VALIDATES AND CALLS FOR COLLAPSE
 */

- (IBAction)closeGeneralInfoView:(id)sender
{
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    for (UIButton *tmpButton in [self.secondHeaderView subviews]) {
        [tmpButton removeFromSuperview];
    }
    
    if (self.secondHeaderView.frame.size.height > 50) {
        
        self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height - 90);
        
    }
    
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Current Home Address";
     [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
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
    
    if(self.primaryPhoneNumber.text.length !=4){
        isValid=false;
        //mark field as invalid
        self.primaryPhoneNumber.backgroundColor = [UIColor yellowColor];
    }else{
        self.primaryPhoneNumber.backgroundColor = [UIColor whiteColor];
    }
    
    if(self.primaryPhonePrefix.text.length != 3 ){
        isValid=false;
        //mark field as invalid
        self.primaryPhonePrefix.backgroundColor = [UIColor yellowColor];
    }else{
        self.primaryPhonePrefix.backgroundColor = [UIColor whiteColor];
    }
    
    if(self.areaCode.text.length !=3){
        isValid=false;
        //mark field as invalid
        self.areaCode.backgroundColor = [UIColor yellowColor];
    }else{
        self.areaCode.backgroundColor = [UIColor whiteColor];
    }

    
    
    if( [self.gender isEqualToString:@""] ){
        //mark field as invalid
        self.selectGenderButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.selectGenderButton.backgroundColor = [UIColor whiteColor];
        
    }
    
    //sin is optional but must check it
    
        if(self.sinNumber.text.length > 9 ){
            //mark field as invalid
            isValid=false;
           self.sinNumber.backgroundColor = [UIColor yellowColor];
        }else{
            self.sinNumber.backgroundColor = [UIColor whiteColor];
    
        }
    
    //mail is optional but if they enter data we shoudl make sure its not bogus
        NSString *email_regex_str=@".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
        NSPredicate *email_no=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",email_regex_str];
    
        if(self.emailAddress.text.length > 0 && [email_no evaluateWithObject:self.emailAddress.text]==NO){
            isValid=false;
            self.emailAddress.backgroundColor = [UIColor yellowColor];
        }else{
            self.emailAddress.backgroundColor = [UIColor whiteColor];
    
        }
    
    
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    [self.accordion setSelectedIndex:1];
    UIImage *image2 = [UIImage imageNamed:@"banner-3a.png"];

    [self.personalHeader setImage:image2];
    [self changeFirstHeaderHeightAndAddInfo];
    self.firstViewClosed = YES;
    
}

/* SWAP OUT FIRST HEADER FOR NEW READ ONLY HEADER*/
- (void)changeFirstHeaderHeightAndAddInfo
{
    self.firstHeaderView.frame = CGRectMake(self.firstHeaderView.frame.origin.x, self.firstHeaderView.frame.origin.y, self.firstHeaderView.frame.size.width, self.firstHeaderView.frame.size.height + 50);
    self.firstHeaderView.backgroundColor = [UIColor whiteColor];
   // self.firstHeaderView.layer.borderColor = ( CGColorRef)CFBridgingRetain([UIColor colorWithRed:.89 green:.89 blue:.89 alpha:.8]);
    
    for (UILabel *tmpLabel in [self.firstHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    [self drawTopLineForSubView:self.firstHeaderView];
    
    self.editFirstView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editFirstView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editFirstView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editFirstView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editFirstView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editFirstView addTarget:self action:@selector(editFirstViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.firstHeaderView addSubview:self.editFirstView];
    
    UILabel* userName = [[UILabel alloc] initWithFrame:CGRectMake(290., 13., 200., 30.)];
    userName.textColor = [UIColor blackColor];
    
    userName.backgroundColor = [UIColor clearColor];
    [self setAppFontStyle:@"display-data" forView:userName];
    userName.text = [NSString stringWithFormat:@"%@ %@",self.firstName.text, self.lastName.text];
    [self.firstHeaderView addSubview:userName];
   
    
    UILabel* phoneNumber = [[UILabel alloc] initWithFrame:CGRectMake(290., 40., 200., 30.)];
    phoneNumber.textColor = [UIColor blackColor];
   
    [self setAppFontStyle:@"display-data" forView:phoneNumber];

    phoneNumber.backgroundColor = [UIColor clearColor];
    phoneNumber.text = [NSString stringWithFormat:@"%@-%@-%@",self.areaCode.text,self.primaryPhonePrefix.text,self.primaryPhoneNumber.text];
    [self.firstHeaderView addSubview:phoneNumber];
    
    UILabel* email = [[UILabel alloc] initWithFrame:CGRectMake(290., 67., 200., 30.)];
    email.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-data" forView:email];
    email.backgroundColor = [UIColor clearColor];
    email.text = [NSString stringWithFormat:@"%@",self.emailAddress.text];
    [self.firstHeaderView addSubview:email];
    
    UILabel* genderLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 13., 100., 30.)];
    genderLabel.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-data" forView:genderLabel];
    genderLabel.backgroundColor = [UIColor clearColor];
    genderLabel.text = [NSString stringWithFormat:@"%@",self.gender];
    [self.firstHeaderView addSubview:genderLabel];
    
    UILabel* preferedLanguage = [[UILabel alloc] initWithFrame:CGRectMake(590., 40., 100., 30.)];
    preferedLanguage.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-data" forView:preferedLanguage];
    preferedLanguage.backgroundColor = [UIColor clearColor];
    preferedLanguage.text = [NSString stringWithFormat:@"%@",self.selectLanguageOfCorespondace.titleLabel.text];
    [self.firstHeaderView addSubview:preferedLanguage];
   // [self setAppFontStyle:@"Cn" forView:self.firstHeaderView];
}

/* CLICK ON THE EDIT BUTTON IN THE FIRST HEADER AFTER IT IS SAVED */
- (void)editFirstViewAction:(id)sender
{
    self.firstHeaderView.frame = CGRectMake(self.firstHeaderView.frame.origin.x, self.firstHeaderView.frame.origin.y, self.firstHeaderView.frame.size.width, self.firstHeaderView.frame.size.height - 50);
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    for (UILabel *tmpLabel in [self.firstHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"General Info";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    
    [self.firstHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:0];
    self.firstViewClosed = NO;
    self.nextStepButton.enabled = NO;
}


#pragma mark
#pragma mark close second header (address view)

/*  */
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
    
    //see if they are putting in a PO BOX
    NSRange searchRange;
    searchRange.location = 0;
   	searchRange.length = [self.streetAddress.text length];
    NSArray *searchFor = [NSArray arrayWithObjects: @"PO BOX",@"PoBox",@"P.O",@"P. O", nil];
    bool foundError = false;
    NSRange foundRange;
    for(NSString *found in searchFor){
        foundRange = [self.streetAddress.text  rangeOfString:found options:0  range:searchRange];
        if(foundRange.location >0){
            NSLog(@"%d",foundRange.location);
            //    foundError = true;
        }
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
    
    
    NSString *zip_regex_str=@"^[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1} *\\d{1}[A-Z]{1}\\d{1}$";
    NSPredicate *zip_no=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",zip_regex_str];
    
    if(self.postalCode.text.length < 1 || [zip_no evaluateWithObject:self.postalCode.text])
    {
        self.postalCode.backgroundColor = [UIColor yellowColor];
    }else{
        self.postalCode.backgroundColor = [UIColor whiteColor];
    }
    
    
    
    if([self.residentialStatusButton.titleLabel.text isEqualToString:@"Choose"])
    {
//        isValid=false;
        
    }
    /*
     Minimum – 1, Maximum – 12 characters
     Rules (1) If Residential Status = Own, Rent, Board Total Monthly Housing Cost is Required and must be >$0.00
     (2) If Residential Status = Live with Parents/Relatives Total Monthly Housing Cost is NOT Required
     */
    
//    int totalCosts = [self.totalMonthlyHousingCosts.text intValue];
    
    if([self.residentialStatusButton.titleLabel.text isEqualToString:@"Own"]
       || [self.residentialStatusButton.titleLabel.text isEqualToString:@"Rent"]
       || [self.residentialStatusButton.titleLabel.text isEqualToString:@"Board"]){
        
        if (self.totalMonthlyHousingCosts.text == @"" || [self.totalMonthlyHousingCosts.text intValue] == 0 ||[self.totalMonthlyHousingCosts.text intValue]>9999999  ) {
            
            isValid=false;
            [self.totalMonthlyHousingCosts setBackgroundColor:[UIColor yellowColor]];
            
        }else{
            
            [self.totalMonthlyHousingCosts setBackgroundColor:[UIColor whiteColor]];
        }
        
    }else if([self.residentialStatusButton.titleLabel.text isEqualToString:@"Live w/Parents/Relatives"]){
 
        [self.totalMonthlyHousingCosts setBackgroundColor:[UIColor whiteColor]];
        
    }
    
    
    
    if(isValid==false){
        self.nextStepButton.enabled = NO;
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    //geocode address
    
    NSString* years = [self.yearsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:0]];
    
    if ([years integerValue] <= 2) {
        
        showThirdHeader = true;
        
        // this doesnt work so hide it for now it shouldnt happen here anyway because we havent geocoded yet.
        
    }else{
        
        showThirdHeader = false;
        
    }
    
   //I assume this fixes double clicking durug geocode?
   
    UIActivityIndicatorView *uiAIV = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = CGRectMake(0., 0., 1024., 768.);
    [uiAIV setFrame:frame];
    uiAIV.hidesWhenStopped = YES;
    uiAIV.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    self.activityIndicator = uiAIV;
    [self.view addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSString *query = [NSString stringWithFormat:@"%@ %@ %@", self.streetAddress.text, self.currentCity.text, self.provinceButton.titleLabel.text];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
        [self.activityIndicator stopAnimating];
        if ([placemarks count] > 0) {
            
            // ALL DONE!
            
            //do we show third header?
        
            if(showThirdHeader){
                self.nextStepButton.enabled = NO;
                [self displayThirdHeader];
                appDelegate.userHasPreviousAddres = YES;
                
                
            }else{
                self.nextStepButton.enabled = YES;
                [self hideThirdHeader];
            }
            
            
            if (showThirdHeader) {
                
//                UIImage *image2 = [UIImage imageNamed:@"banner-3b.png"];
//                [self.personalHeader setImage:image2];
//                
//                self.streetAddress.backgroundColor = [UIColor whiteColor];
//            
//                
//                /* this is moved down for testing */
//                
//                NSLog(@"display the other view");
//                
//                
//                for (UILabel *tmpLabel in [self.thirdHeaderView subviews]) {
//                    [tmpLabel removeFromSuperview];
//                }
//                
//                for (UIButton *tmpButton in [self.thirdHeaderView subviews]) {
//                    [tmpButton removeFromSuperview];
//                }
//                
//                UILabel* firstHeaderTitel2 = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
//                firstHeaderTitel2.backgroundColor = [UIColor clearColor];
//                firstHeaderTitel2.textColor = [UIColor whiteColor];
//                firstHeaderTitel2.text = @"Previous Home Address";
//                [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel2];
//                [self.thirdHeaderView addSubview:firstHeaderTitel2];
//                
//                if (self.thirdHeaderView.frame.size.height > 50) {
//                    
//                    self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height - 50);
//                    
//                }
//                
//                self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
                
        /* END MTK MOVING STUFF */
                
                [self.accordion setSelectedIndex:2];
                [self changeSecondHeaderHeightAndAddInfo];
                self.nextStepButton.enabled = NO;
                
            }else{
                [self changeSecondHeaderHeightAndAddInfo];
                [self.accordion setSelectedIndex:4];
                self.nextStepButton.enabled = YES;
                return;
            }
            
            
            
        } else {
            self.nextStepButton.enabled = NO;
            self.streetAddress.backgroundColor = [UIColor yellowColor];
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"We could not find your addresss.  Please make sure it was entered correctly." delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
            [alert show];
            
        }}];

}

- (void)changeSecondHeaderHeightAndAddInfo
{
    
    [self.activityIndicator stopAnimating];
    
    NSLog(@"second view frame: %@",NSStringFromCGRect(self.secondHeaderView.frame));
    
    self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height + 90);
    self.secondHeaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        
        if ([tmpLabel isKindOfClass:[UILabel class]]) {
            
            tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
            
        }
        
        
    }
    [self drawTopLineForSubView:self.secondHeaderView];
    self.editSecondView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editSecondView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editSecondView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editSecondView addTarget:self action:@selector(editSecondViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondHeaderView addSubview:self.editSecondView];
    
    UILabel* address = [[UILabel alloc] initWithFrame:CGRectMake(290., 20., 200., 20.)];
    address.textColor = [UIColor blackColor];
    address.backgroundColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:address];
    address.numberOfLines = 0;
    address.backgroundColor = [UIColor clearColor];
    address.text = [NSString stringWithFormat:@"%@",self.streetAddress.text];
    [self.secondHeaderView addSubview:address];
    
    UILabel* address2 = [[UILabel alloc] initWithFrame:CGRectMake(290., 40., 200., 20.)];
    address2.textColor = [UIColor blackColor];
    address2.backgroundColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:address2];
    address2.numberOfLines = 0;
    address2.backgroundColor = [UIColor clearColor];
    address2.text = [NSString stringWithFormat:@"%@ %@",self.currentCity.text, self.provinceButton.titleLabel.text];
    [self.secondHeaderView addSubview:address2];
    
    
    UILabel* address3 = [[UILabel alloc] initWithFrame:CGRectMake(290., 60., 200., 20.)];
    address3.textColor = [UIColor blackColor];
    address3.backgroundColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:address3];
    address3.numberOfLines = 0;
    address3.backgroundColor = [UIColor clearColor];
    address3.text = [NSString stringWithFormat:@"%@",self.postalCode.text];
    [self.secondHeaderView addSubview:address3];
    
    UILabel* howlong = [[UILabel alloc] initWithFrame:CGRectMake(290, 90, 300., 20.)];
    howlong.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label-bold" forView:howlong];
    howlong.backgroundColor = [UIColor clearColor];
    howlong.numberOfLines = 0;
    howlong.text = [NSString stringWithFormat:@"How Long have you been living here?"];
    [self.secondHeaderView addSubview:howlong];
    
    UILabel* howlongdata = [[UILabel alloc] initWithFrame:CGRectMake(290., 110, 200., 20.)];
    howlongdata.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:howlongdata];
    howlongdata.backgroundColor = [UIColor clearColor];
    howlongdata.numberOfLines = 0;
    howlongdata.text = [NSString stringWithFormat:@"%@",self.timeLivedAtCurrentAddress.titleLabel.text];
    [self.secondHeaderView addSubview:howlongdata];
    
    /////////////////////////////////////////////////
    
    
    UILabel* residentialStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 13., 200., 20.)];
    residentialStatusLabel.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label-bold" forView:residentialStatusLabel];
    residentialStatusLabel.backgroundColor = [UIColor clearColor];
    
    residentialStatusLabel.text = [NSString stringWithFormat:@"Residential Status:"];
    [self.secondHeaderView addSubview:residentialStatusLabel];
    
    UILabel* residentialStatusdata = [[UILabel alloc] initWithFrame:CGRectMake(790, 13., 200., 20.)];
    residentialStatusdata.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:residentialStatusdata];
    
    residentialStatusdata.backgroundColor = [UIColor clearColor];
    residentialStatusdata.text = [NSString stringWithFormat:@"%@",self.residentialStatusButton.titleLabel.text];
    [self.secondHeaderView addSubview:residentialStatusdata];
    ////
    UILabel* totalMonthlyCostsLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 40., 280., 20)];
    totalMonthlyCostsLabel.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label-bold" forView:totalMonthlyCostsLabel];
    totalMonthlyCostsLabel.backgroundColor = [UIColor clearColor];
    totalMonthlyCostsLabel.numberOfLines = 0;
    totalMonthlyCostsLabel.text = [NSString stringWithFormat:@"Total monthly housing costs"];
    [self.secondHeaderView addSubview:totalMonthlyCostsLabel];
    
    UILabel* totalMonthlyCostsData = [[UILabel alloc] initWithFrame:CGRectMake(590., 55., 200., 20)];
    totalMonthlyCostsData.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:totalMonthlyCostsData];
    totalMonthlyCostsData.backgroundColor = [UIColor clearColor];
    totalMonthlyCostsData.numberOfLines = 0;
    totalMonthlyCostsData.text = [NSString stringWithFormat:@"$ %@",self.totalMonthlyHousingCosts.text];
    [self.secondHeaderView addSubview:totalMonthlyCostsData];
}

/*EDIT BUTTON IS CLICLED ON FOR ADDRESS */
- (void)editSecondViewAction:(id)sender
{
    self.secondHeaderView.frame = CGRectMake(self.secondHeaderView.frame.origin.x, self.secondHeaderView.frame.origin.y, self.secondHeaderView.frame.size.width, self.secondHeaderView.frame.size.height - 90);
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    for (UILabel *tmpLabel in [self.secondHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Current Home Address";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    [self.secondHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:1];
    self.nextStepButton.enabled = NO;
}

#pragma mark
#pragma mark close previous address
/* CURRENTLY UNUSED, NEEDS TO WRAP UP PREVIOUS ADDRSSS VIEW WHEN BUTTON IS CLICKED ON*/
- (IBAction)closePreviousAddress:(id)sender
{
    
    bool isValid=true;
    
    if(self.previousAddress.text.length < 1)
    {
        isValid=false;
        //mark field as invalid
        self.previousAddress.backgroundColor = [UIColor yellowColor];
    }else{
        self.previousAddress.backgroundColor = [UIColor whiteColor];
        
    }
    
    //see if they are putting in a PO BOX
    NSRange searchRange;
    searchRange.location = 0;
   	searchRange.length = [self.streetAddress.text length];
    NSArray *searchFor = [NSArray arrayWithObjects: @"PO BOX",@"PoBox",@"P.O",@"P. O", nil];
    bool foundError = false;
    NSRange foundRange;
    for(NSString *found in searchFor){
        foundRange = [self.previousAddress.text  rangeOfString:found options:0  range:searchRange];
        if(foundRange.location >0){
            NSLog(@"%d",foundRange.location);
            //    foundError = true;
        }
    }
    
    if(self.previousCity.text.length < 1)
    {
        isValid=false;
        //mark field as invalid
        self.previousCity.backgroundColor = [UIColor yellowColor];
    }else{
        self.previousCity.backgroundColor = [UIColor whiteColor];
        
    }
    if([self.previousProvinceButton.titleLabel.text isEqualToString:@"Province"]){
        isValid = false;
        
        self.previousProvinceButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.previousProvinceButton.backgroundColor = [UIColor whiteColor];
    }
    
    if([self.timeLivedAtPreviousAddressButton.titleLabel.text isEqualToString:@"Years & Months"]){
        isValid = false;
        
        self.timeLivedAtPreviousAddressButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.timeLivedAtPreviousAddressButton.backgroundColor = [UIColor whiteColor];
    }
    
    
    NSString *zip_regex_str=@"^[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1} *\\d{1}[A-Z]{1}\\d{1}$";
    NSPredicate *zip_no=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",zip_regex_str];
    
    if(self.previousPostalCode.text.length < 1 || [zip_no evaluateWithObject:self.postalCode.text])
    {
        self.previousPostalCode.backgroundColor = [UIColor yellowColor];
    }else{
        self.previousPostalCode.backgroundColor = [UIColor whiteColor];
    }
    
    
    
    if([self.previousProvinceButton.titleLabel.text isEqualToString:@"Choose"])
    {
        //        isValid=false;
        
    }
    /*
     Minimum – 1, Maximum – 12 characters
     Rules (1) If Residential Status = Own, Rent, Board Total Monthly Housing Cost is Required and must be >$0.00
     (2) If Residential Status = Live with Parents/Relatives Total Monthly Housing Cost is NOT Required
     */
    
    
    
    //we don't have this validation on the previous address??
    /*
    if([self.previousProvinceButton.titleLabel.text isEqualToString:@"Own"]
       || [self.previousProvinceButton.titleLabel.text isEqualToString:@"Rent"]
       || [self.previousProvinceButton.titleLabel.text isEqualToString:@"Board"]){
        
        if (self.totalMonthlyHousingCosts.text == @"" || [self.totalMonthlyHousingCosts.text intValue] == 0 ||[self.totalMonthlyHousingCosts.text intValue]>9999999  ) {
            
            isValid=false;
            [self.totalMonthlyHousingCosts setBackgroundColor:[UIColor yellowColor]];
            
        }else{
            
            [self.totalMonthlyHousingCosts setBackgroundColor:[UIColor whiteColor]];
        }
        
    }else if([self.residentialStatusButton.titleLabel.text isEqualToString:@"Live w/Parents/Relatives"]){
        
        [self.totalMonthlyHousingCosts setBackgroundColor:[UIColor whiteColor]];
        
    }
    */
    
    
    if(isValid==false){
        self.nextStepButton.enabled = NO;
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    //geocode address
    
    NSString* years = [self.yearsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:0]];
    
    if ([years integerValue] <= 2) {
        
        showForthHeader = true;
        
        // this doesnt work so hide it for now it shouldnt happen here anyway because we havent geocoded yet.
        
    }else{
        
        showForthHeader = false;
        
    }
    
    //I assume this fixes double clicking durug geocode?
    
    UIActivityIndicatorView *uiAIV = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = CGRectMake(0., 0., 1024., 768.);
    [uiAIV setFrame:frame];
    uiAIV.hidesWhenStopped = YES;
    uiAIV.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    self.activityIndicator = uiAIV;
    [self.view addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSString *query = [NSString stringWithFormat:@"%@ %@ %@", self.streetAddress.text, self.currentCity.text, self.provinceButton.titleLabel.text];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
        [self.activityIndicator stopAnimating];
        if ([placemarks count] > 0) {
            
            // ALL DONE!
            
            //do we show third header?
            
            if(showForthHeader){
                self.nextStepButton.enabled = NO;
                [self displayForthHeader];
                appDelegate.userHasPreviousPreviousAddress = YES;
                
            }else{
                self.nextStepButton.enabled = YES;
                
//                [self hideForthHeader ];
                

//                [self hideForthHeader];

            }
            
            
            if (showForthHeader) {
                
                //                UIImage *image2 = [UIImage imageNamed:@"banner-3b.png"];
                //                [self.personalHeader setImage:image2];
                //
                //                self.streetAddress.backgroundColor = [UIColor whiteColor];
                //
                //
                //                /* this is moved down for testing */
                //
                //                NSLog(@"display the other view");
                //
                //
                //                for (UILabel *tmpLabel in [self.forthheaderView subviews]) {
                //                    [tmpLabel removeFromSuperview];
                //                }
                //
                //                for (UIButton *tmpButton in [self.forthheaderView subviews]) {
                //                    [tmpButton removeFromSuperview];
                //                }
                //
                //                UILabel* firstHeaderTitel2 = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
                //                firstHeaderTitel2.backgroundColor = [UIColor clearColor];
                //                firstHeaderTitel2.textColor = [UIColor whiteColor];
                //                firstHeaderTitel2.text = @"Previous Home Address";
                //                [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel2];
                //                [self.forthheaderView addSubview:firstHeaderTitel2];
                //
                //                if (self.forthheaderView.frame.size.height > 50) {
                //
                //                    self.forthheaderView.frame = CGRectMake(self.forthheaderView.frame.origin.x, self.forthheaderView.frame.origin.y, self.forthheaderView.frame.size.width, self.forthheaderView.frame.size.height - 50);
                //
                //                }
                //
                //                self.forthheaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
                
                /* END MTK MOVING STUFF */
                
                [self changeThirdHeaderHeightAndAddInfo];
                //                [self changeSecondHeaderHeightAndAddInfo];
                self.nextStepButton.enabled = NO;
                
            }else{
                //                [self changeSecondHeaderHeightAndAddInfo];
                [self changeThirdHeaderHeightAndAddInfo];
                [self.accordion setSelectedIndex:6];
                self.nextStepButton.enabled = YES;
                return;
            }
            
            
            
        } else {
            self.nextStepButton.enabled = NO;
            self.previousAddress.backgroundColor = [UIColor yellowColor];
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"We could not find your addresss.  Please make sure it was entered correctly." delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
            [alert show];
            
        }}];
    
}

- (void)changeThirdHeaderHeightAndAddInfo
{
    self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height + 90);
    self.thirdHeaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.thirdHeaderView subviews]) {
        
        if ([tmpLabel isKindOfClass:[UILabel class]]) {
            tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
        }
        
        
    }
    
    [self drawTopLineForSubView:self.thirdHeaderView];
    self.editSecondView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editSecondView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editSecondView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editSecondView addTarget:self action:@selector(editThirdViewAction) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdHeaderView addSubview:self.editSecondView];
    
    UILabel* address = [[UILabel alloc] initWithFrame:CGRectMake(290., 20., 200., 20.)];
    address.textColor = [UIColor blackColor];
    address.backgroundColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:address];
    address.numberOfLines = 0;
    address.backgroundColor = [UIColor clearColor];
    address.text = [NSString stringWithFormat:@"%@",self.previousAddress.text];
    [self.thirdHeaderView addSubview:address];
    
    UILabel* address2 = [[UILabel alloc] initWithFrame:CGRectMake(290., 40., 200., 20.)];
    address2.textColor = [UIColor blackColor];
    address2.backgroundColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:address2];
    address2.numberOfLines = 0;
    address2.backgroundColor = [UIColor clearColor];
    address2.text = [NSString stringWithFormat:@"%@ %@",self.previousCity.text, self.previousProvinceButton.titleLabel.text];
    [self.thirdHeaderView addSubview:address2];
    
    
    UILabel* address3 = [[UILabel alloc] initWithFrame:CGRectMake(290., 60., 200., 20.)];
    address3.textColor = [UIColor blackColor];
    address3.backgroundColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:address3];
    address3.numberOfLines = 0;
    address3.backgroundColor = [UIColor clearColor];
    address3.text = [NSString stringWithFormat:@"%@",self.previousPostalCode.text];
    [self.thirdHeaderView addSubview:address3];
    
    UILabel* howlong = [[UILabel alloc] initWithFrame:CGRectMake(290, 90, 300., 20.)];
    howlong.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label-bold" forView:howlong];
    howlong.backgroundColor = [UIColor clearColor];
    howlong.numberOfLines = 0;
    howlong.text = [NSString stringWithFormat:@"How Long have you been living here?"];
    [self.thirdHeaderView addSubview:howlong];
    
    UILabel* howlongdata = [[UILabel alloc] initWithFrame:CGRectMake(290., 110, 200., 20.)];
    howlongdata.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:howlongdata];
    howlongdata.backgroundColor = [UIColor clearColor];
    howlongdata.numberOfLines = 0;
    howlongdata.text = [NSString stringWithFormat:@"%@",self.timeLivedAtPreviousAddressButton.titleLabel.text];
    [self.thirdHeaderView addSubview:howlongdata];
    
    /////////////////////////////////////////////////
    
    
    UILabel* residentialStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 13., 200., 20.)];
    residentialStatusLabel.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label-bold" forView:residentialStatusLabel];
    residentialStatusLabel.backgroundColor = [UIColor clearColor];
    
    residentialStatusLabel.text = [NSString stringWithFormat:@"Residential Status:"];
    [self.thirdHeaderView addSubview:residentialStatusLabel];
    
    UILabel* residentialStatusdata = [[UILabel alloc] initWithFrame:CGRectMake(790, 13., 200., 20.)];
    residentialStatusdata.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:residentialStatusdata];
    
    residentialStatusdata.backgroundColor = [UIColor clearColor];
    residentialStatusdata.text = [NSString stringWithFormat:@"%@",self.previousResidentialStatusButton.titleLabel.text];
    [self.thirdHeaderView addSubview:residentialStatusdata];
    ////
//    UILabel* totalMonthlyCostsLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 40., 280., 20)];
//    totalMonthlyCostsLabel.textColor = [UIColor blackColor];
//    [self setAppFontStyle:@"display-label-bold" forView:totalMonthlyCostsLabel];
//    totalMonthlyCostsLabel.backgroundColor = [UIColor clearColor];
//    totalMonthlyCostsLabel.numberOfLines = 0;
//    totalMonthlyCostsLabel.text = [NSString stringWithFormat:@"Total monthly housing costs"];
//    [self.thirdHeaderView addSubview:totalMonthlyCostsLabel];
//    
//    UILabel* totalMonthlyCostsData = [[UILabel alloc] initWithFrame:CGRectMake(590., 55., 200., 20)];
//    totalMonthlyCostsData.textColor = [UIColor blackColor];
//    [self setAppFontStyle:@"display-label" forView:totalMonthlyCostsData];
//    totalMonthlyCostsData.backgroundColor = [UIColor clearColor];
//    totalMonthlyCostsData.numberOfLines = 0;
//    totalMonthlyCostsData.text = [NSString stringWithFormat:@"$ %@",self.totalMonthlyHousingCosts.text];
//    [self.thirdHeaderView addSubview:totalMonthlyCostsData];
}




/* MAKES THE ACCORDION FIT THE NEW STUFF */




- (void)editThirdViewAction
{
    self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height - 90);
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    for (UILabel *tmpLabel in [self.thirdHeaderView subviews]) {
        
        if ([tmpLabel isKindOfClass:[UILabel class]]) {
            [tmpLabel removeFromSuperview];
        }
        
    }
    
    for (UIButton* button in [self.thirdHeaderView subviews]) {
        
        if ([button isKindOfClass:[UIButton class]] && [button.titleLabel.text isEqualToString:@"Edit"]) {
            button.hidden = YES;
        }
        
    }
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Current Home Address";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    [self.thirdHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:2];
    self.nextStepButton.enabled = NO;
    
}

-(void)hideThirdHeader{
    if(self.thirdHeaderView)
        self.thirdHeaderView.hidden = YES;
        self.formalHomeAddress.hidden = YES;
}

-(void)hideForthHeader{
    if(self.forthheaderView)
        [self.forthheaderView removeFromSuperview];
}

- (void)displayThirdHeader{
    
    self.thirdHeaderView.hidden = NO;
    self.formalHomeAddress.hidden = NO;
    
    NSLog(@"display the other view");
    // Only height is taken into account, so other parameters are just dummy
    //    self.thirdHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Previous Home Address";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    
    [self.thirdHeaderView addSubview:firstHeaderTitel];
    
    //    [self.accordion addHeader:self.formalHomeAddress withView:self.thirdHeaderView];
    
    [self.accordion setSelectedIndex:2];
}

#pragma mark
#pragma mark close forth header

- (IBAction)closePreviousPreviousAddress:(id)sender
{
    
    bool isValid=true;
    
    if(self.previousPreviousStreet.text.length < 1)
    {
        isValid=false;
        //mark field as invalid
        self.previousPreviousStreet.backgroundColor = [UIColor yellowColor];
    }else{
        self.previousPreviousStreet.backgroundColor = [UIColor whiteColor];
        
    }
    
    //see if they are putting in a PO BOX
    NSRange searchRange;
    searchRange.location = 0;
   	searchRange.length = [self.previousPreviousStreet.text length];
    NSArray *searchFor = [NSArray arrayWithObjects: @"PO BOX",@"PoBox",@"P.O",@"P. O", nil];
    bool foundError = false;
    NSRange foundRange;
    for(NSString *found in searchFor){
        foundRange = [self.previousAddress.text  rangeOfString:found options:0  range:searchRange];
        if(foundRange.location >0){
            NSLog(@"%d",foundRange.location);
            //    foundError = true;
        }
    }
    
    if(self.previousPreviousCity.text.length < 1)
    {
        isValid=false;
        //mark field as invalid
        self.previousPreviousCity.backgroundColor = [UIColor yellowColor];
    }else{
        self.previousPreviousCity.backgroundColor = [UIColor whiteColor];
        
    }
    if([self.previousPreviousProvince.titleLabel.text isEqualToString:@"Province"]){
        isValid = false;
        
        self.previousPreviousProvince.backgroundColor = [UIColor yellowColor];
    }else{
        self.previousPreviousProvince.backgroundColor = [UIColor whiteColor];
    }
    
    if([self.previousPreviousYearsAndMonths.titleLabel.text isEqualToString:@"Years & Months"]){
        isValid = false;
        
        self.previousPreviousYearsAndMonths.backgroundColor = [UIColor yellowColor];
    }else{
        self.previousPreviousYearsAndMonths.backgroundColor = [UIColor whiteColor];
    }
    
    
    NSString *zip_regex_str=@"^[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1} *\\d{1}[A-Z]{1}\\d{1}$";
    NSPredicate *zip_no=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",zip_regex_str];
    
    if(self.previousPreviousPostalCode.text.length < 1 || [zip_no evaluateWithObject:self.previousPreviousPostalCode.text])
    {
        self.previousPreviousPostalCode.backgroundColor = [UIColor yellowColor];
    }else{
        self.previousPreviousPostalCode.backgroundColor = [UIColor whiteColor];
    }
    
    
    
    if([self.previousPreviousProvince.titleLabel.text isEqualToString:@"Choose"])
    {
        //        isValid=false;
        
    }
    
    if(isValid==false){
        self.nextStepButton.enabled = NO;
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    //I assume this fixes double clicking durug geocode?
    
    UIActivityIndicatorView *uiAIV = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = CGRectMake(0., 0., 1024., 768.);
    [uiAIV setFrame:frame];
    uiAIV.hidesWhenStopped = YES;
    uiAIV.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    
    self.activityIndicator = uiAIV;
    [self.view addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
    
    NSString *query = [NSString stringWithFormat:@"%@ %@ %@", self.streetAddress.text, self.currentCity.text, self.provinceButton.titleLabel.text];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
        [self.activityIndicator stopAnimating];
        if ([placemarks count] > 0) {
            
            [self changeForthHeaderHeightAndAddInfo];
            [self.accordion setSelectedIndex:6];
            self.nextStepButton.enabled = YES;
            return;
            
            
            
            
        } else {
            self.nextStepButton.enabled = NO;
            self.previousAddress.backgroundColor = [UIColor yellowColor];
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"We could not find your addresss.  Please make sure it was entered correctly." delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
            [alert show];
            
        }}];
    
}

- (void)changeForthHeaderHeightAndAddInfo
{
    
    self.forthheaderView.frame = CGRectMake(self.forthheaderView.frame.origin.x, self.forthheaderView.frame.origin.y, self.forthheaderView.frame.size.width, self.forthheaderView.frame.size.height + 90);
    self.forthheaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.forthheaderView subviews]) {
        
        if ([tmpLabel isKindOfClass:[UILabel class]]) {
            tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
        }
        
        
    }
    
    [self drawTopLineForSubView:self.forthheaderView];
    
    self.editSecondView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editSecondView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editSecondView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editSecondView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editSecondView addTarget:self action:@selector(editForthViewAction) forControlEvents:UIControlEventTouchUpInside];
    [self.forthheaderView addSubview:self.editSecondView];
    
    UILabel* address = [[UILabel alloc] initWithFrame:CGRectMake(290., 20., 200., 20.)];
    address.textColor = [UIColor blackColor];
    address.backgroundColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:address];
    address.numberOfLines = 0;
    address.backgroundColor = [UIColor clearColor];
    address.text = [NSString stringWithFormat:@"%@",self.previousPreviousStreet.text];
    [self.forthheaderView addSubview:address];
    
    UILabel* address2 = [[UILabel alloc] initWithFrame:CGRectMake(290., 40., 200., 20.)];
    address2.textColor = [UIColor blackColor];
    address2.backgroundColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:address2];
    address2.numberOfLines = 0;
    address2.backgroundColor = [UIColor clearColor];
    address2.text = [NSString stringWithFormat:@"%@ %@",self.previousPreviousCity.text, self.previousPreviousProvince.titleLabel.text];
    [self.forthheaderView addSubview:address2];
    
    
    UILabel* address3 = [[UILabel alloc] initWithFrame:CGRectMake(290., 60., 200., 20.)];
    address3.textColor = [UIColor blackColor];
    address3.backgroundColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:address3];
    address3.numberOfLines = 0;
    address3.backgroundColor = [UIColor clearColor];
    address3.text = [NSString stringWithFormat:@"%@",self.previousPreviousPostalCode.text];
    [self.forthheaderView addSubview:address3];
    
    UILabel* howlong = [[UILabel alloc] initWithFrame:CGRectMake(290, 90, 300., 20.)];
    howlong.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label-bold" forView:howlong];
    howlong.backgroundColor = [UIColor clearColor];
    howlong.numberOfLines = 0;
    howlong.text = [NSString stringWithFormat:@"How Long have you been living here?"];
    [self.forthheaderView addSubview:howlong];
    
    UILabel* howlongdata = [[UILabel alloc] initWithFrame:CGRectMake(290., 110, 200., 20.)];
    howlongdata.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:howlongdata];
    howlongdata.backgroundColor = [UIColor clearColor];
    howlongdata.numberOfLines = 0;
    howlongdata.text = [NSString stringWithFormat:@"%@",self.previousPreviousYearsAndMonths.titleLabel.text];
    [self.forthheaderView addSubview:howlongdata];
    
    /////////////////////////////////////////////////
    
    
    UILabel* residentialStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 13., 200., 20.)];
    residentialStatusLabel.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label-bold" forView:residentialStatusLabel];
    residentialStatusLabel.backgroundColor = [UIColor clearColor];
    
    residentialStatusLabel.text = [NSString stringWithFormat:@"Residential Status:"];
    [self.forthheaderView addSubview:residentialStatusLabel];
    
    UILabel* residentialStatusdata = [[UILabel alloc] initWithFrame:CGRectMake(790, 13., 200., 20.)];
    residentialStatusdata.textColor = [UIColor blackColor];
    [self setAppFontStyle:@"display-label" forView:residentialStatusdata];
    
    residentialStatusdata.backgroundColor = [UIColor clearColor];
    residentialStatusdata.text = [NSString stringWithFormat:@"%@",self.previousPreviousResidentialStatus.titleLabel.text];
    [self.forthheaderView addSubview:residentialStatusdata];
    
}

- (void)editForthViewAction
{
    
    
}

#pragma mark
#pragma mark selectLanguageOfCorespondance
/* POPS UP LANGUAGE OF CORRESPONDENCE */
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
    
    CGRect frame = self.selectLanguageOfCorespondace.frame;
    frame.origin.y = frame.origin.y + 45;
    
    [self.popoverController3 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
}

/* GETS THE LANGUAGE FROM THE POPUP */
- (void)chooseLanguage:(UIButton *)sender
{
    
    self.languageOfCorespondaceString = [NSString stringWithFormat:@"%@",[self.languageOfCorespondaceArray objectAtIndex:[self.languageOfCorespondacePicker selectedRowInComponent:0]]];
    [self.selectLanguageOfCorespondace setTitle:self.languageOfCorespondaceString forState:UIControlStateNormal];
    [self.popoverController3 dismissPopoverAnimated:YES];
    
}

#pragma mark
#pragma mark select previous residential status
/* TBD */

- (IBAction)selectPreviousResidentialStatus:(id)sender
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
                                                                                action: @selector(choosePreviosResidentialStatus)];
    
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
    
    CGRect frame;
    
    if (showThirdHeader) {
    
        frame = self.residentialStatusButton.frame;
        frame.origin.y = frame.origin.y + 290;
        
    }
    
    if (showForthHeader) {
        
        frame = self.residentialStatusButton.frame;
        frame.origin.y = frame.origin.y + 420;
        
    }
    
    
    [self.popoverController5 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
}

- (void)choosePreviosResidentialStatus{
    
    if (showThirdHeader) {
        
        [self.previousResidentialStatusButton setTitle:[NSString stringWithFormat:@"%@",[self.residentialStatusArray objectAtIndex:[self.residentialStatusPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
        
    }
    
    if (showForthHeader) {
        
        [self.previousPreviousResidentialStatus setTitle:[NSString stringWithFormat:@"%@",[self.residentialStatusArray objectAtIndex:[self.residentialStatusPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
        
    }
    
    [self.popoverController5 dismissPopoverAnimated:YES];
}


#pragma mark
#pragma mark select previous province
/* POPUP FOR PREVIOUS PROVINCE */
- (IBAction)selectPreviousProvince:(id)sender {
    
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
                                                                                action: @selector(choosePreviousProvince)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    self.statesPicker = [[UIPickerView alloc]init];//Date picker
    self.statesPicker.frame = CGRectMake(0,44,320, 216);  //TODO
    self.statesPicker.dataSource = self;
    self.statesPicker.delegate = self;
    self.statesPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.statesPicker];
    
    CGRect frame;
    
    if (showThirdHeader) {
    
        frame = self.previousProvinceButton.frame;
        frame.origin.y = frame.origin.y + 290;
        
    }
    
    if (showForthHeader) {
        
        frame = self.previousPreviousProvince.frame;
        frame.origin.y = frame.origin.y + 420;
        
    }
    
    
    
    popoverContent.view = popoverView;
    self.popoverController4 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController4.delegate = self;
    [self.popoverController4 setPopoverContentSize:CGSizeMake(320, 260) animated:NO];
    [self.popoverController4 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    

}

/* GETS THE PREVIOUS PROVINCE SELECTION FROM THE POPOVER */
- (void)choosePreviousProvince
{
    
    if (showThirdHeader) {
        
        [self.previousProvinceButton setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
        
    }
    
    if(showForthHeader){
        
        [self.previousPreviousProvince setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
        
    }
    
    if (!showForthHeader && !showThirdHeader) {
    
        [self.previousProvinceButton setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
        
    }

    [self.popoverController4 dismissPopoverAnimated:YES];
    
}

#pragma mark
#pragma mark select province

/* POPUP FOR PROVINCE */
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
    
    
#pragma mark
#pragma mark make the popover appear where we want it
    //also change the presetPopoverFromRect the way its set here
    //inView: the scroll view
    //presentPopoverFromRect: the frame we set it to
    
    CGRect frame = self.provinceButton.frame;
    frame.origin.y = frame.origin.y + 140;
    
    [self.popoverController4 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}
/* GETS THE  PROVINCE SELECTION FROM THE POPOVER */
- (void)chooseProvince
{
    [self.provinceButton setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController4 dismissPopoverAnimated:YES];
    
}


#pragma mark
#pragma mark select residential status

/* SELECT RESIDENTIAL STATUS PICKER */
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
    
    CGRect frame = self.residentialStatusButton.frame;
    frame.origin.y = frame.origin.y + 140;
    
    [self.popoverController5 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
}

- (void)chooseResidentialStatus
{
    
    [self.residentialStatusButton setTitle:[NSString stringWithFormat:@"%@",[self.residentialStatusArray objectAtIndex:[self.residentialStatusPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController5 dismissPopoverAnimated:YES];
    
    
}

#pragma mark
#pragma mark show legal
/* POPUPS */
- (IBAction)showLegal:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    [appDelegate.modalViewController whichModalToPresent:@"legal"];
    
}

#pragma mark
#pragma mark show privacy

- (IBAction)showPrivacy:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    [appDelegate.modalViewController whichModalToPresent:@"privacy"];
    
}

#pragma mark
#pragma mark show security
- (IBAction)showSecurity:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    [appDelegate.modalViewController whichModalToPresent:@"security"];
    
}


#pragma mark
#pragma mark catch the textfield notification

-(void)textFieldDidChange:(NSNotification*)sender{
    
    
    if ([sender.object isEqual:self.areaCode]) {
        
        int length = [self.areaCode.text length];
        if (length >= 3) {
            
            [self.primaryPhonePrefix becomeFirstResponder];
            
        }
        
    }else if([sender.object isEqual:self.primaryPhonePrefix]){
        

        int length = [self.primaryPhonePrefix.text length];
        if (length >= 3) {
            
            [self.primaryPhoneNumber becomeFirstResponder];
            
        }
        
    }else if([sender.object isEqual:self.primaryPhoneNumber]){
        
        int length = [self.primaryPhoneNumber.text length];
        if (length >= 4) {
            
            [self.primaryPhoneNumber resignFirstResponder];
            
        }
        
    }
    
}


#pragma mark
#pragma mark choose how much time you lived at you current address

- (IBAction)choseHowLongYouLivedAtCurrentAddress:(id)sender
{
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    UIView *popoverView = [[UIView alloc] init];   //view
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
    [self setAppFontStyle:@"display-label-bold" forView:monthsLabel];
    monthsLabel.backgroundColor = [UIColor clearColor];
    monthsLabel.textColor = [UIColor whiteColor];
    [popoverView addSubview:monthsLabel];
    
    monthsLabel = [[UILabel alloc] initWithFrame:CGRectMake(120., 60., 60., 20.)];
    monthsLabel.text = @"Months";
    [self setAppFontStyle:@"display-label-bold" forView:monthsLabel];
    
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
    
    CGRect frame = self.timeLivedAtCurrentAddress.frame;
    frame.origin.y = frame.origin.y + 150;
    
    [self.popoverController5 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
}

- (void)chooseTime:(id)sender
{
    
    [self.timeLivedAtCurrentAddress setTitle:[NSString stringWithFormat:@"%@ year(s) %@ month(s)",[self.monthsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:0]], [self.yearsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:1]]] forState:UIControlStateNormal];
    [self.popoverController5 dismissPopoverAnimated:YES];
   
}

#pragma mark 
#pragma mark start over the application process
- (IBAction)startOver:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate startOver];
    
    
}


- (void)displayForthHeader{
    
    self.forthheaderView.hidden = NO;
    self.formalFormalHomeAddress.hidden = NO;
    
    NSLog(@"display the other view");
    // Only height is taken into account, so other parameters are just dummy
//    self.forthheaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.forthheaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(15., 9., 300., 50.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Previous Home Address";
    [self setAppFontStyle:@"accordion-header" forView:firstHeaderTitel];
    
    [self.forthheaderView addSubview:firstHeaderTitel];
    
    //    [self.accordion addHeader:self.formalHomeAddress withView:self.thirdHeaderView];
    
    [self.accordion setSelectedIndex:3];
    
}



#pragma mark
#pragma mark textfield delegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if (textField == self.areaCode) {
        
        [self.primaryPhonePrefix becomeFirstResponder];
        
    }else if(textField == self.primaryPhonePrefix){
        
        [self.primaryPhoneNumber becomeFirstResponder];
        
    }
    

    return YES;
}



#pragma mark
#pragma mark choose hoe much time you lived at your previous address
- (IBAction)chooseHowLongYouLivedAtPreviousAddress:(id)sender {
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor blackColor];
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 220.0, 44.0)];
    toolbar.barStyle = UIBarStyleBlack;
    
    UIBarButtonItem* space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace
                                                                           target: nil
                                                                           action: nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemDone
                                                                                target: self
                                                                                action: @selector(choosePreviousTime)];
    
    doneButton.tintColor = [UIColor blackColor];
    
    NSMutableArray* toolbarItems = [NSMutableArray array];
    [toolbarItems addObject:space];
    [toolbarItems addObject:doneButton];
    toolbar.items = toolbarItems;
    
    [popoverView addSubview:toolbar];
    
    UILabel* monthsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0., 60., 60., 20.)];
    monthsLabel.text = @"Years";
     [self setAppFontStyle:@"display-label-bold" forView:monthsLabel];
    monthsLabel.backgroundColor = [UIColor clearColor];
    monthsLabel.textColor = [UIColor whiteColor];
    [popoverView addSubview:monthsLabel];
    
    monthsLabel = [[UILabel alloc] initWithFrame:CGRectMake(120., 60., 60., 20.)];
    monthsLabel.text = @"Months";
    [self setAppFontStyle:@"display-label-bold" forView:monthsLabel];
    monthsLabel.backgroundColor = [UIColor clearColor];
    monthsLabel.textColor = [UIColor whiteColor];
    [popoverView addSubview:monthsLabel];
    
    self.timeLivedAtCurrentAddressPicker = [[UIPickerView alloc]init];//Date picker
    self.timeLivedAtCurrentAddressPicker.frame = CGRectMake(0,84,220, 116);//TODO?
    self.timeLivedAtCurrentAddressPicker.dataSource = self;
    self.timeLivedAtCurrentAddressPicker.delegate = self;
    self.timeLivedAtCurrentAddressPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.timeLivedAtCurrentAddressPicker];
    
    popoverContent.view = popoverView;
    self.popoverController5 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController5.delegate = self;
    
    [self.popoverController5 setPopoverContentSize:CGSizeMake(220, 214) animated:NO];
    
    CGRect frame;
    
    if (showThirdHeader) {
    
        frame = self.timeLivedAtPreviousAddressButton.frame;
        frame.origin.y = frame.origin.y + 290;
        
        [self.popoverController5 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
        
    }
    
    if (showForthHeader) {
        
        frame = self.previousPreviousYearsAndMonths.frame;
        frame.origin.y = frame.origin.y + 420;
        
        [self.popoverController5 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
        
    }
    
    if (!showForthHeader && !showThirdHeader) {
        
        frame = self.timeLivedAtPreviousAddressButton.frame;
        frame.origin.y = frame.origin.y + 290;
        frame.origin.x = frame.origin.x - 100;
    
        [self.popoverController5 presentPopoverFromRect:frame inView:self.accordionViewScrollView permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
        
    }
    

    
}

- (void)choosePreviousTime
{
    
    if (showThirdHeader) {
        
        [self.timeLivedAtPreviousAddressButton setTitle:[NSString stringWithFormat:@"%@ year(s) %@ month(s)",[self.monthsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:0]], [self.yearsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:1]]] forState:UIControlStateNormal];
        
    }
    
    if (showForthHeader) {
        
        [self.previousPreviousYearsAndMonths setTitle:[NSString stringWithFormat:@"%@ year(s) %@ month(s)",[self.monthsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:0]], [self.yearsLivedArray objectAtIndex:[self.timeLivedAtCurrentAddressPicker selectedRowInComponent:1]]] forState:UIControlStateNormal];
        
    }
    
    
    [self.popoverController5 dismissPopoverAnimated:YES];
    
}


@end
