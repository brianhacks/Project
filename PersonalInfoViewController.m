//
//  PersonalInfoViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/23/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "AppDelegate.h"
#import "AccordionView.h"

@interface PersonalInfoViewController ()

@end

@implementation PersonalInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)refresh
{
    self.sageataImage = [[UIImageView alloc] initWithFrame:CGRectMake(349.0, 62.0, 94., 81)];
    self.sageataImage.image = [UIImage imageNamed:@"sageata.png"];
    [self.view addSubview:self.sageataImage];
    
    [self.accordion setNeedsLayout];
}

- (IBAction)previousStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate backOneView];
    
}

- (IBAction)nextStep:(id)sender
{
    
    
    
}

- (IBAction)selectGender:(id)sender
{
    
    UIViewController* popoverContent = [[UIViewController alloc] init]; //ViewController
    
    UIView *popoverView = [[UIView alloc] init];   //view
    popoverView.backgroundColor = [UIColor grayColor];
    
    UIButton* doneButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneButton.frame = CGRectMake(150., 0., 60., 44.);
    [doneButton setTitle:@"Done" forState:UIControlStateNormal];
    [doneButton addTarget:self action:@selector(dismissPopover) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:doneButton];

    UIButton* maleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    maleButton.frame = CGRectMake(0., 47., 220., 44.);
    [maleButton setTitle:@"Male" forState:UIControlStateNormal];
    [maleButton addTarget:self action:@selector(chooseMaleButton) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:maleButton];
    
    UIButton* femaleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    femaleButton.frame = CGRectMake(0., 93., 220., 44.);
    [femaleButton setTitle:@"Female" forState:UIControlStateNormal];
    [femaleButton addTarget:self action:@selector(chooseFemaleButton) forControlEvents:UIControlEventTouchUpInside];
    [popoverView addSubview:femaleButton];
    
    popoverContent.view = popoverView;
    self.popoverController1 = [[UIPopoverController alloc] initWithContentViewController:popoverContent];
    self.popoverController1.delegate = self;
    
    [self.popoverController1 setPopoverContentSize:CGSizeMake(220, 164) animated:NO];
    [self.popoverController1 presentPopoverFromRect:CGRectMake(550.0, 190.0, 100.0, 100.0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    
}

- (void)chooseMaleButton
{
    [self.popoverController1 dismissPopoverAnimated:YES];
}

- (void)chooseFemaleButton
{
    [self.popoverController1 dismissPopoverAnimated:YES];
}

- (void)dismissPopover
{
    [self.popoverController1 dismissPopoverAnimated:YES];
}

- (IBAction)selectLanguageOfCorrespondace:(id)sender
{
}

- (IBAction)closeGeneralInfoView:(id)sender
{
    
    [self.accordion setSelectedIndex:1];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(10, 190, 1000, 420)];
    [self.view addSubview:self.accordion];
    
    // Only height is taken into account, so other parameters are just dummy
    self.doneGeneralInfo = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    self.doneGeneralInfo.backgroundColor = [UIColor blueColor];
    
    [self.accordion addHeader:self.doneGeneralInfo withView:self.generalInfoView];
    
    UIButton *header2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    header2.backgroundColor = [UIColor blueColor];
    [header2 setTitle:@"Second row" forState:UIControlStateNormal];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    view2.backgroundColor = [UIColor blueColor];
    
    [self.accordion addHeader:header2 withView:view2];
    
    [self.accordion setNeedsLayout];
    
    // Set this if you want to allow multiple selection
    [self.accordion setAllowsMultipleSelection:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
