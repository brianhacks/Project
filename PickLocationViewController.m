//
//  PickLocationViewController.m
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/26/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "PickLocationViewController.h"
#import "AppDelegate.h"

/*
 
 TODO
 new icons
 fix close window reclick bug
 replace image for next button
 test next button
 remove old currentlocation pins
 scroll map list
 figure out days of week
 
 */

@implementation PickLocationViewController
{
    NSMutableArray *allBranches;
    CLLocationCoordinate2D homeLoc;
    NSString *activeBranchId;
    
}
//@property (nonatomic, assign) NSMutableArray *allBranches;

@synthesize mapView, myCalloutView, tableView;
//@synthesize allBranches;

@synthesize clearUserDataFromTheApp;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    allBranches = [[NSMutableArray alloc] init ];
    
    return self;
}

#pragma mark
#pragma mark viewDidLoad

- (void)viewDidLoad
{ 
    [super viewDidLoad];
    
    self.clearUserDataFromTheApp = NO;
    
    activeBranchId = @"0";
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
   
     
    NSString *notificationName = MAP_NOTIFIER_KEY ;
    
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(useNotificationWithString:) name:notificationName  object:nil];
     self.nextStep.enabled = YES;
    
    // get the users home address
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    User *u = [appDelegate  getUser];
    
    NSString *address = u.street;
    NSString *city = u.city;
    NSString *prov = u.province;
    NSString *query = [NSString stringWithFormat:@"%@ %@ %@", address, city, prov];
    //    NSString *query = [NSString stringWithFormat:@"London, Oxford Street 20"];
    //geocode the default based on the users home addresss
    //  appDelegate
    // CLLocationCoordinate2D zoomLocation;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
        if ([placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
            //            CLLocationCoordinate2D coordinate = location.coordinate;
            homeLoc = location.coordinate;
            
            MKCoordinateRegion region;
            MKCoordinateSpan span;
            span.latitudeDelta=0.1;
            span.longitudeDelta=0.1;
            region.span=span;
            region.center = location.coordinate;
            
            [self.mapView setRegion:region animated:TRUE];
            
            [self plotBanks];
            //need to refresh table
            [self.tableView reloadData];
            
        } else {
            homeLoc.latitude = 43.734742;
            homeLoc.longitude= -79.343888;
            [self plotBanks];
            [self.tableView reloadData];
            
            
        }}];
}
/*
 
 Receives message from the callout set up using MyCallOutView.  This gets around adding myCalloutView as a delegate, which could potentially be done soon wiht more time but this should work.
 
 */

- (void)useNotificationWithString:(NSNotification*)notification{
    //mark the table entry and scroll to it
    //enable the next button
    NSString *key = @"BranchId";
    NSDictionary *dictionary = [notification userInfo];
    NSString *branch = [dictionary valueForKey:key];
    activeBranchId=branch;
    [self markBranchAsSelected:branch];
    [self.tableView reloadData];
    
}

/* we have to do it this way which sucks, this whole thing is hacky */
-(void)markBranchAsSelected:(NSString*)branchId{
    int count = mapView.annotations.count;
    bool enableNextButton = false;
    for (int j=0; j<count-1; j++)  // use <= instead of + 1, it's more intuitive
    {
        Annotation *branch = [mapView.annotations objectAtIndex:j];
        
        //check to make sure its not the "curent location" pin
        if([branch respondsToSelector:@selector(setSelected:)]) {
           NSString *tbranch = [branch.content.values objectForKey:@"branchid"];
             if([tbranch isEqualToString:branchId]){
                 [branch setSelected:true];
                 branch.annotationView.image = [UIImage imageNamed:@"bank-selected.png"];
                 enableNextButton = true;
               
             }else{
                 if(branch.selected){
                    [branch setSelected:false];
                     branch.annotationView.image = [UIImage imageNamed:@"bank.png"];
 
                 }
             }
    
         }else{
             NSLog(@"found the home pin");
         }
    }
    if(enableNextButton){
        self.nextStep.enabled = YES;
    }else{
        self.nextStep.enabled = YES;
    }
}

/*
 Currently does nothing.
 */

- (void)refreshMap{
}


