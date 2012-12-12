//
//  FinalAcceptViewController.h
//  TD VISA FORM
//
//  Created by MATTHEW KANTOR on 12/12/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FinalAcceptViewController;

@protocol FinalAcceptViewControllerDelegate <NSObject>

- (void)chooseCard:(FinalAcceptViewController *)controller andButton:(NSString *)string;

@end

@interface FinalAcceptViewController : UIViewController

@property (nonatomic, weak) id <FinalAcceptViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIWebView *selectCardWebView;
@property (strong, nonatomic) IBOutlet UIView *webShowdowView;

- (IBAction)backToCards:(id)sender;
- (IBAction)chooseThisCard:(id)sender;

@end
