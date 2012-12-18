//
//  GCPINViewController.m
//  PINCode
//
//  Created by Caleb Davenport on 8/28/10.
//  Copyright 2010 GUI Cocoa, LLC. All rights reserved.
//

#import "GCPINViewController.h"
//#import <AudioToolbox/AudioToolbox.h>
#import "AppDelegate.h"

#define kGCPINViewControllerDelay 0.3

@interface GCPINViewController ()

// array of passcode entry labels
@property (copy, nonatomic) NSArray *labels;

// readwrite override for mode
@property (nonatomic, readwrite, assign) GCPINViewControllerMode mode;

// extra storage used when creating a passcode
@property (copy, nonatomic) NSString *text;

// make the passcode entry labels match the input text
- (void)updatePasscodeDisplay;

// reset user input after a set delay
- (void)resetInput;

// signal that the passcode is incorrect
- (void)wrong;

// dismiss the view after a set delay
- (void)dismiss;

@end

@implementation GCPINViewController

@synthesize fieldOneLabel = __fieldOneLabel;
@synthesize fieldTwoLabel = __fieldTwoLabel;
@synthesize fieldThreeLabel = __fieldThreeLabel;
@synthesize fieldFourLabel = __fieldFourLabel;
@synthesize fieldFifthLabel = __fieldFifthLabel;
@synthesize fieldSeventhLabel = __fieldSeventhLabel;
@synthesize fieldSixthLabel = __fieldSixthLabel;

@synthesize messageLabel = __messageLabel;
@synthesize errorLabel = __errorLabel;
@synthesize inputField = __inputField;
@synthesize messageText = __messageText;
@synthesize errorText = __errorText;
@synthesize labels = __labels;
@synthesize mode = __mode;
@synthesize cPassCodes = __cPassCodes;
@synthesize text = __text;
@synthesize verifyBlock = __verifyBlock;

#pragma mark - object methods
- (id)initWithNibName:(NSString *)nib bundle:(NSBundle *)bundle mode:(GCPINViewControllerMode)mode {
    NSAssert(mode == GCPINViewControllerModeCreate ||
             mode == GCPINViewControllerModeVerify,
             @"Invalid passcode mode");
	if (self = [super initWithNibName:nib bundle:bundle]) {
        [[NSNotificationCenter defaultCenter]
         addObserver:self
         selector:@selector(textDidChange:)
         name:UITextFieldTextDidChangeNotification
         object:nil];
        self.mode = mode;
        __dismiss = NO;
	}
	return self;
}
- (void)dealloc {
    
    // clear notifs
	[[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:UITextFieldTextDidChangeNotification
     object:nil];
    
    // clear properties
    self.fieldOneLabel = nil;
    self.fieldTwoLabel = nil;
    self.fieldThreeLabel = nil;
    self.fieldFourLabel = nil;
    self.fieldFifthLabel = nil;
    self.messageLabel = nil;
    self.errorLabel = nil;
    self.inputField = nil;
    self.messageText = nil;
    self.errorText = nil;
    self.labels = nil;
    self.text = nil;
    self.verifyBlock = nil;
	
    // super
//    [super dealloc];
    
}
- (void)presentFromViewController:(UIViewController *)controller animated:(BOOL)animated {
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self];
//	[controller presentModalViewController:navController animated:animated];
    [controller presentViewController:navController animated:YES completion:^{}];
//	[navController release];
}
- (void)updatePasscodeDisplay {
    NSUInteger length = [self.inputField.text length];
    for (NSUInteger i = 0; i < 7; i++) {
        UILabel *label = [self.labels objectAtIndex:i];
        label.text = (i < length) ? @"●" : @"";
    }
}
- (void)resetInput {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, kGCPINViewControllerDelay * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^(void){
        self.inputField.text = @"";
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    });
}
- (void)wrong {
//    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    self.errorLabel.hidden = NO;
    self.text = nil;
    [self resetInput];
}
- (void)dismiss {
    [[UIApplication sharedApplication] beginIgnoringInteractionEvents];
    __dismiss = YES;
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, kGCPINViewControllerDelay * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^(void){
//        [self dismissModalViewControllerAnimated:YES];
        [self dismissViewControllerAnimated:YES completion:^{}];
        [[UIApplication sharedApplication] endIgnoringInteractionEvents];
    });
}

