//
//  PickLocationViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "PickLocationViewController.h"
#import "AppDelegate.h"
#import "BankLocation.h"

@implementation PickLocationViewController
{
    NSMutableArray *allBranches;
}
//@property (nonatomic, assign) NSMutableArray *allBranches;

@synthesize mapView;
//@synthesize allBranches;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    allBranches = [[NSMutableArray alloc] init ];
    return self;
}

- (void)viewDidLoad
{ 
    [super viewDidLoad];
}
- (void)viewWillAppear:(BOOL)animated{
    
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 43.734742;
    zoomLocation.longitude= -79.343888;

    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 3*METERS_PER_MILE, 3*METERS_PER_MILE);
    // 3
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];
    // 4
    [self.mapView setRegion:adjustedRegion animated:YES];
    // Do any additional setup after loading the view from its nib.
    //parse the JSON
    
    // 1
    
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
    
    
    MKCoordinateRegion mapRegion = [self.mapView region];
    CLLocationCoordinate2D centerLocation = mapRegion.center;
    
    // 2
    NSString *jsonFile = [[NSBundle mainBundle] pathForResource:@"branches" ofType:@"json"];
 
    
    NSError *error = nil; // This so that we can access the error if something goes wrong
   
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonFile options:NSDataReadingMappedIfSafe error:&error];
    
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:jsonData 
                          options:kNilOptions
                          error:&error];
    
    NSArray* allBranchesJSON = [json objectForKey:@"branches"]; //2
    
   // NSLog(@"length: %ld", sizeof(allBranchesJSON));
   
    NSMutableArray* myBranches = [[NSMutableArray alloc] initWithCapacity:sizeof(allBranchesJSON)];
   
    
    for (id<MKAnnotation> annotation in mapView.annotations) {
        [mapView removeAnnotation:annotation];
    }
    
    for (NSDictionary *branch in allBranchesJSON) {
        
         NSString* address = [branch objectForKey:@"address"];
       
        
        NSNumber *latitude = [branch objectForKey:@"lat"]; 
        NSNumber *longitude = [branch objectForKey:@"lng"]; 
        NSString *branchId = [branch objectForKey:@"branch"];
        NSString *name = [branch objectForKey:@"address"];
        NSString *monday = [branch objectForKey:@"monday"];
        NSString *tuesday = [branch objectForKey:@"tuesday"];
        NSString *wednesday = [branch objectForKey:@"wednesday"];
        NSString *thursday = [branch objectForKey:@"thursday"];
        NSString *friday = [branch objectForKey:@"friday"];
        NSString *saturday = [branch objectForKey:@"saturday"];
        NSString *sunday = [branch objectForKey:@"sunday"];
        NSString *province = [branch objectForKey:@"province"];
        NSString *title = [branch objectForKey:@"Branch"];
        NSString *subTitle = [branch objectForKey:@"address"];
        
         NSLog(@"address1: %@", address);
        
        CLLocationCoordinate2D coordinate;
        
        coordinate.latitude = latitude.doubleValue;
        coordinate.longitude = longitude.doubleValue;
        
        NSLog(@"first");
        BankLocation *location = [[BankLocation alloc] initWithName:title
                                                            address:address
                                                              title:title
                                                           subTitle:subTitle
                                                         coordinate:coordinate
                                                             branch:branchId
                                                             monday:monday
                                                            tuesday:tuesday
                                                          wednesday:wednesday
                                                           thursday:thursday
                                                             friday:friday
                                                           saturday:saturday
                                                             sunday:sunday ] ;
        location.name = address;
        location.address = address;
        location.title = address;
        location.subtitle = branchId;
        location.monday = monday;
        location.tuesday = tuesday;
        location.wednesday = wednesday;
        location.thursday = thursday;
        location.friday = friday;
        location.saturday = saturday;
        location.sunday = sunday;
        location.coordinate = coordinate;
        [self.mapView addAnnotation:location];
        [allBranches addObject:location];
  	}
 
    BankLocation *l = [allBranches objectAtIndex:0];
      
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *identifier = @"listTableCell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];

	if(cell == nil) {
		
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
		
	}
 
    NSUInteger row = [indexPath row];
    BankLocation *l = [allBranches objectAtIndex:row];
    NSString *zname = l.address;
    cell.textLabel.text = zname;
    
    
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView  {
    
	return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView  numberOfRowsInSection:(NSInteger)section {
    
    int count =  allBranches.count;
    return count;
}


- (IBAction)nextStep:(id)sender
{
}

- (IBAction)previousStep:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate backOneView];
    
}

- (IBAction)tableItemClicked:(id)sender
{

}
- (IBAction)mapItemClicked:(id)sender;
{}
- (IBAction)itemHighlighted:(id)sender;
{}
- (IBAction)searchMap:(id)sender;
{}


- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    
    static NSString *identifier = @"BankLocation";
    if ([annotation isKindOfClass:[BankLocation class]]) {
        
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *) [self.mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
        } else {
            annotationView.annotation = annotation;
        }
        
        annotationView.enabled = YES;
        annotationView.canShowCallout = YES;
        annotationView.image=[UIImage imageNamed:@"bank.png"];//here we use a nice image instead of the default pins
        
        return annotationView;
    }
    
    return nil;
}


- (void)refresh
{
       [self.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
