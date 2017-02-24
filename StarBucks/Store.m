//
//  Store.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Store.h"

@implementation Store

- (id) initWithStoreParameters:(NSString*)adsress name:(NSString*)name phoneNumber:(NSString*)phoneNumber openingHours:(NSArray<NSDate*>*)openingHours
{
    self = [super init];
    if(self)
    {
        self.name = name;
        self.phoneNumber = phoneNumber;
        self.openingHours = openingHours;
    }
    return self;
}

@end
