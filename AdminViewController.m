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
/*
 OK so
 
 loop through all the records
 for each record create a dict entry
 date-userid : count
 
 increment count over time
 
 */
@implementation AdminViewController
int numGridRows;
int numGridColumns;
NSMutableArray *rowLabels;
NSMutableArray *colLabels;
NSMutableDictionary *entries;

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
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    [appDelegate addEntriesToLog];
    
    CGRect frm = CGRectMake(350, 100, 650, 510);
    UMTableView* tableView = [[UMTableView alloc] initWithFrame: frm];
    tableView.tableViewDelegate = self;
    [self.view addSubview:tableView];
    
   rowLabels = [NSArray arrayWithObjects:@"c111111",
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
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self computeGrid];
         
 
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
        
        //self.userInfo = [fetchedResult objectAtIndex:0];
        
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
    
    
    
    for (NSManagedObject *info in fetchedObjects) {
       
        NSString *key = [info valueForKey:@"createdAt"];
        NSString *key2 = [info valueForKey:@"currentUserCode"];
        
        
        NSString *s_count = [[NSString alloc] init];
        //        split the string here
        NSArray *tmpArr = [key componentsSeparatedByString:@"|"];
        NSData *dataToSave = [[NSString stringWithFormat:@"%@,%@,%@\n", tmpArr[0], tmpArr[1], key2] dataUsingEncoding:NSUTF8StringEncoding];
        //write the data
        [fh writeData:dataToSave];
        
    }
    
    [fh seekToEndOfFile];
    
}

- (IBAction)exitAdmin:(id)sender {
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    appDelegate.window.rootViewController = appDelegate.firstScreenSaverViewController;
    
}

