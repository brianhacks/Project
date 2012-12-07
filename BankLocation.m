//
//  BankLocation.m
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/6/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import "BankLocation.h"
#import <AddressBook/AddressBook.h>


@implementation BankLocation
 
@synthesize name;
@synthesize address;
@synthesize branch ;
@synthesize coordinate;
@synthesize monday ;
@synthesize tuesday ;
@synthesize wednesday ;
@synthesize thursday ;
@synthesize friday ;
@synthesize saturday ;
@synthesize sunday ;


- (id)initWithName:(NSString*)name
           address:(NSString*)address
             title:(NSString*)title
          subTitle:(NSString*)subTitle
        coordinate:(CLLocationCoordinate2D)coordinate
            branch:(NSString *)branch
            monday:(NSString *)monday
           tuesday:(NSString *)tuesday
         wednesday:(NSString *)wednesday
          thursday:(NSString *)thursday
            friday:(NSString *)friday
          saturday:(NSString *)saturday
            sunday:(NSString *)sunday  {
    
    if ((self = [super init])) {
       
        self.name = _name;
        self.address = _address;
        self.monday = _monday;
        self.tuesday = _tuesday;
        self.wednesday = _wednesday;
        self.thursday = _thursday;
        self.friday = _friday;
        self.saturday = _saturday;
        self.sunday = _sunday;
        self.branch = _branch;
        self.coordinate = _coordinate;
    }
    return self;
}




@end
