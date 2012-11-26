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

@property (strong, nonatomic) UIImageView* sageataImage;
@property (strong, nonatomic) IBOutlet UIView *generalInfoView;
@property (strong, nonatomic) UIPopoverController* popoverController1;
@property (strong, nonatomic) IBOutlet UIButton *selectGenderButton;
@property (strong, nonatomic) IBOutlet UIButton *doneGeneralInfo;
@property (strong, nonatomic) IBOutlet UIView *currentHomeAddressView;

- (void)refresh;
- (IBAction)previousStep:(id)sender;
- (IBAction)nextStep:(id)sender;
- (IBAction)selectGender:(id)sender;
- (IBAction)selectLanguageOfCorrespondace:(id)sender;
- (IBAction)closeGeneralInfoView:(id)sender;


@end
