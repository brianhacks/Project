//
//  FinancialInfoViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "FinancialInfoViewController.h"
#import "AccordionView.h"
#import "AppDelegate.h"

@interface FinancialInfoViewController ()

@end

@implementation FinancialInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.accordion = [[AccordionView alloc] initWithFrame:CGRectMake(10, 190, 1000, 520)];
    [self.view addSubview:self.accordion];
    
    // Only height is taken into account, so other parameters are just dummy
    UIButton *header1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    header1.backgroundColor = [UIColor blueColor];
    [header1 setTitle:@"First row" forState:UIControlStateNormal];
    
    [self.accordion addHeader:header1 withView:self.financialDetailsView];
    
    UIButton *header2 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    header2.backgroundColor = [UIColor blueColor];
    [header2 setTitle:@"Second row" forState:UIControlStateNormal];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    view2.backgroundColor = [UIColor blueColor];
    
    [self.accordion addHeader:header2 withView:self.employerDetailsView];
    
    UIButton *header3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    header3.backgroundColor = [UIColor blueColor];
    [header3 setTitle:@"Third row" forState:UIControlStateNormal];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    view3.backgroundColor = [UIColor blueColor];
    
    [self.accordion addHeader:header3 withView:self.incomeAndCreditDetailsView];
    
    [self.accordion setNeedsLayout];
    
    // Set this if you want to allow multiple selection
    [self.accordion setAllowsMultipleSelection:YES];
    
}

- (void)refresh
{
    self.sageataImage = [[UIImageView alloc] initWithFrame:CGRectMake(489.0, 62.0, 94., 81)];
    self.sageataImage.image = [UIImage imageNamed:@"sageata.png"];
    [self.view addSubview:self.sageataImage];
}

- (IBAction)nextStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [appDelegate setNewRootView:appDelegate.pickLocationViewController];
    [appDelegate.pickLocationViewController refresh];
    
}

- (IBAction)previousStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate backOneView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
