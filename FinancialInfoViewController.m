//
//  FinancialInfoViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "FinancialInfoViewController.h"
#import "AccordionView.h"
#import "AppDelegate.h"

@interface FinancialInfoViewController ()

@end

@implementation FinancialInfoViewController

@synthesize textfieldString;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark
#pragma mark select current employment status

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
    [self.popoverController1 presentPopoverFromRect:CGRectMake(160.0, 200.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
    
}

- (void)chooseResidentialStatus
{
    
    [self.employmentStatus setTitle:[NSString stringWithFormat:@"%@",[self.employmentStatusArray objectAtIndex:[self.employmentStatusPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController1 dismissPopoverAnimated:YES];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //    if (pickerView == self.statesPicker) {
    //
    //        return [self.provinceArray count];
    //
    //    }else if (pickerView == self.titlePicker){
    //
    //        return [self.titleArray count];
    //
    //    }else if(pickerView == self.languageOfCorespondacePicker){
    //
    //        return [self.languageOfCorespondaceArray count];
    //
    //    }else if (pickerView == self.genderPicker){
    //
    //        return [self.genderArray count];
    //
    //    }else{
    //
    //        return [self.residentialStatusArray count];
    //    }
    
    if (pickerView == self.statesPicker) {
        
        return [self.provinceArray count];
        
    }else if(pickerView == self.occupationPicker){
        
        return [self.occupationArray count];
        
    }else{
        return [self.employmentStatusArray count];
    }
    
    
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSString* val1;
    
    
    
    if (pickerView == self.statesPicker) {
        
        val1 = [self.provinceArray objectAtIndex:row];
        
    }else if(pickerView == self.occupationPicker){
        
        val1 = [self.occupationArray objectAtIndex:row];
        
    }else{
        
        val1 = [self.employmentStatusArray objectAtIndex:row];
        
    }
    
    
    //    }else if (pickerView == self.titlePicker){
    //
    //        val1 = [self.titleArray objectAtIndex:row];
    //
    //    }else if(pickerView == self.languageOfCorespondacePicker){
    //
    //        val1 = [self.languageOfCorespondaceArray objectAtIndex:row];
    //
    //    }else if (pickerView == self.genderPicker){
    //
    //        val1 = [self.genderArray objectAtIndex:row];
    //
    //    }else{
    //
    //        val1 = [self.residentialStatusArray objectAtIndex:row];
    //    }
    
    return val1;
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
    
    UIToolbar* toolbar = [[UIToolbar alloc] initWithFrame: CGRectMake(0.0, 0.0, 320., 44.0)];
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
    self.popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController2.delegate = self;
    [self.popoverController2 setPopoverContentSize:CGSizeMake(320, 260) animated:NO];
    [self.popoverController2 presentPopoverFromRect:CGRectMake(520.0, 340.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionRight animated:YES];
    
}

- (void)chooseProvince
{
    
    //    NSLog(@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]);
    [self.provinceButton setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController2 dismissPopoverAnimated:YES];
    
}

#pragma mark
#pragma mark viewDidLoad

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
    
    self.textfieldString = [[NSMutableString alloc] initWithCapacity:100];
    
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
    
    
    self.provinceArray = [NSArray new];
    self.provinceArray = @[@"Alberta", @"British Columbia", @"Manitoba", @"New Brunswick", @"Newfoundland & Labrador", @"Nova Scotia", @"Northwest Territories", @"Nunavut", @"Ontario", @"Prince Edward Island", @"Quebec", @"Saskatchewan", @"Yukon"];
    
    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(0., 0., 987., 520.)];
//    [self.view addSubview:self.accordion];
    
    self.accordionViewScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(18., 170., 987., 520.)];
    self.accordionViewScrollView.contentSize = CGSizeMake(987., 800.);
    [self.view addSubview:self.accordionViewScrollView];
    [self.accordionViewScrollView addSubview:self.accordion];
    
    // Only height is taken into account, so other parameters are just dummy
    //    UIButton *header1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    //    header1.backgroundColor = [UIColor blueColor];
    //    [header1 setTitle:@"First row" forState:UIControlStateNormal];
    
//    UIButton *header1= [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
//    header1.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
//    [header1 setTitle:@"Financial Details" forState:UIControlStateNormal];
//    header1.titleLabel.textAlignment = NSTextAlignmentLeft;
    
    self.firstHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.firstHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Financial Details";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion addHeader:self.firstHeaderView withView:self.financialDetailsView];
    
//    UIButton *header2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
//    header2.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
//    [header2 setTitle:@"Employer's Details" forState:UIControlStateNormal];
//    header2.titleLabel.textAlignment = NSTextAlignmentLeft;
//    
//    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
//    view2.backgroundColor = [UIColor blueColor];

    self.secondHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.secondHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* secondHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    secondHeaderTitel.backgroundColor = [UIColor clearColor];
    secondHeaderTitel.textColor = [UIColor whiteColor];
    secondHeaderTitel.text = @"Employer's Details";
    secondHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondHeaderView addSubview:secondHeaderTitel];
    
    [self.accordion addHeader:self.secondHeaderView withView:self.employerDetailsView];
    
//    UIButton *header3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
//    header3.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
//    [header3 setTitle:@"Income and Credit Limit Details" forState:UIControlStateNormal];
//    header3.titleLabel.textAlignment = NSTextAlignmentLeft;
//    
//    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
//    view3.backgroundColor = [UIColor blueColor];

    
    self.thirdHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 50)];
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    UILabel* thirdHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 300., 40.)];
    thirdHeaderTitel.backgroundColor = [UIColor clearColor];
    thirdHeaderTitel.textColor = [UIColor whiteColor];
    thirdHeaderTitel.text = @"Income and Credit Limit Details";
    thirdHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.thirdHeaderView addSubview:thirdHeaderTitel];
    
    [self.accordion addHeader:self.thirdHeaderView withView:self.incomeAndCreditDetailsView];
    
    [self.accordion setNeedsLayout];
    
    // Set this if you want to allow multiple selection
    [self.accordion setAllowsMultipleSelection:YES];
    
}

