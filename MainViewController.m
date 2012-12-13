//
//  MainViewController.m
//  TD VISA FORM
//
//  Created by MATTHEW KANTOR on 12/12/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"

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
    
    
//    NSLog(@"%@",idleTimer.t);
    

        
}
    
-(void)setFontFamily:(NSString*)fontFamily forView:(UIView*)view andSubViews:(BOOL)isSubViews
    {
        if ([view isKindOfClass:[UILabel class]])
        {
            UILabel *lbl = (UILabel *)view;
            [lbl setFont:[UIFont fontWithName:fontFamily size:[[lbl font] pointSize]]];
        }
        
        if (isSubViews)
        {
            for (UIView *sview in view.subviews)
            {
                [self setFontFamily:fontFamily forView:sview andSubViews:YES];
            }
        }    
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
