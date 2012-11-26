//
//  FinancialInfoViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccordionView.h"

@interface FinancialInfoViewController : UIViewController

@property (strong, nonatomic) UIImageView* sageataImage;
@property (strong, nonatomic) AccordionView *accordion;
@property (strong, nonatomic) IBOutlet UIView *financialDetailsView;
@property (strong, nonatomic) IBOutlet UIView *employerDetailsView;
@property (strong, nonatomic) IBOutlet UIView *incomeAndCreditDetailsView;

- (void)refresh;
- (IBAction)nextStep:(id)sender;
- (IBAction)previousStep:(id)sender;

@end
