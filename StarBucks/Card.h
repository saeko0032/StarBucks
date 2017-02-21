//
//  Card.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic) NSInteger storedMoney;
@property (nonatomic) NSInteger stars;
@property (strong, nonatomic) NSNumber* uniqueId;
@property (strong, nonatomic) NSDate* expiredDate;

- (id)initWithMyParameters:(NSInteger)storedMoney currentStars:(NSInteger)currentStars uniquId:(NSNumber*)uniquId expiredDate:(NSDate*)expiredDate;

- (id)updateMyInfo:(NSInteger)storedMoney extraStars:(NSInteger)extraStars uniquId:(NSNumber*)uniquId expiredDate:(NSDate*)expiredDate;

@end
