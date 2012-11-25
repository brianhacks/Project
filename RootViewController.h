//
//  RootViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/13/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@protocol RootViewControllerDelegate <NSObject>

- (void)passcodeController:(RootViewController *)controller passcodeEntered:(NSString *)passCode;

@end

typedef enum {
    KVPasscodeAnimationStyleNone,
    KVPasscodeAnimationStyleInvalid,
    KVPasscodeAnimationStyleConfirm
} KVPasscodeAnimationStyle;

@interface RootViewController : UIViewController <UITextFieldDelegate> {
//    id <RootViewControllerDelegate> delegate;
    
    
    IBOutlet UITextField *bulletField0;
    IBOutlet UITextField *bulletField1;
    IBOutlet UITextField *bulletField2;
    IBOutlet UITextField *bulletField3;
    IBOutlet UITextField *bulletField4;
    
    UITextField *fakeField;
}

@property (nonatomic, weak) id <RootViewControllerDelegate> delegate;

@property (nonatomic, strong) IBOutlet UITextField *bulletField0;
@property (nonatomic, strong) IBOutlet UITextField *bulletField1;
@property (nonatomic, strong) IBOutlet UITextField *bulletField2;
@property (nonatomic, strong) IBOutlet UITextField *bulletField3;
@property (nonatomic, strong) IBOutlet UITextField *bulletField4;

- (void)resetWithAnimation:(KVPasscodeAnimationStyle)animationStyle;

@end
