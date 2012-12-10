//
//  AdminViewController.h
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/6/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CorePlot-CocoaTouch.h"
@interface AdminViewController : UIViewController <CPTPlotDataSource, UIActionSheetDelegate>
{
    CPTXYGraph *graph;
}
- (IBAction)clearUserData:(id)sender;
- (IBAction)exportData:(id)sender;

-(void)initPlot;
-(void)configureHost;
-(void)configureGraph;
-(void)configureChart;
-(void)configureLegend;

@end

