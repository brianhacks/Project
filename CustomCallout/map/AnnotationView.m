
// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308

#import "AnnotationView.h"
#import "Annotation.h"


@implementation AnnotationView

@synthesize calloutAnnotation = _calloutAnnotation;


// MKAnnotationView's initWithAnnotation:reuseIdentifier:
- (id)initWithAnnotation:(Annotation*)annotation 
         reuseIdentifier:(NSString *)reuseIdentifier 
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self!=nil){
        self.canShowCallout = NO;
        self.centerOffset = CGPointMake(10, -16);
        self.draggable = NO;
        //self.image = [UIImage imageNamed:@"emoji-ghost.png"];
        
        NSData *data = [NSData dataWithContentsOfURL:annotation.content.iconURL];
        self.image = [UIImage imageWithData:data];
        
    }
    return self;
}


// Calls initWithAnnotation:reuseIdentifier: with a default identifier.
- (id)initWithAnnotation:(Annotation*)annotation
{
    return [self initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
}


// MKAnnotationView's annotation property
- (void)setAnnotation:(id<MKAnnotation>)annotation
{
    if(self.calloutAnnotation) {
        [self.calloutAnnotation setCoordinate:annotation.coordinate];
    }    
    [super setAnnotation:annotation];
}


#pragma mark - AnnotationViewProtocol


/** Create and show the CalloutAnnotation that emulates the callout. */
- (void)didSelectAnnotationViewInMap:(MKMapView*) mapView;
{
    // hack that fixes bug in iOS 6 where an animation interrupts other animations
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, .1 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        Annotation *annotation = (Annotation*)self.annotation;
    
        CLLocationCoordinate2D coordinate = annotation.coordinate;
        CLLocationCoordinate2D newCenter; 
        newCenter.longitude = annotation.coordinate.longitude;
        newCenter.latitude = annotation.coordinate.latitude+0.04;
        MKCoordinateRegion region;
        MKCoordinateSpan span;
        span.latitudeDelta=0.1;
        span.longitudeDelta=0.1;
        region.span=span;
        region.center = newCenter;
    
        [mapView setRegion:region animated:TRUE];
       // CLLocationCoordinate2D newCenter = annotation.coordinate;
       // newCenter.longitude = newCenter.longitude - 0.0002;
    
        self.calloutAnnotation = [[CalloutAnnotation alloc] initWithContent:annotation.content];
        self.calloutAnnotation.parentAnnotationView = self;
        [mapView addAnnotation:self.calloutAnnotation];
     //   [mapView setCenterCoordinate:newCenter animated:true];
        
        
        
    });
}


/** Remove the CalloutAnnotation. */
- (void)didDeselectAnnotationViewInMap:(MKMapView*) mapView;
{
    [mapView removeAnnotation:self.calloutAnnotation];
    self.calloutAnnotation = nil;
}


@end
