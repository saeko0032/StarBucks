//
//  Card.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id)initWithMyParameters:(NSInteger)storedMoney currentStars:(NSInteger)currentStars uniquId:(NSNumber*)uniquId expiredDate:(NSDate*)expiredDate cardLevel:(NSString*)cardLevel
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

- (void)updateMyInfo:(NSInteger)newStoredMoney addStars:(NSInteger)addStars expiredDate:(NSDate *)expiredDate
{
    
    NSString *cardLevel;
    
    self.storedMoney = newStoredMoney;
    self.currentStars = self.currentStars + addStars;
    self.expiredDate = expiredDate;//TODO: Change to 1 year later?
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
    NSLog(@"\n===================================\n");
    NSLog(@"\nYour card has been updatad.\n");
    NSLog(@"ID: %@\n",self.uniqueId);
    NSLog(@"Money: %ld\n",(long)self.storedMoney);
    NSLog(@"Star: %ld\n",(long)self.currentStars);
    NSLog(@"expiredDate: %ld\n",(long)self.expiredDate);
    NSLog(@"CardLevel: %@\n",self.cardLevel);
    NSLog(@"\n===================================\n");
}

@end