- (void)refresh
{
    // we need to swap out he header image here based on them clicking on the next button
    
    
    //   self.sageataImage = [[UIImageView alloc] initWithFrame:CGRectMake(489.0, 62.0, 94., 81)];
    //  self.sageataImage.image = [UIImage imageNamed:@"sageata.png"];
    //  [self.view addSubview:self.sageataImage];
}

- (IBAction)nextStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    
    [appDelegate addInfoToUser:self.occupationButton.titleLabel.text andFieldToAddItTo:@"currentOcupation"];
    [appDelegate addInfoToUser:self.employmentStatus.titleLabel.text andFieldToAddItTo:@"employmentStatus"];
    //    [appDelegate addInfoToUser:self.employerCity.text andFieldToAddItTo:@"employerCity"];
    [appDelegate addInfoToUser:self.employerName.text andFieldToAddItTo:@"employerName"];
    [appDelegate addInfoToUser:self.employerStreetAddress.text andFieldToAddItTo:@"employerStreetAddress"];
    [appDelegate addInfoToUser:self.employerAreaCode.text andFieldToAddItTo:@"employerAreaCode"];
    [appDelegate addInfoToUser:self.employerWorkPhoneNumber.text andFieldToAddItTo:@"workPhone"];
    //    [appDelegate addInfoToUser:self.employerExt.text andFieldToAddItTo:@"street"];
    
    [appDelegate setNewRootView:appDelegate.pickLocationViewController];
    [appDelegate.pickLocationViewController refresh];
    
}

- (IBAction)previousStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate backOneView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    string = [string lowercaseString];
    
    if ([string isEqualToString:@""]) {
        
        //        [self.textfieldString insertString:string atIndex:self.textfieldString.length];
        [self.textfieldString setString:[self.textfieldString substringToIndex:[self.textfieldString length] - 1]];
        
        NSLog(@"%@",self.textfieldString);
        
    }else{
        
        [self.textfieldString insertString:string atIndex:self.textfieldString.length];
        
        NSLog(@"%@",self.textfieldString);
        
    }
    
    
    
    if ([self.textfieldString isEqualToString:@"other"]) {
        self.otherOccupationTextField.hidden = NO;
    }else{
        self.otherOccupationTextField.hidden = YES;
    }
    
    if (textField == self.occupationTextField ) {
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORFIRSTNAME && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORFIRSTNAME];
            return NO;
        }
        return YES;
        
    }else if(textField == self.employerName){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFOREMPLOYERNAME && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFOREMPLOYERNAME];
            return NO;
        }
        return YES;
        
    }else if (textField == self.employerStreetAddress){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFOREMPLOYERSTREET && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFOREMPLOYERSTREET];
            return NO;
        }
        return YES;
        
    }else if(textField == self.employerCity){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORCURRENTCITY && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORCURRENTCITY];
            return NO;
        }
        return YES;
        
        
        
    }else if(textField == self.employerCityTextField){
        
        int length = [textField.text length] ;
        if (length >= MAXLENGTHFORCURRENTCITY && ![string isEqualToString:@""]) {
            textField.text = [textField.text substringToIndex:MAXLENGTHFORCURRENTCITY];
            return NO;
        }
        return YES;
        
    }
    
    return YES;
}

