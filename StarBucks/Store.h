//
//  Store.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Staff.h"

@interface Store : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* address;
@property (strong, nonatomic) NSString* phoneNumber;
//@property (strong, nonatomic) NSArray<NSDate*>* openingHours;
@property (strong, nonatomic) NSData* openingTime;
@property (strong, nonatomic) NSData* closingTime;
@property (strong, nonatomic) Staff* staff;

- (id) initWithStoreParameters:(NSString*)name
                          address:(NSString*)adsress
                   phoneNumber:(NSString*)phoneNumber
                  openingTime:(NSData*)openingTime
                  closingTime:(NSData*)closingTime;
@end
