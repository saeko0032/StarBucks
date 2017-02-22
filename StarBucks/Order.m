//
//  Order.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Order.h"

@implementation Order

- (NSInteger)changeAmout:(NSInteger)amount {
    self.amount = amount;
    return self.amount;
}

@end
