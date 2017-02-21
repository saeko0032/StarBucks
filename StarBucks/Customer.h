//
//  Customer.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Customer : NSObject

@property (strong, nonatomic) NSString* name;
@property (strong, nonatomic) NSString* cardLevel;
@property (strong, nonatomic) NSString* orderDate;

- (void)order;
- (void)pay;

@end
