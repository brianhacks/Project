//
//  PickLocationViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickLocationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UIImageView* sageataImage;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)nextStep:(id)sender;
- (IBAction)previousStep:(id)sender;

- (void)refresh;

@end
