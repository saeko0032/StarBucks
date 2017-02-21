//
//  Staff.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Order.h"
#import "Coffee.h"

@interface Staff : NSObject

@property (strong, nonatomic) NSString* name;
@property (nonatomic) NSInteger perHourWage;
@property (strong, nonatomic) NSArray<NSDate*> *workingHours;
@property (strong, nonatomic) NSArray<NSDate*> *workingDays;

@end