#pragma mark
#pragma mark view Will Appear
- (void)viewWillAppear:(BOOL)animated{
    
//    self.clearUserDataFromTheApp = NO;
    
    if (self.clearUserDataFromTheApp) {
        
        // get the users home address
        AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
        User *u = [appDelegate  getUser];
        
        NSString *address = u.street;
        NSString *city = u.city;
        NSString *prov = u.province;
        NSString *query = [NSString stringWithFormat:@"%@ %@ %@", address, city, prov];
        //    NSString *query = [NSString stringWithFormat:@"London, Oxford Street 20"];
        //geocode the default based on the users home addresss
        //  appDelegate
        // CLLocationCoordinate2D zoomLocation;
        
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
            if ([placemarks count] > 0) {
                CLPlacemark *placemark = [placemarks objectAtIndex:0];
                CLLocation *location = placemark.location;
                //            CLLocationCoordinate2D coordinate = location.coordinate;
                homeLoc = location.coordinate;
                
                MKCoordinateRegion region;
                MKCoordinateSpan span;
                span.latitudeDelta=0.1;
                span.longitudeDelta=0.1;
                region.span=span;
                region.center = location.coordinate;
                
                [self.mapView setRegion:region animated:TRUE];
                
                [self plotBanks];
                //need to refresh table
                [self.tableView reloadData];
                
            } else {
                homeLoc.latitude = 43.734742;
                homeLoc.longitude= -79.343888;
                [self plotBanks];
                [self.tableView reloadData];
                
                
            }}];
        
    }
    
}
- (void)recenterMap{
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(homeLoc, 3*METERS_PER_MILE, 3*METERS_PER_MILE);
    MKCoordinateRegion adjustedRegion = [mapView regionThatFits:viewRegion];
    [self.mapView setRegion:adjustedRegion animated:YES];
    //drop a pin there
    //and remove other pins
    HomeLocation *annot = [[HomeLocation alloc] initWithLocation:homeLoc];
   // annot.coordinate = homeLoc;
    
    [self.mapView addAnnotation:annot];
    
}

- (void)plotBanks
{
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"background.png"]];
    self.view.backgroundColor = background;
//    MKCoordinateRegion mapRegion = [self.mapView region];
    NSString *jsonFile = [[NSBundle mainBundle] pathForResource:@"branches_prod" ofType:@"json"];
    NSError *error = nil; // This so that we can access the error if something goes wrong
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonFile options:NSDataReadingMappedIfSafe error:&error];
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:jsonData 
                          options:kNilOptions
                          error:&error];
    
    NSArray* allBranchesJSON = [json objectForKey:@"branches"]; //2
   
    
    for (id<MKAnnotation> annotation in mapView.annotations) {
        [mapView removeAnnotation:annotation];
    }
    
    for (NSDictionary *branch in allBranchesJSON) {
       
        NSString* address = [branch objectForKey:@"address"];
       
        NSNumber *latitude = [branch objectForKey:@"lat"];
        NSNumber *longitude = [branch objectForKey:@"lon"]; 
        NSString *branchId = [branch objectForKey:@"Transit"];
        NSString *city = [branch objectForKey:@"city"];
        NSString *prov= [branch objectForKey:@"prov"];
        NSString *postal= [branch objectForKey:@"postal"];
        
        NSString *monday = [branch objectForKey:@"monday"];
        NSString *tuesday = [branch objectForKey:@"tuesday"];
        NSString *wednesday = [branch objectForKey:@"wednesday"];
        NSString *thursday = [branch objectForKey:@"thursday"];
        NSString *friday = [branch objectForKey:@"friday"];
        NSString *saturday = [branch objectForKey:@"saturday"];
        NSString *sunday = [branch objectForKey:@"sunday"];
        NSString *title = [branch objectForKey:@"Transit"];
       
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = latitude.doubleValue;
        coordinate.longitude = longitude.doubleValue;
        Content *content = [Content new];
        content.iconURL = [[NSBundle mainBundle] URLForResource:@"bank" withExtension:@"png"];
        content.calloutView  = [MyCalloutView class];
        content.coordinate = coordinate;
        
        content.values = [NSDictionary dictionaryWithObjectsAndKeys:address,@"address",
                                                                city,@"city",
                                                                prov,@"prov",
                                                             postal,@"postal",
                                                            branchId,@"branchid",
                                                              title,@"title",
                                                        //coordinate,@"coordinate",
                                                             monday,@"monday",
                                                            tuesday,@"tuesday",
                                                          wednesday,@"wednesday",
                                                           thursday,@"thursday",
                                                             friday,@"friday",
                                                           saturday,@"saturday",
                                                             sunday,@"sunday",
                          nil];
               
        Annotation *anno = [[Annotation alloc] initWithContent:content];
        
        
        //compute ditances
        double distance = [MapUtil CalculateDistance:coordinate.latitude nLon1:coordinate.longitude nLat2:homeLoc.latitude nlon2:homeLoc.longitude ];
        anno.distance = distance;
        anno.mapView = mapView;
        anno.selected = false;

        [allBranches addObject:anno];
  	}
    [self sortAnnotations];

    [self.mapView addAnnotations:allBranches];
    [self recenterMap];
      
}
- (void)recomputeDistances{
    for (Annotation *branch in allBranches){
        CLLocationCoordinate2D coordinate;
        coordinate = branch.coordinate;
        double distance = [MapUtil CalculateDistance:coordinate.latitude nLon1:coordinate.longitude nLat2:homeLoc.latitude nlon2:homeLoc.longitude ];
        branch.distance = distance;
    }
}
-(void)sortAnnotations{
    
    [allBranches sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
            Annotation *p1 = (Annotation*)obj1;
            Annotation *p2 = (Annotation*)obj2;
            
            if (p1.distance > p2.distance) {
                return (NSComparisonResult)NSOrderedDescending;
            }
            
            if (p1.distance < p2.distance) {
                return (NSComparisonResult)NSOrderedAscending;
            }
            return (NSComparisonResult)NSOrderedSame;
            
        }];
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
    NSString *zname = [l.content.values objectForKey:@"address"];
    NSString *zcity= [l.content.values objectForKey:@"city"];
    NSString *zprov= [l.content.values objectForKey:@"prov"];
    
    cell.textLabel.text = [[NSString stringWithFormat:@"%@ %@ %@", zname, zcity, zprov] capitalizedString];
    

    double distance = l.distance;
    NSString *distanceText = [NSString stringWithFormat:@"%.2f km", distance/0.62];
    cell.detailTextLabel.text = distanceText ;
    
    //image
    NSString *branchId = [l.content.values objectForKey:@"branchid"];
    if([branchId isEqualToString:activeBranchId]){
        cell.imageView.image = [UIImage imageNamed:@"bank-list-selected.png"];
       // cell.textLabel.text = @"ARGOFUCKYOURSELF";
       
    }else{
        cell.imageView.image = nil;
    }
       
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
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [appDelegate addInfoToUser:activeBranchId andFieldToAddItTo:@"bankNumber"];
    
    [appDelegate setNewRootView:appDelegate.reviewAndSubmitViewController];
   // [appDelegate.reviewAndSubmitViewController refresh];

    
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

