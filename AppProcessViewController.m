//
//  AppProcessViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/15/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "AppProcessViewController.h"
#import "AppDelegate.h"
#import "SelectThisCardViewController.h"

@interface AppProcessViewController ()

@property (nonatomic, strong) SelectThisCardViewController* selectThisCardViewController;

@end

@implementation AppProcessViewController

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
    
    self.sageataImage = [[UIImageView alloc] initWithFrame:CGRectMake(39.0, 62.0, 94., 81)];
    self.sageataImage.image = [UIImage imageNamed:@"sageata.png"];
    [self.view addSubview:self.sageataImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startOverPressed:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
//    [self presentModalViewController:appDelegate.modalViewController animated:YES];
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    
}

- (IBAction)securityPressed:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
}

- (IBAction)legalPressed:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    
}

- (IBAction)privacyPressed:(id)sender
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    appDelegate.modalViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:appDelegate.modalViewController animated:YES completion:^{}];
    
}

- (IBAction)selectThisCardPressed:(id)sender
{
    
    if (self.selectThisCardViewController == nil) {
        self.selectThisCardViewController = [[SelectThisCardViewController alloc] initWithNibName:@"SelectThisCardViewController" bundle:nil];
    }
    
    self.selectThisCardViewController.delegate = self;
    self.selectThisCardViewController.modalPresentationStyle = UIModalPresentationPageSheet;
    [self presentViewController:self.selectThisCardViewController animated:YES completion:^{}];
    
}


- (void)chooseCard:(SelectThisCardViewController *)controller andButton:(NSString *)string
{
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    if ([string isEqualToString:@"back To Cards"]) {
        
        NSLog(@"back to cards");
        
    }else if ([string isEqualToString:@"choose this card"]){
        
        NSLog(@"move to next part of the app");
        
//        [self.navigationController pushViewController:appDelegate.gettingStartedViewController animated:YES];
//        [appDelegate.rootViewController.navigationController pushViewController:appDelegate.gettingStartedViewController animated:YES];
        [appDelegate setNewRootView:appDelegate.gettingStartedViewController];
        [appDelegate.gettingStartedViewController refresh];
        
//        self.sageataImage.frame = CGRectMake(self.sageataImage.frame.origin.x + 120, 62., 94., 81.);
    }
    
}





@end
