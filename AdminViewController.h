//
//  AdminViewController.h
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/6/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
#import "AdminGraph.h"
#import "User.h"

@interface AdminViewController : UIViewController {
    IBOutlet CPTGraphHostingView *_graphHostingView;
    AdminGraph *_scatterPlot;
}



@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) AdminGraph *scatterPlot;
@property (nonatomic, strong) User* userInfo;

- (IBAction)clearUserData:(id)sender;
- (IBAction)exportData:(id)sender;
- (void)exportLog;

- (NSString *)getExportFileName;
- (NSData *)exportToNSData;
- (BOOL)exportToDiskWithForce:(BOOL)force;
- (BOOL)importFromPath:(NSString *)importPath;

@end

