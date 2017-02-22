//
//  Starbucks.m
//  StarBucks
//
//  Created by saekof on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Starbucks.h"

@implementation Starbucks

//- (Barista*)callBarista {
//    Barista* barista = [[Barista alloc] init];
//    return barista;
//}

    //TODO: change date from today to next year
- (void)startWithThisFunction
{
    NSDate *today = [[NSDate alloc] init];
    NSNumber *myUniqueID = [[NSNumber alloc] initWithInt:12345];
    NSInteger currentStars = 10;
    NSString *cardLevel;
    if (0<currentStars && currentStars<300) {
        cardLevel = @"Green";
    } else {
        cardLevel = @"Gold";
    }
    Card * card = [[Card alloc] initWithMyParameters:10 currentStars:currentStars uniquId:myUniqueID expiredDate:today cardLevel:cardLevel];
    Customer *ai = [[Customer alloc] initWithMyInformationPrameters:@"AI" card:card];
    
    Coffee* coffee = [[Coffee alloc] initWithCoffeeParameters:@"Tall" addIns:nil serveOptions:nil shotOptions:nil flavours:nil toppings:nil];
    
    // 2 cups of coffee
    [ai.order changeAmout:2];
    ai.order.coffee = coffee;
    
    Staff* staff = [[Staff alloc] initWithStaffInformation:@"AI" perHourWage:12 workingHours:nil workingDays:nil];
    [staff takeOrder:ai];
}

@end
