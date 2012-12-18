//
//  GettingStartedViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/18/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCRoundSwitch.h"
#import "MainViewController.h"

@interface GettingStartedViewController : MainViewController <UIPopoverControllerDelegate>

@property (strong, nonatomic) IBOutlet UILabel *residentLabel;

@property (strong, nonatomic) IBOutlet UILabel *dobLabel;

@property (strong, nonatomic) IBOutlet UILabel *bankruptLabel;
@property (strong, nonatomic) IBOutlet UILabel *existingLabel;


@property (nonatomic, strong) NSDate* selectedPickerDate;

@property (strong, nonatomic) IBOutlet UIButton *birthDateButton;
@property (strong, nonatomic) UIPopoverController* popoverController1;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *areYouACanadianResidentSwitch;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *bankruptcySwitch;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *existingTDCanadaCustomer;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIButton* chooseDateButton2;
@property (strong, nonatomic) IBOutlet UIView *firstBorderView;
@property (strong, nonatomic) IBOutlet UIView *secondBorderView;
@property (strong, nonatomic) IBOutlet UIView *thirdBorderView;
@property (strong, nonatomic) IBOutlet UIView *fourthBorderView;
@property (strong, nonatomic) IBOutlet UIButton *nextSteptButton;


- (IBAction)areYouACanadianResidentSwitch:(id)sender;
- (IBAction)bankruptcySwitch:(id)sender;
- (IBAction)existingTDCanadaCustomer:(id)sender;
- (IBAction)nextStep:(id)sender;
- (IBAction)previousStep:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *showPrivacy;
- (IBAction)showPrivacy:(id)sender;
- (IBAction)showLegal:(id)sender;
- (IBAction)showSecurity:(id)sender;
- (IBAction)startOver:(id)sender;




- (void)refresh;
- (IBAction)showBirthDatePicker:(id)sender;

@end
