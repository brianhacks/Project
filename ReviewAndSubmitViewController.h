//
//  ReviewAndSubmitViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 12/9/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccordionView.h"
#import "User.h"

@interface ReviewAndSubmitViewController : UIViewController


@property (strong, nonatomic) User* userInfo;

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

@property (strong, nonatomic) UIButton *editFirstView;
@property (strong, nonatomic) UIButton *editSecondView;
@property (strong, nonatomic) UIButton *editThirdView;
@property (strong, nonatomic) UIButton *editForthView;
@property (strong, nonatomic) UIButton *editFifthView;

- (IBAction)closeGeneralInfo:(id)sender;
- (IBAction)closeCurrentAddress:(id)sender;
- (IBAction)closeFInancialDetails:(id)sender;
- (IBAction)closeEmployerDetails:(id)sender;
- (IBAction)closeIncomeAndCredit:(id)sender;

@end
