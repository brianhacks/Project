//
//  AppProcessViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/15/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectThisCardViewController.h"
#import "MainViewController.h"


@interface AppProcessViewController : MainViewController <SelectThisCardViewControllerDelegate>

//@property (nonatomic, weak) id <AppProcessViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIButton *selectThisCard;
@property (strong, nonatomic) IBOutlet UIButton *startOver;
@property (strong, nonatomic) IBOutlet UIButton *security;
@property (strong, nonatomic) IBOutlet UIButton *legal;
@property (strong, nonatomic) IBOutlet UIButton *privacy;
@property (strong, nonatomic) UIImageView* sageataImage;


- (IBAction)startOverPressed:(id)sender;
- (IBAction)securityPressed:(id)sender;
- (IBAction)legalPressed:(id)sender;
- (IBAction)privacyPressed:(id)sender;
- (IBAction)selectThisCardPressed:(id)sender;
@end
