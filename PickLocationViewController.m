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

- (void)refreshMap{
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self plotBanks];
    
}
- (void)plotBanks
{
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

 //HAVERSINE DISTANCE COMPUTATION - JAVASCRIPT
    int R = 6371; // km
   // double lat1rad = DEG2RAD(lat1);
    //double lat2rad = DEG2RAD(lat2);
    // apply the spherical law of cosines to our latitudes and longitudes, and set the result appropriately
    // 6378.1 is the approximate radius of the earth in kilometres
   //  acos(sin(lat1rad) * sin(lat2rad) + cos(lat1rad) * cos(lat2rad) * cos(deg2rad(lon2) - deg2rad(lon1))) * 6378.1);

  
    

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
- (IBAction)searchMap:(id)sender;
{
    
    //can we figure out proximity and resort the list?
//center the location in the middle
    //can we only show items that are on the screen?
}


- (MKAnnotationView *)mapView:(MKMapView *)zmapView viewForAnnotation:(id <MKAnnotation>)annotation {
    NSLog(@"ANNOTATE!");
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

/*
- (void)setAnnotation:(id <MKAnnotation>)annotation {
    [super setAnnotation:annotation];
    [self prepareFrameSize];
    [self prepareOffset];
    [self setNeedsDisplay];
}

- (void)prepareFrameSize {
    CGRect frame = self.frame;
    CGFloat height =    self.contentHeight +
    CalloutMapAnnotationViewContentHeightBuffer +
    CalloutMapAnnotationViewBottomShadowBufferSize -
    self.offsetFromParent.y;
    
    frame.size = CGSizeMake(self.mapView.frame.size.width, height);
    self.frame = frame;
}

- (void)prepareOffset {
    CGPoint parentOrigin = [self.mapView
                            convertPoint:self.parentAnnotationView.frame.origin
                            fromView:self.parentAnnotationView.superview];
    
    CGFloat xOffset =   (self.mapView.frame.size.width / 2) -(parentOrigin.x + self.offsetFromParent.x);
    
    //Add half our height plus half of the height of the annotation we are tied to so that our bottom lines up to its top
    //Then take into account its offset and the extra space needed for our drop shadow
    CGFloat yOffset = -(self.frame.size.height / 2 +
                        self.parentAnnotationView.frame.size.height / 2) +
    self.offsetFromParent.y +
    CalloutMapAnnotationViewBottomShadowBufferSize;
    
    self.centerOffset = CGPointMake(xOffset, yOffset);
}

*/

@end
