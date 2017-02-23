//
//  Staff.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Staff.h"
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
    NSInteger price = [self caluculatePrice:customer.order];
    if(price < customer.card.storedMoney)
    {
        [self makeDrink];
        NSInteger currentStoredMoney = customer.card.storedMoney - price;
        NSInteger currentAddstars = price * 2;
        [customer.card updateMyInfo:currentStoredMoney addStars:currentAddstars expiredDate:[NSDate date]];
        [customer pay];
    }
    else
    {
       NSLog(@"\nYou need to reload amount!\n");
    }
}

- (NSInteger)caluculatePrice:(Order*)order//TODO: need to culculate DONE
{
    NSInteger price = 0;
    if([order.coffee.size isEqualToString: @"Tall"])
    {
        price = order.amount * 2;
    }
    if([order.coffee.size isEqualToString: @"Large"])
    {
        price = order.amount * 4;
    }
    return price;
}

- (void) makeDrink
{
    NSLog(@"Your order is ready");
}

// TODO:add initializer

// 年月日、時分秒を指定して日時オブジェクトを生成する
//NSCalendar *calendar = [NSCalendar currentCalendar];
//NSDateComponents *comps = [[NSDateComponents alloc] init];
//[comps setYear:2010];
//[comps setMonth:1];
//[comps setDay:2];
//[comps setHour:3];
//[comps setMinute:4];
//[comps setSecond:5];
//NSDate *date = [calendar dateFromComponents:comps];
//NSLog(@"date: %@", date); // => date: 2010-01-02 03:04:05 +0900

@end
