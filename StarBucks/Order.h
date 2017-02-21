//
//  Order.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coffee.h"

@interface Order : NSObject

@property (strong,nonatomic) Coffee* coffee;

@end
