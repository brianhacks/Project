//
//  ReviewOnePreviousAddressViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 12/27/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "AccordionView.h"
#import "User.h"
#import "MainViewController.h"
#import "SelectThisCardViewController.h"

@interface ReviewOnePreviousAddressViewController : MainViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverControllerDelegate, SelectThisCardViewControllerDelegate>


@property (strong, nonatomic) User* userInfo;
@property (strong, nonatomic) IBOutlet UIScrollView *accordionViewScrollView;

@property (strong, nonatomic) AccordionView *accordion;
@property (strong, nonatomic) IBOutlet UIView *firstVIew;
@property (strong, nonatomic) IBOutlet UIView *firstView1;
@property (strong, nonatomic) IBOutlet UIView *secondView1;
@property (strong, nonatomic) IBOutlet UIView *secondView;

@property (strong, nonatomic) IBOutlet UIView *financialDetails;
@property (strong, nonatomic) IBOutlet UIView *firstHeaderView;
@property (strong, nonatomic) IBOutlet UIView *employerDetails;
@property (strong, nonatomic) IBOutlet UIView *secondHeaderView;
@property (strong, nonatomic) IBOutlet UIView *incomeAndCreditLimts;
@property (strong, nonatomic) IBOutlet UIView *thirdHeaderView;

@property (readwrite, nonatomic) BOOL firstViewOpen;
@property (readwrite, nonatomic) BOOL secondViewOpen;
@property (readwrite, nonatomic) BOOL thirdViewOpen;
@property (readwrite, nonatomic) BOOL forthViewOpen;
@property (readwrite, nonatomic) BOOL fifthViewOpen;
@property (readwrite, nonatomic) BOOL sixthViewOpen;

@property (strong, nonatomic) UIButton *editFirstView;
@property (strong, nonatomic) UIButton *editSecondView;
@property (strong, nonatomic) UIButton *editThirdView;
@property (strong, nonatomic) UIButton *editForthView;
@property (strong, nonatomic) UIButton *editFifthView;


@property (strong, nonatomic) IBOutlet UIButton *titleButton;
@property (strong, nonatomic) IBOutlet UITextField *firstNameTextfield;
@property (strong, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *primaryPhonenumberTextField;
@property (strong, nonatomic) IBOutlet UIButton *genderButton;
@property (strong, nonatomic) IBOutlet UIButton *languageOfCorespondaceButton;

@property (strong, nonatomic) IBOutlet UITextField *currentHomeAddress;
@property (strong, nonatomic) IBOutlet UITextField *postalCode;
@property (strong, nonatomic) IBOutlet UIButton *provinceButton;
@property (strong, nonatomic) IBOutlet UITextField *cityTextfield;
@property (strong, nonatomic) IBOutlet UIButton *yearsAndMontsButton;
@property (strong, nonatomic) IBOutlet UIButton *residentialStatusButton;
@property (strong, nonatomic) IBOutlet UITextField *totalMontlyCostsTextfield;

@property (strong, nonatomic) IBOutlet UIButton *currentEmploymentStatus;
@property (strong, nonatomic) IBOutlet UIButton *currentOccupation;

@property (strong, nonatomic) IBOutlet UITextField *employerNametextField;
@property (strong, nonatomic) IBOutlet UIButton *employmentStatDate;
@property (strong, nonatomic) IBOutlet UITextField *employerStreetAddress;
@property (strong, nonatomic) IBOutlet UIButton *employerProvince;
@property (strong, nonatomic) IBOutlet UITextField *employerCity;

@property (strong, nonatomic) IBOutlet UIButton *creditLimitButton;
@property (strong, nonatomic) IBOutlet UITextField *grossAnualIncome;
@property (strong, nonatomic) IBOutlet UITextField *householdIncome;

//@property (strong, nonatomic) UIScrollView* accordionViewScrollView;
//general info
@property (strong, nonatomic) UIPopoverController* popoverController1;
@property (strong, nonatomic) UIPopoverController* popoverController2;
@property (strong, nonatomic) UIPopoverController* popoverController3;
@property (strong, nonatomic) UIPopoverController* popoverController4;
@property (strong, nonatomic) UIPopoverController* popoverController5;
@property (strong, nonatomic) IBOutlet UIButton *selectGenderButton;
@property (strong, nonatomic) NSArray* genderArray;
@property (strong, nonatomic) UIPickerView *genderPicker;

@property (strong, nonatomic) NSArray* monthsLivedArray;
@property (strong, nonatomic) NSArray* yearsLivedArray;
@property (strong, nonatomic) NSArray* provinceArray;
@property (strong, nonatomic) NSArray* titleArray;
@property (strong, nonatomic) NSArray* languageOfCorespondaceArray;
@property (strong, nonatomic) NSArray* residentialStatusArray;
@property (strong, nonatomic) NSArray* occupationArray;
@property (strong, nonatomic) NSArray* employmentStatusArray;
@property (strong, nonatomic) NSMutableArray *requesteCreditLimitArray;

@property (strong, nonatomic) IBOutlet UIPickerView *statesPicker;
@property (strong, nonatomic) UIPickerView *titlePicker;
@property (strong, nonatomic) UIPickerView *languageOfCorespondacePicker;
@property (strong, nonatomic) UIPickerView *residentialStatusPicker;
@property (strong, nonatomic) UIPickerView *timeLivedAtCurrentAddressPicker;
@property (strong, nonatomic) UIPickerView *requesteCreditLimitPicker;
@property (strong, nonatomic) UIPickerView *occupationPicker;
@property (strong, nonatomic) UIPickerView *employmentStatusPicker;
@property (strong, nonatomic) UIDatePicker *startDatePicker;

@property (strong, nonatomic) IBOutlet UIView *formalHomeAddress;
@property (strong, nonatomic) IBOutlet UIView *formalFormalHomeAddress;
@property (strong, nonatomic) IBOutlet UIView *formalHomeAddressView;
@property (strong, nonatomic) IBOutlet UIView *formalFormalHomeAddressView;
@property (strong, nonatomic) IBOutlet UITextField *previousStreetAddres;
@property (strong, nonatomic) IBOutlet UITextField *previousCity;
@property (strong, nonatomic) IBOutlet UIButton *previousProvinceButton;
@property (strong, nonatomic) IBOutlet UITextField *previousPostalCode;
@property (strong, nonatomic) IBOutlet UIButton *previousResidentialStatus;
@property (strong, nonatomic) IBOutlet UIButton *previousYearsAndMonths;



- (IBAction)closeFormalAddressView:(id)sender;
- (IBAction)closeGeneralInfo:(id)sender;
- (IBAction)closeCurrentAddress:(id)sender;
- (IBAction)closeFInancialDetails:(id)sender;
- (IBAction)closeEmployerDetails:(id)sender;
- (IBAction)closeIncomeAndCredit:(id)sender;
- (IBAction)nextStep:(id)sender;

- (IBAction)selectGender:(id)sender;
- (IBAction)startOver:(id)sender;

@end