- (IBAction)exportData:(id)sender {
    //generate the stats file
    
    //save the log data first
    [self exportLog];
 
    
    NSFileManager *filemgr;
    NSData *databuffer;
    NSString *dataFile;
    NSString *docsDir;
    NSArray *dirPaths;

    
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    filemgr = [NSFileManager defaultManager];
    
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    docsDir = [dirPaths objectAtIndex:0];

    
    if ([fetchedObjects count] == 0) {
        
        NSLog(@"No User Records Found");
        
    }else{
        //loop
        for (User *info in fetchedObjects) {
            NSLog(@"Exporting user %@",info.referenceNumber);
              
            dataFile = [docsDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.txt", info.referenceNumber]];
            NSData *dataToSave  = [[NSString stringWithFormat:@"title: \t%@\nbirthDate: \t%@\nbankrupcy: \tNo\ncanadianResident: \tYes\nfirstName: \t%@\nlastName: \t%@\nareaCode: \t%@\nprimaryPhonePrefix: \t%@\nprimaryPhone: \t%@\nreferenceNumber: \t%@\npreviousAddress: \t%@\npreviousCity: \t%@\npreviousProvince: \t%@\npreviousPostalCode: \t%@\npreviousAddressYearsAndMonths: \t%@\nemail: \t%@\ngender: \t%@\nlanguagOfCorespondace: \t%@\nsin: \t%@\nstreet: \t%@\npostalCode: \t%@\ncity: \t%@\nprovince: \t%@\nemployerWorkPrefix: \t%@\naddressYearsAndMonths: \t%@\nresincialStatus: \t%@\nmonthlyHouseCosts: \t%@\nemploymentStatus: \t%@\ncurrentOcupation: \t%@\nemployerName: \t%@\nstartDateForWork: \t%@\nemployerStreetAddress: \t%@\nemployerCountry: \t%@\nemployerProvince: \t%@\nemployerCity: \t%@\nemployerAreaCode: \t%@\nworkPhone: \t%@\nrequestedCreditLimit: \t%@\nhouseholdIncome: \t%@\ngrossAnualIncome: \t%@\ncurrentIndustry: \t%@\npreviousPreviousPostaCode: \t%@\npreviousPreviousAddress: \t%@\npreviousPreviousCity: \t%@\npreviousPreviousProvince: \t%@\npreviousPreviousAddressYearsAndMonths: \t%@\n",
            info.title,
            info.birthDate,
            info.firstName,
            info.lastName,
            info.areaCode,
            info.primaryPhonePrefix,
            info.primaryPhone,
            info.referenceNumber,
            info.previousAddress,
            info.previousCity,
            info.previousProvince,
            info.previousPostalCode,
            info.previousAddressYearsAndMonths,
            info.email,
            info.gender,
            info.languagOfCorespondace,
            info.sin,
            info.street,
            info.postalCode,
            info.city,
            info.province,
            info.employerWorkPrefix,
            info.addressYearsAndMonths,
            info.resincialStatus,
            info.monthlyHouseCosts,
            info.employmentStatus,
            info.currentOcupation,
            info.employerName,
            info.startDateForWork,
            info.employerStreetAddress,
            info.employerCountry,
            info.employerProvince,
            info.employerCity,
            info.employerAreaCode,
            info.workPhone,
            info.requestedCreditLimit,
            info.householdIncome,
            info.grossAnualIncome,
            info.currentIndustry,
            info.previousPreviousPostaCode,
            info.previousPreviousAddress,
            info.previousPreviousCity,
            info.previousPreviousProvince,
                                  info.previousPreviousAddressYearsAndMonths ]dataUsingEncoding:NSUTF8StringEncoding];
            [filemgr createFileAtPath: dataFile contents: databuffer attributes:nil];
            NSFileHandle *fh = [NSFileHandle fileHandleForWritingAtPath: dataFile];
            [fh writeData: dataToSave];
            [fh seekToEndOfFile];
            [fh closeFile];
             NSLog(@"Done exporting");
       
        }
        
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sync" message:@"Your data has been exported.  Please sync via iTunes.  Delete your data once you confirm it has been received." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    [alert show];
    NSLog(@"Do I get here?");
}





    




- (int) rowHeight {
    return 38;
}


- (int) numColumns {
    return colLabels.count+1;
}

- (int) numRows {
    return 20;
}



- (int) fixedWidthForColumn: (int) columnIndex {
    if (columnIndex == 0) {
        return 100;
    }
    else {
        return 80;
    }
}


- (Boolean) hasColumnFixedWidth: (int) columnIndex {
	return YES;
}


- (UIColor*) borderColor {
	return [UIColor whiteColor];
}

-(void)computeGrid{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSError *error;
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Log" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    self.totalApps.text =  [NSString stringWithFormat:@"%d",  fetchedObjects.count];
  //  NSMutableArray *coldata = [[NSMutableArray alloc] init];
    int i=0;
    
    colLabels = [[NSMutableArray alloc] init];
    
    for (NSManagedObject *info in fetchedObjects) {
        i++;
        bool hasCol = false;
        NSString *cols = [info valueForKey:@"createdAt"];
        
        if([colLabels indexOfObject:cols]!=NSNotFound){
        
                hasCol = true;
            
        }
        if(!hasCol){
            [colLabels addObject:cols];
             NSLog(@"%@", cols);
        }
       

        
    }

    
    
    entries = [[NSMutableDictionary alloc] init];
    NSString *entryCount;
    for (NSManagedObject *info in fetchedObjects) {
        NSString *cols = [info valueForKey:@"createdAt"];
        NSString *rows = [info valueForKey:@"currentUserCode"];
        NSString *key = [NSString stringWithFormat:@"%@-%@",cols, rows];
        NSString *currentEntry;
        if([entries valueForKey:key]==nil){
            currentEntry=@"";
        }else{
             currentEntry = [entries valueForKey:key];
        }
        
        NSString *newVal = [NSString stringWithFormat:@"%@1",currentEntry];
        [entries setObject:newVal forKey:key];
    }
    
    
    
   
    numGridRows = 20;

}

- (void)layoutView: (UMCellView*) cellView forRow: (int) row inColumn: (int) column {
    
    // customize header row
	if (row == 0) {
        if (column==0){
             cellView.label.text =@"";
        }else{
            cellView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue-gradient.png"]];
            cellView.label.font = [UIFont boldSystemFontOfSize:12];
           // cellView.label.textColor = [UIColor whiteColor];
            NSString *colLab = [colLabels objectAtIndex:column-1];
            NSArray *labelArr = [colLab componentsSeparatedByString:@"|"];
            cellView.label.text = [NSString stringWithFormat:@"%@\n%@", labelArr[0], labelArr[1]];
            
        }
        
	}
    
    // all other rows
	else {
        if (column==0){
            cellView.label.text =[rowLabels objectAtIndex:row];
        }else{
        
            cellView.backgroundColor = [UIColor lightGrayColor];
            cellView.label.textColor = [UIColor colorWithWhite:0.1 alpha:1.0];
            cellView.label.font = [UIFont boldSystemFontOfSize:12];
            
            NSString *rowId = [rowLabels objectAtIndex:row];
             NSString *colId = [colLabels objectAtIndex:column-1];
            
            NSString *key = [NSString stringWithFormat:@"%@-%@",colId, rowId];
            
            
            //lets do a function here
            //count the number of occurrences in the array where row and column match
            // NSMutableDuctionary : date + "-"+userid : count
            
            NSString *entry = [entries objectForKey:key];
            
            cellView.label.text = [NSString stringWithFormat:@"%u", entry.length]; //[[data objectAtIndex:row] objectAtIndex:column];
            
            cellView.label.numberOfLines = 2;
        
            if ([cellView.label.text hasPrefix:@"Column:"]) {
             //   cellView.backgroundColor = [UIColor whiteColor];
            }
        }
        
	}
    cellView.label.textAlignment = UITextAlignmentCenter;
}


/// UTILITY DELETE


- (void) headerTapped: (UIGestureRecognizer*) recognizer {
    
}
- (void) cellTouched: (UITapGestureRecognizer*) recognizer {

}





@end