#pragma mark - view lifecycle
- (void)viewDidLoad {
	[super viewDidLoad];
[[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:NO];
    // setup labels list
    self.labels = [NSArray arrayWithObjects:
                   self.fieldOneLabel,
                   self.fieldTwoLabel,
                   self.fieldThreeLabel,
                   self.fieldFourLabel,
                   self.fieldFifthLabel,
                   self.fieldSixthLabel,
                   self.fieldSeventhLabel,
                   
                   nil];
    
    // setup labels
    self.messageLabel.text = self.messageText;
    self.errorLabel.text = self.errorText;
    self.errorLabel.hidden = YES;
	[self updatePasscodeDisplay];
    
	// setup input field
    self.inputField.hidden = YES;
    self.inputField.keyboardType = UIKeyboardTypeNumberPad;
    self.inputField.delegate = self;
    self.inputField.secureTextEntry = YES;
    self.inputField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.inputField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    [self.inputField becomeFirstResponder];
    
    self.cPassCodes = [NSArray arrayWithObjects:@"c111111",
                       @"c029345",
                       @"c286727",
                       @"c328439",
                       @"c428395",
                       @"c502957",
                       @"c610293",
                       @"c728394",
                       @"c820571",
                       @"c919283",
                       @"c103627",
                       @"c114472",
                       @"c123940",
                       @"c132738",
                       @"c141182",
                       @"c153456",
                       @"c160965",
                       @"c178734",
                       @"c182345",
                       @"c192378",
                       @"c209983",
                       nil];
    
	
}
- (void)viewDidUnload {
	[super viewDidUnload];
	self.fieldOneLabel = nil;
    self.fieldTwoLabel = nil;
    self.fieldThreeLabel = nil;
    self.fieldFourLabel = nil;
    self.fieldFifthLabel = nil;
    self.messageLabel = nil;
    self.errorLabel = nil;
    self.inputField = nil;
    self.labels = nil;
    self.text = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation {
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return UIInterfaceOrientationIsLandscape(orientation);
    }
    else {
        return (orientation == UIInterfaceOrientationPortrait);
    }
}

#pragma mark - overridden property accessors
- (void)setMessageText:(NSString *)text {
//    [__messageText release];
    __messageText = [text copy];
    self.messageLabel.text = __messageText;
}
- (void)setErrorText:(NSString *)text {
//	[__errorText release];
    __errorText = [text copy];
    self.errorLabel.text = __errorText;
}



#pragma mark - text field methods
- (void)textDidChange:(NSNotification *)notif {
    
    if ([notif object] == self.inputField) {
        
        if ([self.inputField.text length] == 1) {
            
            NSString* string = [NSString stringWithFormat:@"%@",self.inputField.text];
            NSCharacterSet *letters = [NSCharacterSet letterCharacterSet];
            if([letters characterIsMember:[string characterAtIndex:0]]) {
                // This is a letter
                
                NSLog(@"this is a letter");
                
            }else{
                
                NSLog(@"this is not a letter");
                [self resetInput];
                return;
                
            }
            
        }
        
        [self updatePasscodeDisplay];
        if ([self.inputField.text length] == 7) {
            
            NSString *passcode = self.inputField.text;
//            passcode = [passcode stringByReplacingCharactersInRange:range withString:string];
            
            if (self.mode == GCPINViewControllerModeCreate) {
                if (self.text == nil) {
                    self.text = self.inputField.text;
                    [self resetInput];
                    [self dismiss];
                    [self proccessPassword:self.text];
                }
                else {
                    if ([self.text isEqualToString:self.inputField.text] &&
                        self.verifyBlock(self.inputField.text)) {
                        [self dismiss];
                    }
                    else {
                        [self wrong];
                    }
                }
            }
            else if (self.mode == GCPINViewControllerModeVerify) {
               [self proccessPassword2:self.inputField.text];
            }
        }
    }
}

- (void)proccessPassword2:(NSString*)password
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    BOOL isAdmin;
    NSLog(@"processing");
    NSLog(@"%@", password);
    
    if ([password hasPrefix:@"a"])
    {
        isAdmin = YES;
        NSLog(@"launch admin part of the app");
        NSLog(@"%@",password);
        
        //check - for now against dummy code
       
        NSString *validCode =  @"a123232";
        if(![password isEqualToString:validCode]){
            
          
            
            UIAlertView *getEmailView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Wrong passcode", @"") message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [getEmailView setAlertViewStyle:UIAlertViewStyleDefault];
            [getEmailView show];
            
            
            
        }else{
            // we needto collect the email address and log it to a file someplace :-(
           /*
            OBSOLETE - SORRY
            
            UIAlertView *getEmailView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Enter your Email address", @"") message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:NSLocalizedString(@"OK", @""), nil];
            [getEmailView setAlertViewStyle:UIAlertViewStylePlainTextInput];
            [getEmailView show];
            */
            [appDelegate closeRootAndLaunchNextPart:isAdmin];
//            [self.inputField resignFirstResponder];
        }
        
        
        
    }
    else if ([password hasPrefix:@"c"])
    {
         NSLog(@"%@",password);
        bool enteredCorrectPassword = false;
        for(NSString *validPass in self.cPassCodes){
            if([validPass isEqualToString:password]){
                enteredCorrectPassword = true;
            }
        }

        if(enteredCorrectPassword){
            isAdmin = NO;
           
            NSLog(@"launch application procces c");
            [appDelegate closeRootAndLaunchNextPart:isAdmin];
            [self.inputField resignFirstResponder];
            [self.view endEditing:YES];
            appDelegate.currentUserCode=password;
            
        }else{
            NSLog(@"failed for C!");
            NSLog(@"so this is the failure area?");
            
            UIAlertView *getEmailView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Wrong passcode", @"") message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [getEmailView setAlertViewStyle:UIAlertViewStyleDefault];
            [getEmailView show];

        }

    }else{
        NSLog(@"so this is the failure area?");
      
        UIAlertView *getEmailView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Wrong Code", @"") message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [getEmailView setAlertViewStyle:UIAlertViewStyleDefault];
        [getEmailView show];
        
//        [appDelegate closeRootAndLaunchNextPart:isAdmin];
        
        
        
    }
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    //[[alertView textFieldAtIndex:0] resignFirstResponder];
    [self resetInput];
    for (NSUInteger i = 0; i < 7; i++) {
        UILabel *label = [self.labels objectAtIndex:i];
        label.text = @"";
    }
    self.labels = [NSArray arrayWithObjects:
                   self.fieldOneLabel,
                   self.fieldTwoLabel,
                   self.fieldThreeLabel,
                   self.fieldFourLabel,
                   self.fieldFifthLabel,
                   self.fieldSixthLabel,
                   self.fieldSeventhLabel,
                   
                   nil];
    
    // setup labels
    self.messageLabel.text = self.messageText;
    self.errorLabel.text = self.errorText;
    self.errorLabel.hidden = YES;
	[self.inputField becomeFirstResponder];
    
    

    
}

