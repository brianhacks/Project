//
//  AppDelegate.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/13/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstScreenSaverViewController.h"
#import "RootViewController.h"
#import "UserFormViewController.h"
#import "AppProcessViewController.h"
#import "ModalViewController.h"
#import "PersonalInfoViewController.h"
#import "FinancialInfoViewController.h"
#import "PickLocationViewController.h"
#import "User.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopScreenSaverAndAddRootView) name:@"StopScreenSaver" object:nil];
    
    self.firstScreenSaverViewController = [[FirstScreenSaverViewController alloc] initWithNibName:@"FirstScreenSaverViewController" bundle:nil];
    self.rootViewController = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:nil];
    self.userFormViewController = [[UserFormViewController alloc] initWithNibName:@"UserFormViewController" bundle:nil];
    self.rootViewController.delegate = self.userFormViewController;
    self.appProcessViewController = [[AppProcessViewController alloc] initWithNibName:@"AppProcessViewController" bundle:nil];
    self.modalViewController = [[ModalViewController alloc] initWithNibName:@"ModalViewController" bundle:nil];
    self.gettingStartedViewController = [[GettingStartedViewController alloc] initWithNibName:@"GettingStartedViewController" bundle:nil];
    self.personalInfoViewController = [[PersonalInfoViewController alloc] initWithNibName:@"PersonalInfoViewController" bundle:nil];
    self.financialInfoViewController = [[FinancialInfoViewController alloc] initWithNibName:@"FinancialInfoViewController" bundle:nil];
    self.pickLocationViewController = [[PickLocationViewController alloc] initWithNibName:@"PickLocationViewController" bundle:nil];
    
    self.gCPINViewController = [[GCPINViewController alloc] initWithNibName:@"GCPINViewController" bundle:nil mode:GCPINViewControllerModeCreate];
    
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.appProcessViewController];
    [self.navController setNavigationBarHidden:YES animated:YES];
    
    NSManagedObjectContext* context = [self managedObjectContext];
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:nil];
    

//    NSError* error = nil;
//    NSArray* fetchedResult = [context executeFetchRequest:fetchRequest error:&error];
    

//for debug mode only
    self.window.rootViewController = self.navController;
   
 
//    self.window.rootViewController = self.firstScreenSaverViewController;

   
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)addInfoToUser:(id)info andFieldToAddItTo:(NSString *)_field
{
    
    User* userInfo = nil;
    
    NSString* field = [NSString stringWithFormat:@"%@",_field];
    
    NSManagedObjectContext* context = [self managedObjectContext];
    
    NSFetchRequest* request = [NSFetchRequest new];
//    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"firstName = %@", _firstName];
//    [request setPredicate:predicate];
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSError* error = nil;
    NSArray* fetchedResult = [context executeFetchRequest:request error:&error];
    
    if ([fetchedResult count] == 0) {
        
        userInfo = [[User alloc] initWithEntity:[NSEntityDescription entityForName:@"User" inManagedObjectContext:[self managedObjectContext]] insertIntoManagedObjectContext:[self managedObjectContext]];
        
    }else{
        
        userInfo = [fetchedResult objectAtIndex:0];
        
    }
    [userInfo setValue:info forKey:field];
    
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
}

- (void)addBOOLInfoToUser:(BOOL)info andFieldToAddItTo:(NSString *)_field
{
    
    User* userInfo = nil;
    
    NSString* field = [NSString stringWithFormat:@"%@",_field];
    
    NSManagedObjectContext* context = [self managedObjectContext];
    
    NSFetchRequest* request = [NSFetchRequest new];
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSArray *fetchedObjects = [context executeFetchRequest:request error:nil];
    
    NSError* error = nil;
    
    if ([fetchedObjects count] == 0) {
        
        userInfo = [[User alloc] initWithEntity:[NSEntityDescription entityForName:@"User" inManagedObjectContext:[self managedObjectContext]] insertIntoManagedObjectContext:[self managedObjectContext]];
        
    }else{
        
        userInfo = [fetchedObjects objectAtIndex:0];
        
    }
    
    if (info) {
    
        [userInfo setValue:[NSNumber numberWithBool:YES] forKey:field];
        
    }else
    {
        [userInfo setValue:[NSNumber numberWithBool:NO] forKey:field];
        
    }
    
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
    
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
}

- (void)insertUserWithFirstName:(NSString *)_firstName andLastName:(NSString *)_lastName andDateOfBirth:(NSString *)_dateOfBirth{
    
    NSManagedObjectContext* context = [self managedObjectContext];
    
    NSFetchRequest* request = [NSFetchRequest new];
    NSPredicate *predicate =[NSPredicate predicateWithFormat:@"firstName = %@", _firstName];
    [request setPredicate:predicate];
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSError* error = nil;
//    NSArray* fetchedResult = [context executeFetchRequest:request error:&error];
    
    User* userInfo = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [userInfo setValue:[NSString stringWithFormat:@"%@",_firstName] forKey:@"firstName"];
    [userInfo setValue:[NSString stringWithFormat:@"%@",_lastName] forKey:@"lastName"];
    [userInfo setValue:[NSString stringWithFormat:@"%@",_dateOfBirth] forKey:@"dateOfBirth"];
    
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
        
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
}

- (void)stopScreenSaverAndAddRootView
{
    self.window.rootViewController = self.gCPINViewController;
    
}

- (void)backOneView
{
    
    [self.navController popViewControllerAnimated:YES];
}

- (void)setNewRootView:(UIViewController *)controller
{
    [self.navController pushViewController:controller animated:YES];
//    [self.window.rootViewController.navigationController pushViewController:controller animated:YES];
    
}

- (void)closeRootAndLaunchNextPart:(BOOL)isAdmin
{
    
    if (isAdmin)
    {
        
    }
    else
    {
        
//        self.navController = [[UINavigationController alloc] initWithRootViewController:self.appProcessViewController];
//        [self.navController setNavigationBarHidden:YES animated:YES];
//        self.window.rootViewController = self.navController;
        
        self.window.rootViewController = self.appProcessViewController;
        
    }
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"TD_Visa_Form" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"TD_Visa_Form.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
