//
//  FinancialInfoViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccordionView.h"

@interface FinancialInfoViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) UIScrollView* accordionViewScrollView;

@property (strong, nonatomic) IBOutlet UIView *thirdHeaderView;
@property (strong, nonatomic) IBOutlet UIView *secondHeaderView;
@property (strong, nonatomic) IBOutlet UIView *firstHeaderView;

@property (strong, nonatomic) UIButton* editFirstView;
@property (strong, nonatomic) UIButton* editSecondView;
@property (strong, nonatomic) UIButton* editThirdView;

@property (strong, nonatomic) IBOutlet UITextField *employerCityTextField;

@property (strong, nonatomic) IBOutlet UITextField *employerCity;
@property (strong, nonatomic) IBOutlet UIButton *occupationButton;
@property (strong, nonatomic) NSArray* occupationArray;
@property (strong, nonatomic) UIPickerView *occupationPicker;
@property (strong, nonatomic) UIPopoverController* popoverController3;


@property (strong, nonatomic) NSMutableString* textfieldString;
@property (strong, nonatomic) IBOutlet UITextField *otherOccupationTextField;

@property (strong, nonatomic) IBOutlet UITextField *occupationTextField;
@property (strong, nonatomic) NSArray* employmentStatusArray;
@property (strong, nonatomic) UIPickerView *employmentStatusPicker;
@property (strong, nonatomic) UIPopoverController* popoverController1;
@property (strong, nonatomic) IBOutlet UIButton *employmentStatus;

@property (strong, nonatomic) NSArray* provinceArray;
@property (strong, nonatomic) UIPopoverController* popoverController2;
@property (strong, nonatomic) IBOutlet UIPickerView *statesPicker;
@property (strong, nonatomic) IBOutlet UIButton *provinceButton;

@property (strong, nonatomic) UIImageView* sageataImage;
@property (strong, nonatomic) AccordionView *accordion;
@property (strong, nonatomic) IBOutlet UIView *financialDetailsView;
@property (strong, nonatomic) IBOutlet UIView *employerDetailsView;
@property (strong, nonatomic) IBOutlet UIView *incomeAndCreditDetailsView;
@property (strong, nonatomic) IBOutlet UITextField *specifyOtherOcupation;
@property (strong, nonatomic) IBOutlet UITextField *employerName;
@property (strong, nonatomic) IBOutlet UITextField *employerStreetAddress;
@property (strong, nonatomic) IBOutlet UITextField *employerAreaCode;
@property (strong, nonatomic) IBOutlet UITextField *employerWorkPhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *employerExt;
@property (strong, nonatomic) IBOutlet UIButton *closeFinancialDetails;

- (void)refresh;
- (IBAction)nextStep:(id)sender;
- (IBAction)previousStep:(id)sender;
- (IBAction)closeEmployerDetails:(id)sender;
- (IBAction)closeFinancialDetails:(id)sender;
- (IBAction)closeIncomeAndCreditLimitDetails:(id)sender;
- (IBAction)selectOccupation:(id)sender;
- (IBAction)showPrivacy:(id)sender;
- (IBAction)showLegal:(id)sender;
- (IBAction)showSecurity:(id)sender;

@end