-(void) writeToTextFile:(NSString*)email{
    
    NSFileManager *filemgr;
    NSData *databuffer;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    
    filemgr = [NSFileManager defaultManager];
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    dataFile = [docsDir stringByAppendingPathComponent: @"emails.txt"];
    
    if ([filemgr fileExistsAtPath: dataFile]){
    
        NSData *dataToSave = [[NSString stringWithFormat:@"\n%@",email] dataUsingEncoding:NSUTF8StringEncoding];
        
        NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath: dataFile];
        [fh seekToEndOfFile];
        [fh writeData: dataToSave];
        
    }else{
        
        databuffer = [[NSString stringWithFormat:@"%@",email] dataUsingEncoding:NSUTF8StringEncoding];
        
        [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
        
    }

    
}

- (void)proccessPassword:(NSString*)password
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    BOOL isAdmin;
    NSLog(@"processing");
    if ([password hasPrefix:@"a"])
    {
        isAdmin = YES;
        NSLog(@"launch admin part of the app");
        NSLog(@"%@",password);
        
        //check - for now against dummy code
        NSString *validCode =  @"a111111";
        if(![password isEqualToString:validCode]){
            
         //   getEmailView.alertViewStyle=  UIAlertViewStylePlainTextInput;
          
            NSLog(@"failed!");
            
            
        }else{
            // we needto collect the email address and log it to a file someplace :-(
        
            UIAlertView *getEmailView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Enter your Email address", @"") message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:NSLocalizedString(@"OK", @""), nil];
            [getEmailView setAlertViewStyle:UIAlertViewStylePlainTextInput];
            [getEmailView show];
            
            [appDelegate closeRootAndLaunchNextPart:isAdmin];
            [self.inputField resignFirstResponder];
        }
        
       
        
    }
    else if ([password hasPrefix:@"c"])
    {
        bool enteredCorrectPassword = false;
        for(NSString *validPass in self.cPassCodes){
            if([validPass isEqualToString:password]){
                enteredCorrectPassword = true;
            }
        }
        if(enteredCorrectPassword){
            isAdmin = NO;
            NSLog(@"%@",password);
            NSLog(@"launch application procces");
            [appDelegate closeRootAndLaunchNextPart:isAdmin];
            [self.inputField resignFirstResponder];
            
        }else{
            NSLog(@"failed!");
            
        }
        
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([textField.text length] == 7 && [string length] > 0) {
        return NO;
    }
    else {
        self.errorLabel.hidden = YES;
        return YES;
    }
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
