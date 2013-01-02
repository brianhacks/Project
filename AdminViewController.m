//
//  AdminViewController.m
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/6/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "AdminViewController.h"
#import "sqlite3.h"
#import "Log.h"
#import "AppDelegate.h"
#import "NSData+CocoaDevUsersAdditions.h"
#import "User.h"

@interface AdminViewController (){
}

@end

@implementation AdminViewController
@synthesize managedObjectContext;
@synthesize totalApps;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *)getExportFileName {
    NSString *fileName = @"first";
    NSString *zippedName = [fileName stringByAppendingString:@".sbz"];
    return zippedName;
}

- (NSData *)exportToNSData {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:@"Private Documents"];
    
    NSError *error;
    [[NSFileManager defaultManager] createDirectoryAtPath:documentsDirectory withIntermediateDirectories:YES attributes:nil error:&error];

    
//    NSError *error;
    NSURL *url = [NSURL fileURLWithPath:documentsDirectory];
    NSFileWrapper *dirWrapper = [[NSFileWrapper alloc] initWithURL:url options:0 error:&error];
    if (dirWrapper == nil) {
        NSLog(@"Error creating directory wrapper: %@", error.localizedDescription);
        return nil;
    }
    
    NSData *dirData = [dirWrapper serializedRepresentation];
    NSData *gzData = [dirData gzipDeflate];
    return gzData;
}

- (BOOL)exportToDiskWithForce:(BOOL)force {
    
    
    // Figure out destination name (in public docs dir)
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *zippedName = [self getExportFileName];
    NSString *zippedPath = [documentsDirectory stringByAppendingPathComponent:zippedName];
    
    // Check if file already exists (unless we force the write)
    if (!force && [[NSFileManager defaultManager] fileExistsAtPath:zippedPath]) {
        return FALSE;
    }
    
    // Export to data buffer
    NSData *gzData = [self exportToNSData];
    if (gzData == nil) return FALSE;
    
    // Write to disk
    [gzData writeToFile:zippedPath atomically:YES];
    return TRUE;
    
}


