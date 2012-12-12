//
//  MainViewController.m
//  TD VISA FORM
//
//  Created by MATTHEW KANTOR on 12/12/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

#define maxIdleTime 10.0

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
//        self.idleTimer = [NSTimer scheduledTimerWithTimeInterval:maxIdleTime target:self selector:@selector(idleTimerExceeded) userInfo:nil repeats:NO];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self resetIdleTimer];
    
//    NSLog(@"%@",idleTimer.t);
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    
    if (self.idleTimer == nil) {
        
        self.idleTimer = [NSTimer scheduledTimerWithTimeInterval:maxIdleTime target:self selector:@selector(idleTimerExceeded) userInfo:nil repeats:NO];
        
    }else{
    
        [self.idleTimer invalidate];
        [self.idleTimer fire];
        
    }
    
    
}

-(void)idleTimerExceeded{
    UIAlertView* alerView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Your session has timed out.  Information Only" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alerView show];
    
    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    NSLog(@"User hit Ok.");
    
    //reset fetch entity
    //return to some other view controller
    
    
}


@end
