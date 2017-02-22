//
//  Staff.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Staff.h"

@implementation Staff

- (void)takeOrder:(Customer*)customer {
    Barista* barista1 = [[Barista alloc] initWithName:@"AI"];
    [barista1 makeDrink:customer.order.coffee];
    
    NSInteger cost = [self caliculateCost:customer.order];
    NSInteger storedeMoney= customer.card.storedMoney;
    NSInteger restMoney = storedeMoney - cost;
    if(restMoney) {
        [customer.card updateMyInfo:restMoney extraStars:cost*2 uniquId:nil expiredDate:nil];
    }
}

- (id)initWithStaffInformation:(NSString*)name perHourWage:(NSInteger)perHourWage workingHours:(NSArray<NSDate*>*)workingHours workingDays:(NSArray<NSDate*>*)workingDays {
   
    self = [super init];
    
    if (self) {
        self.name = name;
        self.perHourWage = perHourWage;
        self.workingHours = workingHours;
        self.workingDays = workingDays;
    } else {
        return nil;
    }
    return self;
}

- (NSInteger)caliculateCost:(Order*)order {
    NSInteger cost = 0;
    if([order.coffee.size isEqualToString:@"Tall"]) {
        cost = order.amount * 3;
    } else if ([order.coffee.size isEqualToString:@"Small"]) {
        cost = order.amount * 2;
    } else {
        cost = order.amount * 4;
    }
    return cost;
}

@end
