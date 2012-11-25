//
//  UserFormViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/15/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "UserFormViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"

@interface UserFormViewController ()

@end

@implementation UserFormViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        RootViewController *passcodeController = [[RootViewController alloc] init];
        passcodeController.delegate = self;
        
    }
    return self;
}

- (void)passcodeController:(RootViewController *)controller passcodeEntered:(NSString *)passCode
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    BOOL isAdmin;
    
    if ([passCode hasPrefix:@"a"])
    {
        isAdmin = YES;
        NSLog(@"launch admin part of the app");
        NSLog(@"%@",passCode);
        [appDelegate closeRootAndLaunchNextPart:isAdmin];
    }
    else if ([passCode hasPrefix:@"c"])
    {
        isAdmin = NO;
        NSLog(@"%@",passCode);
        NSLog(@"launch application procces");
        [appDelegate closeRootAndLaunchNextPart:isAdmin];
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