- (IBAction)selectOccupation:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
//    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    doneButton.frame = CGRectMake(400., 0., 60., 44.);
//    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
//    [doneButton addTarget:self action:@selector(chooseOccupation) forControlEvents:UIControlEventTouchUpInside];
//    [popoverView addSubview:doneButton];

    
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
    [self.popoverController3 presentPopoverFromRect:CGRectMake(450.0, 208.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
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

- (void)chooseOccupation
{
    if ([[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]] isEqualToString:@"Other"]) {
        
        self.otherOccupationTextField.hidden = NO;
        
    }else{
        
        self.otherOccupationTextField.hidden = YES;
    }
    
    [self.occupationButton setTitle:[NSString stringWithFormat:@"%@",[self.occupationArray objectAtIndex:[self.occupationPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController3 dismissPopoverAnimated:YES];
    
}

#pragma mark
#pragma mark closeFinancialDetails

- (IBAction)closeFinancialDetails:(id)sender
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
    firstHeaderTitel.text = @"Employer's Details";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondHeaderView addSubview:firstHeaderTitel];
    
    //validate the fields here!
    bool isValid = true;
    
    if([self.occupationButton.titleLabel.text isEqualToString:@"Occupation"]){
        isValid=false;
        //mark field as invalid
        self.occupationButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.occupationButton.backgroundColor = [UIColor whiteColor];
    }
    //
    if([self.employmentStatus.titleLabel.text isEqualToString:@"Current Employment Status"]){
        isValid=false;
        //mark field as invalid
        self.employmentStatus.backgroundColor = [UIColor yellowColor];
    }else{
        self.employmentStatus.backgroundColor = [UIColor whiteColor];
    }
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    //TODO need to modify accordion to replace panel with infopanel and hide header.
    [self.accordion setSelectedIndex:1];
    
    [self changeFirstHeaderHeightAndAddInfo];
    
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
    
    UILabel* employmentStatus = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 500., 30.)];
    employmentStatus.textColor = [UIColor blackColor];
    employmentStatus.font = [UIFont fontWithName:@"Helvetica" size:16];
    employmentStatus.backgroundColor = [UIColor clearColor];
    employmentStatus.text = [NSString stringWithFormat:@"Employment Status: %@",self.employmentStatus.titleLabel.text];
    [self.firstHeaderView addSubview:employmentStatus];
    
    UILabel* currentOccupation = [[UILabel alloc] initWithFrame:CGRectMake(290., 33., 500., 30.)];
    currentOccupation.textColor = [UIColor blackColor];
    currentOccupation.font = [UIFont fontWithName:@"Helvetica" size:16];
    currentOccupation.backgroundColor = [UIColor clearColor];
    currentOccupation.text = [NSString stringWithFormat:@"Current Occupation: %@",self.occupationButton.titleLabel.text];
    [self.firstHeaderView addSubview:currentOccupation];
    
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
    firstHeaderTitel.text = @"Financial Details";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.firstHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:0];
}

#pragma mark
#pragma mark closeEmployerDetails

- (IBAction)closeEmployerDetails:(id)sender
{
    
    //validate the fields here!
    bool isValid = true;
    
    if(self.employerName.text.length < 1){
        isValid=false;
        //mark field as invalid
        self.employerName.backgroundColor = [UIColor yellowColor];
    }else{
        self.employerName.backgroundColor = [UIColor whiteColor];
    }
    
    if(self.employerCityTextField.text.length < 1)
    {
        isValid=false;
        //mark field as invalid
        self.employerCityTextField.backgroundColor = [UIColor yellowColor];
    }else{
        self.employerCityTextField.backgroundColor = [UIColor whiteColor];
        
    }
    
    //
    if(self.employerStreetAddress.text.length < 1){
        isValid=false;
        //mark field as invalid
        self.employerStreetAddress.backgroundColor = [UIColor yellowColor];
    }else{
        self.employerStreetAddress.backgroundColor = [UIColor whiteColor];
    }
    
    if([self.provinceButton.titleLabel.text isEqualToString:@"Province"]){
        isValid=false;
        //mark field as invalid
        self.provinceButton.backgroundColor = [UIColor yellowColor];
    }else{
        self.provinceButton.backgroundColor = [UIColor whiteColor];
    }
    
    if(isValid==false){
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Not all mandatory fields have been completed, please go back and fill them!" delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles: nil];
        [alert show];
        
        
        return;
    }
    
    //TODO need to modify accordion to replace panel with infopanel and hide header.
    [self.accordion setSelectedIndex:2];
    
    [self changeSecondHeaderHeightAndAddInfo];
    
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
    
    UILabel* employerName = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 300., 30.)];
    employerName.textColor = [UIColor blackColor];
    employerName.font = [UIFont fontWithName:@"Helvetica" size:16];
    employerName.backgroundColor = [UIColor clearColor];
    employerName.numberOfLines = 0;
    employerName.text = [NSString stringWithFormat:@"Employment Name: %@",self.employerName.text];
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
    employerStreetAddressLabel.text = [NSString stringWithFormat:@"%@",self.employerStreetAddress.text];
    [self.secondHeaderView addSubview:employerStreetAddressLabel];
    
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
    firstHeaderTitel.text = @"Employer's Details";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.secondHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:1];
}

