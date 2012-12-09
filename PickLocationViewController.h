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


#define METERS_PER_MILE 1609.344
//#define GMAP_ANNOTATION_SELECTED
@interface PickLocationViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, MKMapViewDelegate>

@property (strong, nonatomic) UIImageView* sageataImage;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@property (strong, nonatomic) IBOutlet UITableView *tableView;


 
- (IBAction)nextStep:(id)sender;
- (IBAction)previousStep:(id)sender;
- (IBAction)cancelMapAnnotationClicked:(id)sender;
- (IBAction)mapItemClicked:(id)sender;
- (IBAction)itemHighlighted:(id)sender;
- (IBAction)searchMap:(id)sender;
- (void)refresh;



@end
