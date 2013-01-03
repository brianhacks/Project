//
//  AdminViewController.h
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/6/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMTableView.h"
#import "User.h"

@interface AdminViewController : UIViewController <UMTableViewDelegate>

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, strong) User* userInfo;
@property (strong, nonatomic) IBOutlet UILabel *totalApps;

// grid view stuff

@property(nonatomic, strong) NSMutableArray* data;
@property(nonatomic, strong) NSMutableArray* headers;
//

- (IBAction)clearUserData:(id)sender;
- (IBAction)exportData:(id)sender;
- (void)exportLog;
- (IBAction)exitAdmin:(id)sender;

- (NSString *)getExportFileName;
- (NSData *)exportToNSData;
- (BOOL)exportToDiskWithForce:(BOOL)force;
- (BOOL)importFromPath:(NSString *)importPath;

@end

