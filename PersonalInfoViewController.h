//
//  PersonalInfoViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/23/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccordionView.h"

@interface PersonalInfoViewController : UIViewController <UIPopoverControllerDelegate>

@property (strong, nonatomic) AccordionView *accordion;
@property (strong, nonatomic) NSString* gender;
@property (strong, nonatomic) UIImageView* sageataImage;
@property (strong, nonatomic) IBOutlet UIView *generalInfoView;
@property (strong, nonatomic) UIPopoverController* popoverController1;
@property (strong, nonatomic) IBOutlet UIButton *selectGenderButton;
@property (strong, nonatomic) IBOutlet UIButton *doneGeneralInfo;
@property (strong, nonatomic) IBOutlet UIView *currentHomeAddressView;
@property (strong, nonatomic) IBOutlet UITextField *firstName;
@property (strong, nonatomic) IBOutlet UITextField *lastName;
@property (strong, nonatomic) IBOutlet UITextField *areaCode;
@property (strong, nonatomic) IBOutlet UITextField *primaryPhoneNumber;
@property (strong, nonatomic) IBOutlet UITextField *emailAddress;
@property (strong, nonatomic) IBOutlet UITextField *streetAddress;
@property (strong, nonatomic) IBOutlet UITextField *postalCode;
@property (strong, nonatomic) IBOutlet UITextField *totalMonthlyHousingCosts;

- (void)refresh;
- (IBAction)previousStep:(id)sender;
- (IBAction)nextStep:(id)sender;
- (IBAction)selectGender:(id)sender;
- (IBAction)selectLanguageOfCorrespondace:(id)sender;
- (IBAction)closeGeneralInfoView:(id)sender;


@end
