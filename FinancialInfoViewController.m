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
    
    self.employmentStatusPicker = [[UIPickerView alloc]init];//Date picker
    self.employmentStatusPicker.frame = CGRectMake(0,44,320, 216);
    self.employmentStatusPicker.dataSource = self;
    self.employmentStatusPicker.delegate = self;
    self.employmentStatusPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.employmentStatusPicker];
    
    popoverContent.view = popoverView;
    self.popoverController1 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController1.delegate = self;
    [self.popoverController1 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [self.popoverController1 presentPopoverFromRect:CGRectMake(100.0, 200.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
    
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
        
    }
    else
    {
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
    self.popoverController2 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController2.delegate = self;
    [self.popoverController2 setPopoverContentSize:CGSizeMake(320, 264) animated:NO];
    [self.popoverController2 presentPopoverFromRect:CGRectMake(550.0, 190.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}

- (void)chooseProvince
{
    
    //    NSLog(@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]);
    [self.provinceButton setTitle:[NSString stringWithFormat:@"%@",[self.provinceArray objectAtIndex:[self.statesPicker selectedRowInComponent:0]]] forState:UIControlStateNormal];
    [self.popoverController2 dismissPopoverAnimated:YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
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
    
    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(10, 190, 1000, 520)];
    [self.view addSubview:self.accordion];
    
    // Only height is taken into account, so other parameters are just dummy
    UIButton *header1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    header1.backgroundColor = [UIColor blueColor];
    [header1 setTitle:@"First row" forState:UIControlStateNormal];
    
    [self.accordion addHeader:header1 withView:self.financialDetailsView];
    
    UIButton *header2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    header2.backgroundColor = [UIColor blueColor];
    [header2 setTitle:@"Second row" forState:UIControlStateNormal];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    view2.backgroundColor = [UIColor blueColor];
    
    [self.accordion addHeader:header2 withView:self.employerDetailsView];
    
    UIButton *header3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    header3.backgroundColor = [UIColor blueColor];
    [header3 setTitle:@"Third row" forState:UIControlStateNormal];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    view3.backgroundColor = [UIColor blueColor];
    
    [self.accordion addHeader:header3 withView:self.incomeAndCreditDetailsView];
    
    [self.accordion setNeedsLayout];
    
    // Set this if you want to allow multiple selection
    [self.accordion setAllowsMultipleSelection:YES];
    
}

- (void)refresh
{
    self.sageataImage = [[UIImageView alloc] initWithFrame:CGRectMake(489.0, 62.0, 94., 81)];
    self.sageataImage.image = [UIImage imageNamed:@"sageata.png"];
    [self.view addSubview:self.sageataImage];
}

- (IBAction)nextStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate addInfoToUser:self.occupationButton.titleLabel.text andFieldToAddItTo:@"currentOcupation"];
    [appDelegate addInfoToUser:self.employmentStatus.titleLabel.text andFieldToAddItTo:@"employmentStatus"];
    [appDelegate addInfoToUser:self.employerCity.text andFieldToAddItTo:@"employerCity"];
    
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
        
    }
    
    return YES;
}

- (IBAction)selectOccupation:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(400., 0., 60., 44.);
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(chooseOccupation) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:doneButton];
    
    self.occupationPicker = [[UIPickerView alloc]init];//Date picker
    self.occupationPicker.frame = CGRectMake(0,44,480, 216);
    self.occupationPicker.dataSource = self;
    self.occupationPicker.delegate = self;
    self.occupationPicker.showsSelectionIndicator = YES;
    [popoverView addSubview:self.occupationPicker];
    
    popoverContent.view = popoverView;
    self.popoverController3 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController3.delegate = self;
    [self.popoverController3 setPopoverContentSize:CGSizeMake(480, 264) animated:NO];
    [self.popoverController3 presentPopoverFromRect:CGRectMake(400.0, 190.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
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

@end
