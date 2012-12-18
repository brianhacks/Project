//
//  MainViewController.h
//  TD VISA FORM
//
//  Created by MATTHEW KANTOR on 12/12/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (nonatomic, strong) NSTimer *idleTimer;

-(void)setDefaultStyles:(UIView*)view;
-(void)setAppFontStyle:(NSString*)fontFamily forView:(UIView*)view ;
-(void)resetIdleTimer;
-(void)makeFeedbackButton;
-(void)drawTopLineForSubView:(UIView*)parent;
@end
