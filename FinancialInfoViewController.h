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

- (void)refresh;
- (IBAction)nextStep:(id)sender;
- (IBAction)previousStep:(id)sender;

- (IBAction)doneFinance:(id)sender;

- (IBAction)doneEmployee:(id)sender;

- (IBAction)doneIncome:(id)sender;


@end
