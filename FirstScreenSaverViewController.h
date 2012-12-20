//
//  FirstScreenSaverViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/13/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstScreenSaverViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *firstView;
@property (strong, nonatomic) IBOutlet UIView *secondView;

- (IBAction)turnUp:(id)sender;
- (void)restartEverythingAfterIdleTime;

@end
