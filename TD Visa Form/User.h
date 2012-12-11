//
//  User.h
//  TD Visa Form
//
//  Created by Adrian Somesan on 11/28/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * card;
@property (nonatomic, retain) NSString * bankNumber;
@property (nonatomic, retain) NSDate * birthDate;
@property (nonatomic, retain) NSNumber * bankrupcy;
@property (nonatomic, retain) NSNumber * canadianResident;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * areaCode;
@property (nonatomic, retain) NSString * primaryPhone;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * gender;
@property (nonatomic, retain) NSString * languagOfCorespondace;
@property (nonatomic, retain) NSString * sin;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) NSString * postalCode;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * province;
@property (nonatomic, retain) NSDate * addressYearsAndMonths;
@property (nonatomic, retain) NSString * resincialStatus;
@property (nonatomic, retain) NSString * monthlyHouseCosts;
@property (nonatomic, retain) NSString * employmentStatus;
@property (nonatomic, retain) NSString * currentOcupation;
@property (nonatomic, retain) NSString * employerName;
@property (nonatomic, retain) NSDate * startDateForWork;
@property (nonatomic, retain) NSString * employerStreetAddress;
@property (nonatomic, retain) NSString * employerCountry;
@property (nonatomic, retain) NSString * employerProvince;
@property (nonatomic, retain) NSString * employerCity;
@property (nonatomic, retain) NSString * employerAreaCode;
@property (nonatomic, retain) NSString * workPhone;
@property (nonatomic, retain) NSString * requestedCreditLimit;
@property (nonatomic, retain) NSString * householdIncome;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * grossAnualIncome;

@end
