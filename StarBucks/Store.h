//
//  Store.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Store : NSObject

@property (strong, nonatomic) NSString* address;
@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSNumber* phoneNumber;
@property (strong, nonatomic) NSArray<NSDate*> *openingHours;

@end
