//
//  ModalViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/15/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UIViewController

- (void)whichModalToPresent:(NSString *)modalName;
- (IBAction)closeModal:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *webView;


@end
