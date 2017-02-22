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
        cardLevel = @"green";
    } else {
        cardLevel = @"gold";
    }
    Card * card = [[Card alloc] initWithMyParameters:10 currentStars:currentStars uniquId:myUniqueID expiredDate:today cardLevel:cardLevel];
    Customer *ai = [[Customer alloc] initWithMyInformationPrameters:@"AI" card:card];
    
    Staff *staff1 = [[Staff alloc]initWithStaffParameters:@"staff1" perHourWage:nil workingHours:nil workingDays:nil];
   
    Coffee* coffee = [[Coffee alloc] initWithCoffeeParameters:@"Tall" addIns:nil serveOptions:nil shotOptions:nil flavours:nil toppings:nil];
    
    NSLog(@"\n============\n");
    
    [staff1 takeOrder:ai];
    //NSInteger price = [ai order:amount];//need to change
    //    [staff1 takeOrder:price card:card];
    
//    [ai.order takeOrder:ammout 2 coffee];
//    [ai order];
//    [ai.order coffee];
}

@end
