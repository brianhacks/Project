//
//  AdminGraph.h
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/10/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CorePlot-CocoaTouch.h"

@interface AdminGraph : NSObject  {
    CPTGraphHostingView *_hostingView;
    CPTXYGraph *_graph;
    NSMutableArray *_graphData;
}

@property (nonatomic, retain) CPTGraphHostingView *hostingView;
@property (nonatomic, retain) CPTXYGraph *graph;
@property (nonatomic, retain) NSMutableArray *graphData;

// Method to create this object and attach it to it's hosting view.
-(id)initWithHostingView:(CPTGraphHostingView *)hostingView andData:(NSMutableArray *)data;

// Specific code that creates the scatter plot.
-(void)initialisePlot;

@end
