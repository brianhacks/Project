
// Several authors. Based on code by Asynchrony Solutions.
// See http://stackoverflow.com/questions/8018841/customize-the-mkannotationview-callout/8019308#8019308

#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Annotation.h"
#import "Content.h"
#import "MyCalloutView.h"


/** 
 * Util methods. 
 * Not related to the creation of a custom callout. 
 */
@interface MapUtil : NSObject

+(double)CalculateDistance:(double)nLat1 nLon1:(double)nLon1 nLat2:(double)nLat2 nlon2:(double)nLon2 ;


+(MKCoordinateRegion) regionForAnnotations:(NSArray*) annotations;

+(NSArray*) createAnnotationsForRegion:(MKCoordinateRegion) region
                                 number:(const int) number;

+ (NSArray*) createAnnotationsForVisibleMap:(MKMapView*) mapView
                                     number:(const int) number;

@end
