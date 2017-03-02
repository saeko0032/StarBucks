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
@property (nonatomic) NSInteger openingTime;
@property (nonatomic) NSInteger closingTime;

@property (strong, nonatomic) Staff* staff;

- (id) initWithStoreParameters:(NSString*)name
                          address:(NSString*)adsress
                   phoneNumber:(NSString*)phoneNumber
                  openingTime:(NSInteger)openingTime
                  closingTime:(NSInteger)closingTime;

- (NSString*)openStore:(NSDateComponents*)localDate;

@end
