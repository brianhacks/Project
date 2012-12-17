//
//  FinancialInfoViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccordionView.h"
#import "MainViewController.h"

@interface FinancialInfoViewController : MainViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverControllerDelegate, UITextFieldDelegate>

- (IBAction)selectCountryAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *chooseCountryButton;
@property (strong, nonatomic) NSArray* countryArray;
@property (strong, nonatomic) UIPickerView *selectCountryPicker;
@property (strong, nonatomic) UIPopoverController* popoverController7;

@property (strong, nonatomic) IBOutlet UIScrollView *accordionViewScrollView;

@property (strong, nonatomic) IBOutlet UIButton *curretOccupationButton;
@property (strong, nonatomic) UIPickerView *selectCurrentOcupationPicker;
@property (strong, nonatomic) UIPopoverController* popoverController6;
@property (strong, nonatomic) IBOutlet UITextField *specifyOtherOcupationtextField;

@property (strong, nonatomic) IBOutlet UIButton *startDateButton;
@property (strong, nonatomic) UIDatePicker *startDatePicker;
@property (strong, nonatomic) UIPopoverController* popoverController5;

@property (strong, nonatomic) IBOutlet UIImageView *financeHeader;

@property (strong, nonatomic) IBOutlet UIButton *requestedCreditLimitButton;
@property (strong, nonatomic) IBOutlet UITextField *householdIncomeTextField;
@property (strong, nonatomic) IBOutlet UITextField *grossAnualIncomeTextField;

@property (strong, nonatomic) IBOutlet UIButton *bextSteptButton;

@property (strong, nonatomic) IBOutlet UIView *thirdHeaderView;
@property (strong, nonatomic) IBOutlet UIView *secondHeaderView;
@property (strong, nonatomic) IBOutlet UIView *firstHeaderView;

@property (strong, nonatomic) UIButton* editFirstView;
@property (strong, nonatomic) UIButton* editSecondView;
@property (strong, nonatomic) UIButton* editThirdView;

@property (strong, nonatomic) IBOutlet UITextField *employerCityTextField;

@property (strong, nonatomic) IBOutlet UITextField *employerCity;
@property (strong, nonatomic) IBOutlet UIButton *industryButton;
@property (strong, nonatomic) NSArray* occupationArray;
@property (strong, nonatomic) UIPickerView *occupationPicker;
@property (strong, nonatomic) UIPopoverController* popoverController3;
@property (strong, nonatomic) UIPopoverController* popoverController4;
@property (strong, nonatomic) UIPickerView *requesteCreditLimitPicker;


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
@property (strong, nonatomic) IBOutlet UITextField *employerWorkPrefix;
@property (strong, nonatomic) IBOutlet UITextField *employerWorkPhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *employerExt;
@property (strong, nonatomic) IBOutlet UIButton *closeFinancialDetails;
@property (readwrite, nonatomic) BOOL firstViewClosed;
@property (readwrite, nonatomic) BOOL secondViewClosed;
@property (strong, nonatomic) NSMutableString *requesteCreditLimitString;
@property (strong, nonatomic) NSMutableArray *requesteCreditLimitArray;
@property (nonatomic, readwrite) BOOL otherOccupationSelected;
@property (nonatomic, readwrite) BOOL otherOccupationSelected2;

@property (nonatomic, strong) NSArray* accountingFinanceInsurance;
@property (nonatomic, strong) NSArray* installationMaintenanceRepair;
@property (nonatomic, strong) NSArray* ITSoftwareDevelopment;
@property (nonatomic, strong) NSArray* legal;
@property (nonatomic, strong) NSArray* administrativeClerical;
@property (nonatomic, strong) NSArray* logisticsTransportation;
@property (nonatomic, strong) NSArray* bankingRealEstateMortgageProfessionals;
@property (nonatomic, strong) NSArray* biotechRDScience;
@property (nonatomic, strong) NSArray* manufacturingProductionOperations;
@property (nonatomic, strong) NSArray* buildingConstructionSkilledTrades;
@property (nonatomic, strong) NSArray* marketingProduct;
@property (nonatomic, strong) NSArray* businessStrategicManagement;


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
- (IBAction)requesteCreditLimitAction:(id)sender;
- (IBAction)chooseStartDate:(id)sender;
- (IBAction)selectCurrentOccupation:(id)sender;
- (IBAction)startOver:(id)sender;

@end
