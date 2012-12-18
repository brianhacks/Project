//
//  MainViewController.m
//  TD VISA FORM
//
//  Created by MATTHEW KANTOR on 12/12/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController ()

@end

@implementation MainViewController

#define maxIdleTime 10.0

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
    [self makeFeedbackButton];
    
//    NSLog(@"%@",idleTimer.t);
    

        
}
-(void)makeFeedbackButton{
    
    //self = [super initWithFrame:frame];
    //UIView *bView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    UIButton *playButton = [UIButton buttonWithType:UIButtonTypeRoundedRect ];
    
    playButton.frame = CGRectMake(924, 25, 100, 40);
    [playButton setTitle:@"Feedback" forState:UIControlStateNormal];
    [playButton setTitleColor:[UIColor darkTextColor]forState:UIControlStateNormal];
    // creating images here ...
   
    [playButton setEnabled:YES];
    [playButton setUserInteractionEnabled:YES];
    [playButton addTarget: self
                   action: @selector(launchFeedback)
         forControlEvents: UIControlEventTouchDown];
    
    [self.view addSubview:playButton];
    
    
}
    

-(IBAction)launchFeedback {
    [TestFlight openFeedbackView];
}

/*
 Font: FrutigerLTStd-Italic
 Font: FrutigerLTStd-BoldItalic
 Font: FrutigerLTStd-Cn
 Font: FrutigerLTStd-UltraBlack
 Font: FrutigerLTStd-ExtraBlackCn
 Font: FrutigerLTStd-BlackItalic
 Font: FrutigerLTStd-Black
 Font: FrutigerLTStd-LightCn
 Font: FrutigerLTStd-Bold
 Font: FrutigerLTStd-Light
 Font: FrutigerLTStd-LightItalic
 Font: FrutigerLTStd-Roman
 Font: FrutigerLTStd-BoldCn
 Font: FrutigerLTStd-BlackCn

 */

//enum style {ACCORDION_HEADER=1, south = 5, west = 4, east};

-(void)setDefaultStyles:(UIView*)view{
    for(UIView *lbl in view.subviews){
        if([lbl isKindOfClass:[UILabel class]]){
            [(UILabel *)lbl setFont:[UIFont fontWithName:@"FrutigerLTStd-Roman" size:15]];
        }else if([lbl isKindOfClass:[UITextField class]]){
            [(UITextField *)lbl setFont:[UIFont fontWithName:@"HelveticaNeue" size:15]];
        }else if([lbl isKindOfClass:[UIButton class]]){
            [(UIButton *)lbl setFont:[UIFont fontWithName:@"FrutigerLTStd-BlackCn" size:15]];
        }

    }
}

-(void)setAppFontStyle:(NSString*)fontStyle forView:(UIView*)view
{
    NSString *fontName;
    int fontSize=15;
    
    if([fontStyle isEqualToString:@"accordion-header"]){
        fontName = @"FrutigerLTStd-Bold";
        fontSize = 22;
           }else if([fontStyle isEqualToString:@"label"]){
        fontName = @"FrutigerLTStd-Bold";
        fontSize = 16;
    }else if([fontStyle isEqualToString:@"input"]){
        fontName = @"FrutigerLTStd-Cn";
        fontSize = 16;;
    }else if([fontStyle isEqualToString:@"display-label"]){
        fontName = @"FrutigerLTStd-Roman";
    }else if([fontStyle isEqualToString:@"display-label-bold"]){
        fontName = @"FrutigerLTStd-Bold";
        fontSize = 16;
    }else if([fontStyle isEqualToString:@"display-data"]){
        fontName = @"Frutiger LT Std";
    }else if([fontStyle isEqualToString:@"button"]){
        fontName = @"Helvetica-neue";
    }else{
        //[NSException raise:NSInvalidArgumentException format:@"Style Not found for font styling"];
        NSLog(@"Style Not found for font styling");
        fontName =@"Frutiger LT Std";
    }



        if ([view isKindOfClass:[UILabel class]])
        {
            UILabel *lbl = (UILabel *)view;
            [lbl setFont:[UIFont fontWithName:fontName size:fontSize]];
        }else if([view isKindOfClass:[UITextField class]]){
            UITextField *field = (UITextField *)view;
            [field setFont:[UIFont fontWithName:fontName size:fontSize]];
        }
        
        if (true)
        {
            for (UIView *sview in view.subviews)
            {
                [self setAppFontStyle:fontName forView:sview];
            }
        }    
    }




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)drawTopLineForSubView:(UIView*)parentView {
    UIImage *image = [UIImage imageNamed:@"horizontal-line.png"];
    UIView *view = [[UIImageView alloc] initWithImage:image];
    view.frame = CGRectMake(0, 0, 986, 3);
    [parentView addSubview:view];
}

- (void)sendEvent:(UIEvent *)event{
    [self sendEvent:event];
    NSSet *allTouches = [event allTouches];
    if ([allTouches count] > 0) {
        // allTouches count only ever seems to be 1, so anyObject works here.
        UITouchPhase phase = ((UITouch *)[allTouches anyObject]).phase;
        if (phase == UITouchPhaseBegan || phase == UITouchPhaseEnded)
            [self resetIdleTimer];
    }
    
    
}
-(void)resetIdleTimer{

//        [self.idleTimer invalidate];
//        self.idleTimer = [NSTimer scheduledTimerWithTimeInterval:maxIdleTime target:self selector:@selector(idleTimerExceeded) userInfo:nil repeats:NO];

    
    
}

-(void)idleTimerExceeded{
    UIAlertView* alerView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Your session has timed out.  Information Only" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alerView show];
    
    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    /*
    NSLog(@"User hit Ok.");
    
    //reset fetch entity
    //return to some other view controller
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext* context = [appDelegate managedObjectContext];
    
    NSFetchRequest* request = [NSFetchRequest new];
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSError* error = nil;
    NSArray* fetchedResult = [context executeFetchRequest:request error:&error];
    
    for (NSManagedObject * users in fetchedResult) {
        [context deleteObject:users];
    }
    
    
    NSError *saveError = nil;
    [context save:&saveError];

    
    [self.idleTimer invalidate];
    
//    if (self.idleTimer == nil) {
//        self.idleTimer = [NSTimer scheduledTimerWithTimeInterval:maxIdleTime target:self selector:@selector(idleTimerExceeded) userInfo:nil repeats:NO];
//    }else{
    
//        [self.idleTimer fire];
    
//    }
    
    
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    */
    
}


@end
