//
//  FirstScreenSaverViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/13/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "FirstScreenSaverViewController.h"

@interface FirstScreenSaverViewController ()

@property (nonatomic)BOOL firstScreenShown;
@property (nonatomic, strong) NSTimer* switchViews;

@end

@implementation FirstScreenSaverViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.view.userInteractionEnabled = YES;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.firstScreenShown = YES;
 [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    
//    UIColor *background1 = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"ssaver1.png"]];
//   
//    self.firstView.backgroundColor = background1;
//    
//    UIColor *background2 = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"ssaver2.png"]];
//    
//    self.secondView.backgroundColor = background2;
 
    
     self.view.frame = CGRectMake(0.0, 0.0, 1024.0, 768.0);
    self.switchViews = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(turnUp:) userInfo:nil repeats:YES];
    
    
    
}

- (void)restartEverythingAfterIdleTime
{
//    self.firstScreenShown = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:YES];
    self.view.frame = CGRectMake(0.0, 0.0, 1024.0, 768.0);
    
    [self.switchViews invalidate];
    self.switchViews = nil;
    
    self.switchViews = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(turnUp:) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.switchViews invalidate];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"StopScreenSaver" object:nil];
    
    
}

- (IBAction)turnUp:(id)sender {
    
    if (self.firstScreenShown) {
        
        self.firstScreenShown = NO;
        
//        [self.secondView removeFromSuperview];
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:5.0];
//        [UIView setAnimationTransition:UIViewAnimationOptionTransitionCrossDissolve forView:self.view cache:YES];
//        [UIView commitAnimations];
//        [self.view addSubview:self.firstView];

        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:2.0];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.firstView cache:NO];
        [self.firstView setAlpha:0.0];
        [self.secondView setAlpha:1.0];
        [UIView commitAnimations];
        
    }else{
        
        self.firstScreenShown = YES;
        
//        [self.firstView removeFromSuperview];
//        [UIView beginAnimations:nil context:NULL];
//        [UIView setAnimationDuration:5.0];
//        [UIView setAnimationTransition:UIViewAnimationOptionTransitionCrossDissolve forView:self.view cache:YES];
//        [UIView commitAnimations];
//        [self.view addSubview:self.secondView];
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        [UIView setAnimationTransition:UIViewAnimationTransitionNone forView:self.secondView cache:NO];
        [self.secondView setAlpha:0.0];
        [self.firstView setAlpha:1.0];
        [UIView commitAnimations];
        
    }
    
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
//{
//    return YES;
//}

@end