//    UITextField
    //geocode the default based on the users home addresss
    NSString *query = self.query.text;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
        if ([placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
//            CLLocationCoordinate2D coordinate = location.coordinate;
            self->homeLoc = location.coordinate;
            [self recomputeDistances];
            [self sortAnnotations];
            //need to refresh table
            [self.tableView reloadData];
            [self recenterMap];
            
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

- (IBAction)startOver:(id)sender
{
    
    AppDelegate *appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    [appDelegate startOver];
    
    self.clearUserDataFromTheApp = YES;
    
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
       // NSLog(@"%@ conforms", NSStringFromClass([view class]));
        [((NSObject<AnnotationViewProtocol>*)view) didSelectAnnotationViewInMap:mapView];
    } else {
    //    NSLog(@"%@ DOES NOT conform", NSStringFromClass([view class]));
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
       
        // delegate the implementation to it
        return [((NSObject<AnnotationProtocol>*)annotation) annotationViewInMap:mapView];
        
    } else {
        
        static NSString *viewId = @"HOMEVIEW";
        MKPinAnnotationView *view = (MKPinAnnotationView*) [self.mapView dequeueReusableAnnotationViewWithIdentifier:viewId];
        if (view == nil) {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:viewId];
        }
        view.enabled = YES;
        view.canShowCallout = YES;
        view.pinColor =MKPinAnnotationColorPurple;
    
        return view;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    NSString *query = self.query.text;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:query completionHandler:^(NSArray *placemarks, NSError *error){
        if ([placemarks count] > 0) {
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            CLLocation *location = placemark.location;
            //            CLLocationCoordinate2D coordinate = location.coordinate;
            self->homeLoc = location.coordinate;
            [self recomputeDistances];
            [self sortAnnotations];
            //need to refresh table
            [self.tableView reloadData];
            [self recenterMap];
            
        } else {
            UIAlertView* alerView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Your address could not be found." delegate:self cancelButtonTitle:@"OKAY" otherButtonTitles:nil];
            [alerView show];
            
        }}];
    
    return YES;
}



@end
