//
//  RootViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/13/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"

@interface RootViewController ()

- (void)notifyDelegate:(NSString *)passcode;

@end

@implementation RootViewController

@synthesize delegate;


@synthesize bulletField0;
@synthesize bulletField1;
@synthesize bulletField2;
@synthesize bulletField3;
@synthesize bulletField4;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];

    // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    
    UITextField *fakeField2 = [[UITextField alloc] initWithFrame:CGRectZero];
    fakeField2.delegate = self;
    fakeField2.keyboardType = UIKeyboardTypeNumberPad;
    fakeField2.secureTextEntry = YES;
    fakeField2.text = @"";
    [fakeField2 becomeFirstResponder];
    [self.view addSubview:fakeField2];
//    fakeField = nil;
    
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = NSLocalizedString(@"Passcode", @"");

    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    fakeField = nil;
    
    self.bulletField0 = nil;
    self.bulletField1 = nil;
    self.bulletField2 = nil;
    self.bulletField3 = nil;
}

- (void)internalResetWithAnimation:(NSNumber *)animationStyleNumber {
    KVPasscodeAnimationStyle animationStyle = [animationStyleNumber intValue];
    switch (animationStyle) {
        case KVPasscodeAnimationStyleInvalid:
        {
            
            
        }
            break;
        case KVPasscodeAnimationStyleConfirm:
        {
            
            // This will cause the 'new' fields to appear without bullets already in them
            self.bulletField0.text = nil;
            self.bulletField1.text = nil;
            self.bulletField2.text = nil;
            self.bulletField3.text = nil;
            

            
        }
            break;
        case KVPasscodeAnimationStyleNone:
            
        default:
            self.bulletField0.text = nil;
            self.bulletField1.text = nil;
            self.bulletField2.text = nil;
            self.bulletField3.text = nil;
            
            fakeField.text = @"";
            break;
    }
}

- (void)resetWithAnimation:(KVPasscodeAnimationStyle)animationStyle {
    // Do the animation a little later (for better animation) as it's likely this method is called in our delegate method
    [self performSelector:@selector(internalResetWithAnimation:) withObject:[NSNumber numberWithInt:animationStyle] afterDelay:0];
}

- (void)notifyDelegate:(NSString *)passcode {
    [self.delegate passcodeController:self passcodeEntered:passcode];
    fakeField.text = @"";
}


#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *passcode = [textField text];
    passcode = [passcode stringByReplacingCharactersInRange:range withString:string];
    
    switch ([passcode length]) {
        case 0:
            self.bulletField0.text = nil;
            self.bulletField1.text = nil;
            self.bulletField2.text = nil;
            self.bulletField3.text = nil;
            self.bulletField4.text = nil;
            break;
        case 1:
            self.bulletField0.text = @"*";
            self.bulletField1.text = nil;
            self.bulletField2.text = nil;
            self.bulletField3.text = nil;
            self.bulletField4.text = nil;
            break;
        case 2:
            self.bulletField0.text = @"*";
            self.bulletField1.text = @"*";
            self.bulletField2.text = nil;
            self.bulletField3.text = nil;
            self.bulletField4.text = nil;
            break;
        case 3:
            self.bulletField0.text = @"*";
            self.bulletField1.text = @"*";
            self.bulletField2.text = @"*";
            self.bulletField3.text = nil;
            self.bulletField4.text = nil;
            break;
        case 4:
            self.bulletField0.text = @"*";
            self.bulletField1.text = @"*";
            self.bulletField2.text = @"*";
            self.bulletField3.text = @"*";
            self.bulletField4.text = nil;
            break;
        case 5:
            self.bulletField0.text = @"*";
            self.bulletField1.text = @"*";
            self.bulletField2.text = @"*";
            self.bulletField3.text = @"*";
            self.bulletField4.text = @"*";
            // Notify delegate a little later so we have a chance to show the 4th bullet
//            [self performSelector:@selector(notifyDelegate:) withObject:passcode afterDelay:0];
            [self proccessPassword:passcode];
            return YES;
            
            break;
        default:
            break;
    }
    
    return YES;
}

- (void)proccessPassword:(NSString*)password
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    BOOL isAdmin;
    
    if ([password hasPrefix:@"a"])
    {
        isAdmin = YES;
        NSLog(@"launch admin part of the app");
        NSLog(@"%@",password);
        // verify the password and clear if its wrong
       
        
        [appDelegate closeRootAndLaunchNextPart:isAdmin];
    }
    else if ([password hasPrefix:@"c"])
    {
        isAdmin = NO;
        NSLog(@"%@",password);
        NSLog(@"launch application procces");
        [appDelegate closeRootAndLaunchNextPart:isAdmin];
    }
    else
    {
        
        NSLog(@"wrong password");
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Wrong password, please try again!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    [self resetFied];
    
}

- (void)resetFied
{
    UITextField* fakeField2 = [[UITextField alloc] initWithFrame:CGRectZero];
    fakeField2.delegate = self;
    fakeField2.keyboardType = UIKeyboardTypeNumberPad;
    fakeField2.secureTextEntry = YES;
    fakeField2.text = @"";
    [fakeField2 becomeFirstResponder];
    [self.view addSubview:fakeField2];
    
}

@end