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
        self.workingDays = workingDays;
    }
    return self;
}

- (void)takeOrder:(Customer*)customer date:currentDate
{
    Barista * barista = [[Barista alloc]initWithBaristaParameter:@"barista" perHourWage:20 workingHours:nil workingDays:nil baristaLevel:0];
    
    NSInteger price = [self calculatePrice:customer.order];
    if(price < customer.card.storedMoney)
    {
        [barista makeDrink];
        NSInteger currentStoredMoney = customer.card.storedMoney - price;
        NSInteger currentAddstars = price;
        [customer.card updateMyInfo:currentStoredMoney addStars:currentAddstars Date:currentDate];
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
    if(order.coffee) {
        if([order.coffee.size isEqualToString: @"Short"])
        {
            price = order.coffeeAmount * 2;
        }
        else if([order.coffee.size isEqualToString: @"Tall"])
        {
            price = order.coffeeAmount * 3;
        }
        else if([order.coffee.size isEqualToString: @"Grande"])
        {
            price = order.coffeeAmount * 4;
        }
        else
        {
            NSLog(@"Price calculate error!\n");
        }
    }
    if(order.food){
        NSString* foodName = order.food.productsName;
        if([foodName isEqualToString:@"Scone"]) {
            price += 1;
        } else if([foodName isEqualToString:@"Cookie"]) {
            price += 2;
        } else if([foodName isEqualToString:@"Muffin"]) {
            price += 3;
        }
    }
    return price;
}

//- (void) makeDrink
//{
//    NSLog(@"Your order is ready");
//}

@end
