//
//  Barista.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "Staff.h"
#import "Coffee.h"

@interface Barista : NSObject

- (void)makeDrink:(Coffee*) coffee;

- (id)initWithName:(NSString*)name;

@end