#pragma mark
#pragma mark closeIncomeAndCreditLimitDetails

- (IBAction)closeIncomeAndCreditLimitDetails:(id)sender
{
    
    [self.accordion setSelectedIndex:3];
    [self changeThirdHeaderHeightAndAddInfo];
    
}

- (void)changeThirdHeaderHeightAndAddInfo
{
    self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height + 50);
    self.thirdHeaderView.backgroundColor = [UIColor whiteColor];
    
    for (UILabel *tmpLabel in [self.thirdHeaderView subviews]) {
        tmpLabel.textColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    }
    
    self.editThirdView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editThirdView.frame = CGRectMake(910., 5., 81., 42.);
    [self.editThirdView setTitle:@"Edit" forState:UIControlStateNormal];
    [self.editThirdView setImage:[UIImage imageNamed:@"btn-edit.png"] forState:UIControlStateNormal];
    [self.editThirdView setImage:[UIImage imageNamed:@"btn-edit-hover.png"] forState:UIControlStateHighlighted];
    [self.editThirdView addTarget:self action:@selector(editThirdViewAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.thirdHeaderView addSubview:self.editThirdView];
    
    UILabel* employerName = [[UILabel alloc] initWithFrame:CGRectMake(290., 3., 300., 30.)];
    employerName.textColor = [UIColor blackColor];
    employerName.font = [UIFont fontWithName:@"Helvetica" size:16];
    employerName.backgroundColor = [UIColor clearColor];
    employerName.numberOfLines = 0;
    employerName.text = [NSString stringWithFormat:@"Employment Name: %@",self.employerName.text];
    [self.thirdHeaderView addSubview:employerName];
    
    UILabel* startDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(290., 33., 300., 30.)];
    startDateLabel.textColor = [UIColor blackColor];
    startDateLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    startDateLabel.backgroundColor = [UIColor clearColor];
    startDateLabel.numberOfLines = 0;
    startDateLabel.text = [NSString stringWithFormat:@"Start date:"];
    [self.thirdHeaderView addSubview:startDateLabel];
    
    UILabel* employerStreetAddressLabel = [[UILabel alloc] initWithFrame:CGRectMake(590., 3., 400., 30.)];
    employerStreetAddressLabel.textColor = [UIColor blackColor];
    employerStreetAddressLabel.numberOfLines = 0;
    employerStreetAddressLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    employerStreetAddressLabel.backgroundColor = [UIColor clearColor];
    employerStreetAddressLabel.text = [NSString stringWithFormat:@"%@",self.employerStreetAddress.text];
    [self.thirdHeaderView addSubview:employerStreetAddressLabel];
    
}

- (void)editThirdViewAction:(id)sender
{
    self.thirdHeaderView.frame = CGRectMake(self.thirdHeaderView.frame.origin.x, self.thirdHeaderView.frame.origin.y, self.thirdHeaderView.frame.size.width, self.thirdHeaderView.frame.size.height - 50);
    self.thirdHeaderView.backgroundColor = [UIColor colorWithRed:0.086 green:0.24 blue:0.137 alpha:1];
    
    for (UILabel *tmpLabel in [self.thirdHeaderView subviews]) {
        [tmpLabel removeFromSuperview];
    }
    
    UILabel* firstHeaderTitel = [[UILabel alloc] initWithFrame:CGRectMake(6., 3., 200., 40.)];
    firstHeaderTitel.backgroundColor = [UIColor clearColor];
    firstHeaderTitel.textColor = [UIColor whiteColor];
    firstHeaderTitel.text = @"Income and Credit Limit Details";
    firstHeaderTitel.font = [UIFont fontWithName:@"Helvetica-Bold" size:17.0];
    [self.thirdHeaderView addSubview:firstHeaderTitel];
    
    [self.accordion setSelectedIndex:2];
}
@end