/*
TO DO
 
1. Export Reports to device - make sure all data is wiped from dir before export
2. Fix graph to have normal coordinate labels

 
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Log" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"hour", @"count", nil];
    int i=0;
    for (NSManagedObject *info in fetchedObjects) {
        i++;
        NSLog(@"Name: %@", [info valueForKey:@"createdAt"]);
        NSString *key = [info valueForKey:@"createdAt"];
        
        int count;
        //Refactor me
        if ([data objectForKey:key]) {
            NSLog(@"There's an object set for key @\"b\"!");
            NSString *currentCount = [data valueForKey:key];
            int count = [currentCount intValue];
            count++;
        } else {
            NSLog(@"No object set for key @\"b\"");
            count = 1;
            
        }
       [data setObject:[NSString stringWithFormat:@"%d", count] forKey:key];
        
    }
    [self.totalApps setText:[NSString stringWithFormat:@"%d", i]];
   
    NSMutableArray *gData = [NSMutableArray array];
    for (NSString *key in data){
        id value = [data objectForKey:key];
        int y = [value intValue];
        int x = [key intValue];
        NSLog(@"----%d", x);

        [gData addObject:[NSValue valueWithCGPoint:CGPointMake(x, y)]];
    }
      
    self.scatterPlot = [[AdminGraph alloc] initWithHostingView:_graphHostingView andData:gData];
    [self.scatterPlot initialisePlot];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clearUserData:(id)sender {
//empty the database after an ok cancel prompt

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Delete all the records? This cannot be undone." message:@"Confirm Delete" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"DELETE",nil];
    [alert show];
    
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
        if (buttonIndex == 0) {
            NSLog(@"Cancel Tapped.");
        }
        else if (buttonIndex == 1) {
    
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
            NSManagedObjectContext *context = [appDelegate managedObjectContext];
            NSError *error;
            NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
            NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"User" inManagedObjectContext:context];
    
            [fetchRequest setEntity:entity];
            NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
            for (NSManagedObject *obj in fetchedObjects) {
                NSLog(@"found a record to delete!");
                [context deleteObject:obj];
              
                
            }
            if(![context save:&error])
            {
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            }
        
        }
}

- (User*)userRecord{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    self.userInfo = nil;
    
    NSManagedObjectContext* context = [appDelegate managedObjectContext];
    
    NSFetchRequest* request = [NSFetchRequest new];
    
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"User" inManagedObjectContext:context];
    [request setEntity:entity];
    
    NSError* error = nil;
    NSArray* fetchedResult = [context executeFetchRequest:request error:&error];
    
    
    if (![fetchedResult count] == 0) {
        
        self.userInfo = [fetchedResult objectAtIndex:0];
        
    }
    
    return self.userInfo;
    
}

-(void)exportLog{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Log" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
    for (NSManagedObject *info in fetchedObjects) {
        NSLog(@"Name: %@", [info valueForKey:@"createdAt"]);
        NSString *key = [info valueForKey:@"createdAt"];
        
        NSString *s_count = [[NSString alloc] init];
        int count;
        //Refactor me
        if ([data objectForKey:key]) {
            NSLog(@"There's an object set for key @\"b\"!");
            NSString *currentCount = [data valueForKey:key];
            int count = [currentCount intValue];
            count++;
        } else {
            NSLog(@"No object set for key @\"b\"");
            count = 1;
            
        }
        [data setObject:[NSString stringWithFormat:@"%d", count] forKey:key];
        
    }
    

   
    
    NSFileManager *filemgr;
    NSData *databuffer;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    
    filemgr = [NSFileManager defaultManager];
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    dataFile = [docsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"history.csv"]];
    
    if ([filemgr fileExistsAtPath: dataFile]){
            //delete me
    }
        
      //  NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath: dataFile];
    [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
    NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath: dataFile];
    
        for (NSString *key in data){
            id value = [data objectForKey:key];
            
            NSData *dataToSave = [[NSString stringWithFormat:@"%@,%@\n", key, value] dataUsingEncoding:NSUTF8StringEncoding];
            //write the data
            [fh writeData:dataToSave];
        }
        
        
        [fh seekToEndOfFile];
        
                               
    

    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Your data has been exported" message:@"Admin" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];

    
    
    
}

- (IBAction)exportData:(id)sender {
    //generate the stats file
    
    //save the log data first
    [self exportLog];
   // return;
    //generate each file for record in the DB
    
    User *info = [self userRecord];
    
    NSFileManager *filemgr;
    NSData *databuffer;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;
    
    filemgr = [NSFileManager defaultManager];
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];
    
    dataFile = [docsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%@.txt",info.firstName, info.lastName]];
    
    if ([filemgr fileExistsAtPath: dataFile]){
            
        NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath: dataFile];
        
        [fh seekToEndOfFile];
        NSData *dataToSave = [[NSString stringWithFormat:@"Credit Card type: %@ \nSpecial Offer Code: %@ \nMarketing Code: %@ \nResponse Channel: %@ \nTitle: %@ \nFirst Name: %@ \nLast Name: %@ \nGender: %@ \nDate Of Birth: %@ \nSocial Insurance Number: %@ \nPhone Number: %@ \nHome Address: %@ \nCity: %@ \nProvince: %@ \nPostal Code: %@ \nResidential Status: %@ \nLength of Residence: %@ \nPrevious Address: %@ \nCity: %@ \nProvince/State: %@ \nCountry: %@ \nPostal Code: %@ \nLength of Residence: %@ \nCredit Limit Request: %@ \nEmail Address: %@ \nPreferred Language: %@ \nTotal Monthly Housing Costs: %@ \nCurrent Employment Status: %@ \nName of Employer: %@ \nEmployer Address: %@ \Employer City: %@ \nEmployer Province: %@ \nEmployer Country:%@ \nEmployer Postal Code: %@ \nOccupation: %@ \nCurrent Business Phone Number: %@ \nExtension: %@ \nStart Date: %@ \nGross Annual Income: %@ \nTotal Household Income: %@ \nPickup Branch: %@ \nAre you an existing TD Canada Trust Customer:%@ \nDate: %@ \nTimestamp: %@" ,@"credid card selected", @"special offer code", @"marketing code", @"response channel", info.title, info.firstName, info.lastName, info.gender, info.birthDate, info.sin, info.primaryPhone, info.street, info.city, info.province, info.resincialStatus,@"lenght of residence", info.previousAddress, info.previousCity, info.previousProvince, @"previous country",info.postalCode, info.previousPostalCode, @"previous lenght of residence", info.requestedCreditLimit, info.email, info.languagOfCorespondace, info.monthlyHouseCosts, info.employmentStatus, info.employerName, info.employerStreetAddress, info.employerCity, info.employerProvince, info.employerCountry, @"employer postal code", info.currentOcupation, @"employer phone", @"emploeyr extension", info.startDateForWork, info.grossAnualIncome, info.householdIncome, @"branch", @"existing td customer", @"date", @"time stamp"] dataUsingEncoding:NSUTF8StringEncoding];
        [fh writeData: dataToSave];
        
        
    }else{
        
        databuffer = [[NSString stringWithFormat:@"Credit Card type: %@ \nSpecial Offer Code: %@ \nMarketing Code: %@ \nResponse Channel: %@ \nTitle: %@ \nFirst Name: %@ \nLast Name: %@ \nGender: %@ \nDate Of Birth: %@ \nSocial Insurance Number: %@ \nPhone Number: %@ \nHome Address: %@ \nCity: %@ \nProvince: %@ \nPostal Code: %@ \nResidential Status: %@ \nLength of Residence: %@ \nPrevious Address: %@ \nCity: %@ \nProvince/State: %@ \nCountry: %@ \nPostal Code: %@ \nLength of Residence: %@ \nCredit Limit Request: %@ \nEmail Address: %@ \nPreferred Language: %@ \nTotal Monthly Housing Costs: %@ \nCurrent Employment Status: %@ \nName of Employer: %@ \nEmployer Address: %@ \Employer City: %@ \nEmployer Province: %@ \nEmployer Country:%@ \nEmployer Postal Code: %@ \nOccupation: %@ \nCurrent Business Phone Number: %@ \nExtension: %@ \nStart Date: %@ \nGross Annual Income: %@ \nTotal Household Income: %@ \nPickup Branch: %@ \nAre you an existing TD Canada Trust Customer:%@ \nDate: %@ \nTimestamp: %@" ,@"credid card selected", @"special offer code", @"marketing code", @"response channel", info.title, info.firstName, info.lastName, info.gender, info.birthDate, info.sin, info.primaryPhone, info.street, info.city, info.province, info.resincialStatus,@"lenght of residence", info.previousAddress, info.previousCity, info.previousProvince, @"previous country",info.postalCode, info.previousPostalCode, @"previous lenght of residence", info.requestedCreditLimit, info.email, info.languagOfCorespondace, info.monthlyHouseCosts, info.employmentStatus, info.employerName, info.employerStreetAddress, info.employerCity, info.employerProvince, info.employerCountry, @"employer postal code", info.currentOcupation, @"employer phone", @"emploeyr extension", info.startDateForWork, info.grossAnualIncome, info.householdIncome, @"branch", @"existing td customer", @"date", @"time stamp"] dataUsingEncoding:NSUTF8StringEncoding];
        
        [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
        
        NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath: dataFile];
        [fh seekToEndOfFile];
        
    }
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sync" message:@"Your data has been exported.  Please sync via iTunes.  Delete your data once you confirm it has been received." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    [alert show];

    
    
}






@end
