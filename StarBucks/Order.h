//
//  Order.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coffee.h"
#import "Food.h"

@interface Order : NSObject

@property (nonatomic) NSInteger coffeeAmount;
@property (nonatomic) NSInteger foodAmount;
@property (strong, nonatomic) Coffee* coffee;
@property (strong, nonatomic) Food* food;


-(id)initWithOrderPrameters:(NSInteger)coffeeAmount
                     coffee:(Coffee *)coffee
                 foodAmount:(NSInteger)foodAmount
                       food:(Food*)food;

- (void)printMyOrderInfo;

@end
