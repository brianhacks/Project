//
//  Log.h
//  TD Visa Form
//
//  Created by MATTHEW KANTOR on 12/10/12.
//  Copyright (c) 2012 Adrian Somesan. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface Log : NSManagedObject

@property (nonatomic, retain) NSString *createdAt;

@property (nonatomic, retain) NSString *currentUserCode;


@end
