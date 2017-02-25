//
//  Staff.h
//  StarBucks
//
//  Created by AiYamamoto on 2017-02-23.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"
#import "Customer.h"


@class Barista;

@interface Staff : NSObject

@property (strong, nonatomic) NSString* name;
@property (nonatomic) NSInteger perHourWage;
@property (strong, nonatomic) NSArray<NSDate*> *workingHours;
@property (strong, nonatomic) NSArray<NSDate*> *workingDays;

- (id)initWithStaffParameters:(NSString*)name
                  perHourWage:(NSInteger)perHourWage
                 workingHours:(NSArray*)workingHours
                  workingDays:(NSArray*)workingDays;

- (void)takeOrder:(Customer*)customer;
- (NSInteger)calculatePrice:(Order*)order;
//- (void) makeDrink;

@end
