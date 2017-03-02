//
//  Products.m
//  StarBucks
//
//  Created by AiYamamoto on 2017-03-01.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Products.h"

@implementation Products

- (id)initWithProductsParameters:(NSString*)productsID productsName:(NSString*)productsName
{
    self = [super init];
    if(self)
    {
        self.productsID = productsID;
        self.productsName = productsName;
    }
    return self;
}

@end
