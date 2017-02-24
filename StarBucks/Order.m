//
//  Order.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Order.h"

@implementation Order

-(id)initWithOrderPrameters:(NSInteger)amount coffee:(Coffee *)coffee
{
    self = [super init];
    if (self) {
        self.amount = amount;
        self.coffee = coffee;
    }
    return self;
}

- (void)printMyOrderInfo
{
    NSLog(@"\n===================================\n");
    NSLog(@"Your order is \n");
    NSLog(@"Amount: %ld\n",(long)self.amount);
    NSLog(@"Size: %@\n",self.coffee.size);
    NSLog(@"\n===================================\n");
}

@end
