//
//  Store.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Store.h"

@implementation Store

- (id) initWithStoreParameters:(NSString*)name address:(NSString*)address phoneNumber:(NSString*)phoneNumber openingTime:(NSInteger)openingTime closingTime:(NSInteger)closingTime
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.address = address;
        self.phoneNumber = phoneNumber;
        self.openingTime = openingTime;
        self.closingTime = closingTime;
    }
    return self;
}

- (NSString*)openStore:(NSDateComponents*)localDate
{
    Store * storeA = [[Store alloc] initWithStoreParameters:@"storeA" address:nil phoneNumber:nil openingTime:5 closingTime:12];
    Store * storeB = [[Store alloc] initWithStoreParameters:@"storeB" address:nil phoneNumber:nil openingTime:12 closingTime:22];
    NSString* tempString = @"";
    
    //prioritize StoreA
    if(storeA.openingTime <= localDate.hour && localDate.hour < storeA.closingTime)
    {
        NSLog(@"StoreA open!\n");
        tempString =  @"StoreA";
    }
    else if(storeB.openingTime <= localDate.hour && localDate.hour < storeB.closingTime)
    {
        NSLog(@"StoreB open!\n");
        tempString =  @"StoreB";
    }
    else{
        tempString =  @"Closed";
    }
    return tempString;
}

@end
