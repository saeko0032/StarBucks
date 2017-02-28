//
//  Card.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)initWithMyParameters:(float)storedMoney currentStars:(NSInteger)currentStars uniquId:(NSNumber*)uniquId expiredDate:(NSDate*)expiredDate cardLevel:(NSString*)cardLevel
{
    self = [super init];
    if(self)
    {
        self.storedMoney = storedMoney;
        self.currentStars = currentStars;
        self.uniqueId = uniquId;
        self.expiredDate = expiredDate;
        self.cardLevel = cardLevel;
    }
    return self;
}

- (void)updateMyInfo:(float)newStoredMoney addStars:(NSInteger)addStars Date:(NSDate *)currentDate
{
    NSString *cardLevel;
    self.expiredDate = [self myExpireDateCalculate:currentDate];
    self.storedMoney = newStoredMoney;
    self.currentStars = self.currentStars + addStars;
    if (0 < self.currentStars && self.currentStars < 300) {
        cardLevel = @"green";
    } else {
        cardLevel = @"gold";
    }
    self.cardLevel = cardLevel;
    [self printMyCardInfo];
}

- (void)printMyCardInfo
{
    NSLog(@"===================================\n");
    NSLog(@"\nYour card has been updatad.\n");
    NSLog(@"ID: %@\n",self.uniqueId);
    NSLog(@"Money: %.2f\n",self.storedMoney);
    NSLog(@"Star: %ld\n",(long)self.currentStars);
    NSLog(@"expiredDate: %@\n",self.expiredDate);
    NSLog(@"CardLevel: %@\n",self.cardLevel);
    NSLog(@"===================================\n");
}

- (NSDate*)myExpireDateCalculate:(NSDate*)currentPSTDate
{
    //for myExpiredDate tody's date + 1 year
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    dateComponents.year = 1;
    self.expiredDate = [calendar dateByAddingComponents:dateComponents toDate:currentPSTDate options:0];
    NSLog(@"My Starbacks card will expire %@.\n",self.expiredDate);
    return self.expiredDate;
}
@end
