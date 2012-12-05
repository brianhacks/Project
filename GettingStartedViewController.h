//
//  GettingStartedViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/18/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCRoundSwitch.h"

@interface GettingStartedViewController : UIViewController <UIPopoverControllerDelegate>

@property (strong, nonatomic) UIImageView* sageataImage;
@property (strong, nonatomic) IBOutlet DCRoundSwitch *lakjsd;
@property (strong, nonatomic) IBOutlet UIButton *birthDateButton;
@property (strong, nonatomic) UIPopoverController* popoverController1;
@property (strong, nonatomic) IBOutlet UISwitch *areYouACanadianResidentSwitch;
@property (strong, nonatomic) IBOutlet UISwitch *bankruptcySwitch;
@property (strong, nonatomic) IBOutlet UISwitch *existingTDCanadaCustomer;
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIButton* chooseDateButton2;
@property (strong, nonatomic) IBOutlet UIView *firstBorderView;
@property (strong, nonatomic) IBOutlet UIView *secondBorderView;
@property (strong, nonatomic) IBOutlet UIView *thirdBorderView;
@property (strong, nonatomic) IBOutlet UIView *fourthBorderView;

- (IBAction)areYouACanadianResidentSwitch:(id)sender;
- (IBAction)bankruptcySwitch:(id)sender;
- (IBAction)existingTDCanadaCustomer:(id)sender;
- (IBAction)nextStep:(id)sender;
- (IBAction)previousStep:(id)sender;




- (void)refresh;
- (IBAction)showBirthDatePicker:(id)sender;

@end
