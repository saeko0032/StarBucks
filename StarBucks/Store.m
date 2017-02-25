//
//  Store.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Store.h"

@implementation Store

- (id) initWithStoreParameters:(NSString*)name address:(NSString*)address phoneNumber:(NSString*)phoneNumber openingTime:(NSData*)openingTime closingTime:(NSData*)closingTime
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
@end
