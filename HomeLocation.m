//
//  HomeLocation.m
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/9/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//
#import "HomeLocation.h"

@implementation HomeLocation

@synthesize coordinate, title, subtitle;

- (id)initWithLocation:(CLLocationCoordinate2D)coord{
    self = [super init];
    if (self) {
        coordinate = coord;
    }
    return self;
}

@end
