//
//  Barista.m
//  StarBucks
//
//  Created by AiYamamoto on 2017-02-23.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Staff.h"
#import "Barista.h"

@implementation Barista
- (id)initWithBaristaParameter:(NSString*)name perHourWage:(NSInteger)perHourWage workingHours:(NSArray*)workingHours workingDays:(NSArray*)workingDays baristaLevel:(NSInteger)baristaLevel
{
    self = [super initWithStaffParameters:name perHourWage:perHourWage workingHours:workingHours workingDays:workingDays];
    if(self)
    {
        self.baristaLevel = baristaLevel;
    }
    return self;
}

- (void)makeDrink
{
    NSLog(@"Your drink is ready!!!");
}
@end
