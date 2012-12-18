//
//  SelectThisCardViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/15/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectThisCardViewController;

@protocol SelectThisCardViewControllerDelegate <NSObject>

- (void)chooseCard:(SelectThisCardViewController *)controller andButton:(NSString *)string;

@end

@interface SelectThisCardViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, weak) id <SelectThisCardViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll;
@property (strong, nonatomic) IBOutlet UIButton *btnTerms;

@property (strong, nonatomic) IBOutlet UIView *webShowdowView;

- (IBAction)backToCards:(id)sender;
- (IBAction)chooseThisCard:(id)sender;
-(void)scrollViewDidScroll:(UIScrollView *)scrollView;
@end
