//
//  Order.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Order.h"

@implementation Order

-(id)initWithOrderPrameters:(NSInteger)coffeeAmount coffee:(Coffee *)coffee foodAmount:(NSInteger)foodAmount food:(Food*)food
{
    self = [super init];
    if (self) {
        self.coffeeAmount = coffeeAmount;
        self.coffee = coffee;
        self.foodAmount = foodAmount;
        self.food = food;
    }
    return self;
}

- (void)printMyOrderInfo
{
    NSLog(@"\n===================================\n");
    NSLog(@"Your order is \n");
    NSLog(@"coffeeAmount: %ld\n",(long)self.coffeeAmount);
    NSLog(@"Size: %@\n",self.coffee.size);
    NSLog(@"\n===================================\n");
}

@end
