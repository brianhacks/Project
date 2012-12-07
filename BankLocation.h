//
//  BankLocation.h
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/6/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface BankLocation : NSObject<MKAnnotation>{
    
    NSString *_name;
    NSString *_address;
    CLLocationCoordinate2D _coordinate;
    NSString *_branch;
   
    NSString *_monday;
    NSString *_tuesday;
    NSString *_wednesday;
    NSString *_thursday;
    NSString *_friday;
    NSString *_saturday;
    NSString *_sunday;

    
}


@property (copy) NSString *name;
@property (copy) NSString *address;
@property (nonatomic, assign) NSString *title;
@property (nonatomic, assign) NSString *subtitle;

@property (nonatomic, assign) NSString *branch; //use this is a the ID
@property ( nonatomic, assign) NSString *phone;
@property (nonatomic, assign) NSString *monday;
@property ( nonatomic, assign) NSString *tuesday;
@property (nonatomic, assign) NSString *wednesday;
@property ( nonatomic, assign) NSString *thursday;
@property ( nonatomic, assign) NSString *friday;
@property (nonatomic, assign) NSString *saturday;
@property (nonatomic, assign) NSString *sunday;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;




- (id)initWithName:(NSString*)name
           address:(NSString*)address
             title:(NSString*)title
          subTitle:(NSString*)subTitle
        coordinate:(CLLocationCoordinate2D)coordinate
            branch:(NSString*)branch
            monday:(NSString*)monday
           tuesday:(NSString*)tuesday
         wednesday:(NSString*)wednesday
          thursday:(NSString*)thursday
            friday:(NSString*)friday
          saturday:(NSString*)saturday
            sunday:(NSString*)sunday;


@end
