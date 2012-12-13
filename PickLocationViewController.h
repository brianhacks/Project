//
//  PickLocationViewController.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Annotation.h"
#import "MapUtil.h"
#import "AnnotationView.h"
#import "AnnotationViewProtocol.h"
#import "AnnotationProtocol.h"
#import "MyCalloutView.h"
#import "HomeLocation.h"
#import "MainViewController.h"

 

#define METERS_PER_MILE 1609.344
//#define GMAP_ANNOTATION_SELECTED


@interface PickLocationViewController : MainViewController <UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate, UITextFieldDelegate>

@property (nonatomic, readwrite)BOOL clearUserDataFromTheApp;

@property (strong, nonatomic) UIImageView* sageataImage;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property ( nonatomic, retain) IBOutlet UITableView *tableView;

@property (strong, nonatomic) IBOutlet MyCalloutView *myCalloutView;
@property (strong, nonatomic) IBOutlet UITextField *query;
@property (strong, nonatomic) IBOutlet UIButton *nextStep;

 
- (IBAction)nextStep:(id)sender;
- (IBAction)previousStep:(id)sender;
- (IBAction)cancelMapAnnotationClicked:(id)sender;
- (IBAction)mapItemClicked:(id)sender;
- (IBAction)itemHighlighted:(id)sender;
- (IBAction)search:(id)sender;
- (void)useNotificationWithString:(NSNotification*)notification;
- (void)refresh;
- (IBAction)startOver:(id)sender;



@end
