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
@interface AdminViewController (){
}

@end

@implementation AdminViewController
@synthesize managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (IBAction)exportData:(id)sender {
    //generate the stats file
    
    //generate each file for record in the DB
    
}






@end
