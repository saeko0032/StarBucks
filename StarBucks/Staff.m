//
//  Staff.m
//  StarBucks
//
//  Created by AiYamamoto on 2017-02-23.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Staff.h"

#import "Barista.h"

@implementation Staff

- (id)initWithStaffParameters:(NSString*)name perHourWage:(NSInteger)perHourWage workingHours:(NSArray*)workingHours workingDays:(NSArray*)workingDays
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.perHourWage = perHourWage;
        self.workingHours = workingHours;
        self. workingDays = workingDays;
    }
    return self;
}

-(void)takeOrder:(Customer*)customer
{
    Barista * barista = [[Barista alloc]initWithStaffParameters:@"barista1" perHourWage:20 workingHours:nil workingDays:nil];
    
    NSInteger price = [self calculatePrice:customer.order];
    if(price < customer.card.storedMoney)
    {
        [barista makeDrink];
        NSInteger currentStoredMoney = customer.card.storedMoney - price;
        NSInteger currentAddstars = price;
        [customer.card updateMyInfo:currentStoredMoney addStars:currentAddstars expiredDate:[NSDate date]];
        [customer pay];
    }
    else
    {
        NSLog(@"You need to reload amount!\n");
    }
}

- (NSInteger)calculatePrice:(Order*)order
{
    NSInteger price = 0;
    if([order.coffee.size isEqualToString: @"Short"])
    {
        price = order.amount * 2;
    }
    else if([order.coffee.size isEqualToString: @"Tall"])
    {
        price = order.amount * 3;
    }
    else if([order.coffee.size isEqualToString: @"Grande"])
    {
        price = order.amount * 4;
    }
    else
    {
        NSLog(@"Price calculate error!\n");
    }
    return price;
}

//- (void) makeDrink
//{
//    NSLog(@"Your order is ready");
//}

@end
