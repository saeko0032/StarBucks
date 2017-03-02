//
//  Coffee.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Products.h"

@interface Coffee : Products

@property (strong, nonatomic) NSString* size;
@property (strong, nonatomic) NSString* addIns;
@property (strong, nonatomic) NSString* serveOptions;
@property (strong, nonatomic) NSString* shotOptions;
@property (strong, nonatomic) NSString* flavours;
@property (strong, nonatomic) NSString* toppings;

- (id)initWithProductsParameters:(NSString *)productsID
                    productsName:(NSString *)productsName
                        addIns:(NSString*)addIns
                  serveOptions:(NSString*)serveOptions
                   shotOptions:(NSString*)shotOptions
                      flavours:(NSString*)flavours
                      toppings:(NSString*)toppings;

@end
