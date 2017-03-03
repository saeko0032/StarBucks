//
//  Barista.h
//  StarBucks
//
//  Created by AiYamamoto on 2017-02-23.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Staff.h"

@interface Barista : Staff

@property (nonatomic)NSInteger baristaLevel;

- (id)initWithBaristaParameter:(NSString*)name perHourWage:(NSInteger)perHourWage workingHours:(NSArray*)workingHours workingDays:(NSArray*)workingDays baristaLevel:(NSInteger)baristaLevel;
- (void)makeDrink;

@end
