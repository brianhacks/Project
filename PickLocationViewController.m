//
//  PickLocationViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "PickLocationViewController.h"
#import "AppDelegate.h"


@implementation PickLocationViewController
{
    NSMutableArray *allBranches;
    CLLocationCoordinate2D homeLoc;
    
}
//@property (nonatomic, assign) NSMutableArray *allBranches;

@synthesize mapView, myCalloutView, tableView;
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
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
   
     
    NSString *notificationName = MAP_NOTIFIER_KEY ;
    
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(useNotificationWithString:) name:notificationName  object:nil];
    
}
/*
 
 Receives message from the callout set up using MyCallOutView.  This gets around adding myCalloutView as a delegate, which could potentially be done soon wiht more time but this should work.
 
 */

- (void)useNotificationWithString:(NSNotification*)notification{
    //select the item  - change the icon
    //mark the table entry and scroll to it
    //enable the next button
    NSString *key = @"BranchId";
    NSDictionary *dictionary = [notification userInfo];
    NSString *stringValueToUse = [dictionary valueForKey:key];
    //find the row based on the branch id
 //   self.tableView scrollToRowAtIndexPath:<#(NSIndexPath *)#> atScrollPosition:<#(UITableViewScrollPosition)#> animated:true
    
    
    
}
/*
 Currently does nothing.
 */

- (void)refreshMap{
}

- (void)viewWillAppear:(BOOL)animated{
    
    //geocode the default based on the users home addresss
    
   // CLLocationCoordinate2D zoomLocation;
    homeLoc.latitude = 43.734742;
    homeLoc.longitude= -79.343888;
    
    
    [self plotBanks];
    
}
- (void)plotBanks
{
    
       //get the users address or search term
    
    //dont forget to compute the distances between top one and each pin

    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(homeLoc, 3*METERS_PER_MILE, 3*METERS_PER_MILE);
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
        
        Content *content = [Content new];
        content.iconURL = [[NSBundle mainBundle] URLForResource:@"bank" withExtension:@"png"];
        content.calloutView  = [MyCalloutView class];
        content.coordinate = coordinate;
        content.values = [NSDictionary dictionaryWithObjectsAndKeys:subTitle,@"title",
                                                            address,@"address",
                                                              title,@"title",
                                                           subTitle,@"subTitle",
                                                         coordinate,@"coordinate",
                                                             branch,@"branchId",
                                                             monday,@"monday",
                                                            tuesday,@"tuesday",
                                                          wednesday,@"wednesday",
                                                           thursday,@"thursday",
                                                             friday,@"friday",
                                                           saturday,@"saturday",
                                                             sunday,@"sunday",
                          nil];
        //compute ditances
        double bankLat = coordinate.latitude;
        double bankLon = coordinate.longitude;
        double homeLat = homeLoc.latitude;
        double homeLon = homeLoc.longitude;
        
        double distance = [MapUtil CalculateDistance:bankLat nLon1:bankLon nLat2:homeLat nlon2:homeLon ];
        
        
        Annotation *anno = [[Annotation alloc] initWithContent:content];
        
        anno.distance = distance;
        anno.mapView = mapView;

       
        //[self.mapView addAnnotation:location];
        [allBranches addObject:anno];
  	}
    [self.mapView addAnnotations:allBranches];
 
  
  
      
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *identifier = @"listTableCell";
    
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];

	if(cell == nil) {
		
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
 
    NSUInteger row = [indexPath row];
    Annotation *l = [allBranches objectAtIndex:row];
    NSString *zname = [l.content.values objectForKey:@"title"];
    cell.textLabel.text = zname;
    

    double distance = l.distance;
    NSString *distanceText = [NSString stringWithFormat:@"%.2f km", distance/0.62];
    cell.detailTextLabel.text = distanceText ;
    
    
    
      
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

- (IBAction)cancelMapAnnotationClicked:(id)sender
{
    //close the overlay and destroy
}
- (IBAction)mapItemClicked:(id)sender;
{
   //do popupView
       
       
}
- (IBAction)itemHighlighted:(id)sender;
{
  //map pin to side bar and hgihlight star
    //also unhighlight other stars

}

- (IBAction)search:(id)sender {

    
    //geocode the default based on the users home addresss
    NSString *query = self.query.text;
    
   // [MapUtil geocode:query];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
        if ([placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
            CLLocationCoordinate2D coordinate = location.coordinate;
            self->homeLoc = location.coordinate;
            [self plotBanks];
            
        } else {
            UIAlertView* alerView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Your address could not be found." delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles:nil];
            [alerView show];
        
        }}];
    
    
       //can we figure out proximity and resort the list?
//center the location in the middle
    //can we only show items that are on the screen?
}


- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
 
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

- (void)mapView:(MKMapView *)aMapView didSelectAnnotationView:(MKAnnotationView *)view
{
   
    // delegate the implementation to the annotation view
    if ([view conformsToProtocol:@protocol(AnnotationViewProtocol)]) {
        NSLog(@"%@ conforms", NSStringFromClass([view class]));
        [((NSObject<AnnotationViewProtocol>*)view) didSelectAnnotationViewInMap:mapView];
    } else {
        NSLog(@"%@ DOES NOT conform", NSStringFromClass([view class]));
    }
}


/**
 * Delegates the DESELECTION to the view implementation.
 */
- (void)mapView:(MKMapView *)aMapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    // delegate the implementation to the annotation view
    if ([view conformsToProtocol:@protocol(AnnotationViewProtocol)]) {
        [((NSObject<AnnotationViewProtocol>*)view) didDeselectAnnotationViewInMap:mapView];
    }
}


/**
 * Delegates CREATION of the view to the annotation.
 *
 * If the annotation doesn't conform to AnnotationProtocol,
 * a standard MKPinAnnotationView is returned.
 */
- (MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id<MKAnnotation>)annotation
{
   
    // if this is a custom annotation
    if ([annotation conformsToProtocol:@protocol(AnnotationProtocol)]) {
        NSLog(@"1");
        // delegate the implementation to it
        return [((NSObject<AnnotationProtocol>*)annotation) annotationViewInMap:mapView];
        
    } else {
         NSLog(@"0");
        // else, return a standard annotation view
        static NSString *viewId = @"MKPinAnnotationView";
        MKAnnotationView *view = (MKPinAnnotationView*) [self.mapView dequeueReusableAnnotationViewWithIdentifier:viewId];
        if (view == nil) {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:viewId];
        }
        view.enabled = YES;
        view.canShowCallout = YES;

        
        return view;
    }
}



@end
