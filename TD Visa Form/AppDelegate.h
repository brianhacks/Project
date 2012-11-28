//
//  AppDelegate.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/13/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirstScreenSaverViewController.h"
#import "RootViewController.h"
#import "UserFormViewController.h"
#import "AppProcessViewController.h"
#import "ModalViewController.h"
#import "GCPINViewController.h"
#import "GettingStartedViewController.h"
#import "PersonalInfoViewController.h"
#import "FinancialInfoViewController.h"
#import "PickLocationViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) FirstScreenSaverViewController* firstScreenSaverViewController;
@property (nonatomic, strong) RootViewController* rootViewController;
@property (nonatomic, strong) UserFormViewController* userFormViewController;
@property (nonatomic, strong) AppProcessViewController* appProcessViewController;
@property (nonatomic, strong) ModalViewController* modalViewController;
@property (nonatomic, strong) GCPINViewController* gCPINViewController;
@property (nonatomic, strong) GettingStartedViewController* gettingStartedViewController;
@property (nonatomic, strong) PersonalInfoViewController* personalInfoViewController;
@property (nonatomic, strong) FinancialInfoViewController* financialInfoViewController;
@property (nonatomic, strong) PickLocationViewController* pickLocationViewController;
@property (nonatomic, strong) UINavigationController *navController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
- (void)closeRootAndLaunchNextPart:(BOOL)isAdmin;
- (void)setNewRootView:(UIViewController *)controller;
- (void)backOneView;

- (void)addInfoToUser:(id)info andFieldToAddItTo:(NSString *)_field;
- (void)addBOOLInfoToUser:(BOOL)info andFieldToAddItTo:(NSString *)_field;

@end
