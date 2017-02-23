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
    //calculate the date after 1 year
    NSDate *today = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *date = [[NSDateComponents alloc]init];
    date.year = 1;
    NSDate *myExpiredDate = [calendar dateByAddingComponents:date toDate:today options:0];
    
    NSLog(@"Start!!!!!\n");
    //NSDate *today = [[NSDate alloc] init];
    NSNumber *myUniqueID = [[NSNumber alloc] initWithInt:12345];
    NSInteger currentStars = 301;
    NSString *cardLevel;
    if (0<currentStars && currentStars<300) {
        cardLevel = @"green";
    } else {
        cardLevel = @"gold";
    }
    Card * card = [[Card alloc] initWithMyParameters:10.50 currentStars:currentStars uniquId:myUniqueID expiredDate:myExpiredDate cardLevel:cardLevel];
    Customer * ai = [[Customer alloc] initWithMyInformationPrameters:@"AI" card:card];
    
    Staff * staff1 = [[Staff alloc]initWithStaffParameters:@"staff1" perHourWage:10 workingHours:nil workingDays:nil];
   
    Coffee * coffee = [[Coffee alloc] initWithCoffeeParameters:@"Tall" addIns:nil serveOptions:nil shotOptions:nil flavours:nil toppings:nil];
    
    Order * order = [[Order alloc] initWithOrderPrameters:2 coffee:coffee];
    // SF20170222
    ai.order = order;
    ai.order.coffee = coffee;
    ai.card = card;
    
    [order printMyOrderInfo];
    [card printMyCardInfo];
    [staff1 takeOrder:ai];
    
    //Create the dateformatter object and set the required date format
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    //NSInteger price = [ai order:amount];//need to change
    //    [staff1 takeOrder:price card:card];
    
//    [ai.order takeOrder:ammout 2 coffee];
//    [ai order];
//    [ai.order coffee];
}

@end
