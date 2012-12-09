//
//  HomeLocation.h
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/9/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface HomeLocation : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString * title;
    NSString * subtitle;
}

- (id)initWithLocation:(CLLocationCoordinate2D)coord;
@end