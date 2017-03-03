//
//  Coffee.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Coffee.h"

@implementation Coffee

- (id)initWithProductsParameters:(NSString *)productsID productsName:(NSString *)productsName size:(NSString *)size addIns:(NSString *)addIns serveOptions:(NSString *)serveOptions shotOptions:(NSString *)shotOptions flavours:(NSString *)flavours toppings:(NSString *)toppings
{
    self = [super init];
    if (self) {
        self.size = size;
        self.addIns = addIns;
        self.serveOptions = serveOptions;
        self.shotOptions = shotOptions;
        self.flavours = flavours;
        self.toppings = toppings;
    } else {
        return nil;
    }
    return self;
}

@end
