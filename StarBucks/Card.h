//
//  Card.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic) float storedMoney;
@property (nonatomic) NSInteger currentStars;
@property (strong, nonatomic) NSNumber* uniqueId;
@property (strong, nonatomic) NSDate* expiredDate;
@property (strong, nonatomic) NSString* cardLevel;

- (id)initWithMyParameters:(float)storedMoney
              currentStars:(NSInteger)currentStars
                   uniquId:(NSNumber*)uniquId
               expiredDate:(NSDate*)expiredDate
                 cardLevel:(NSString*)cardLevel;

- (void)updateMyInfo:(float)newStoredMoney addStars:(NSInteger)addStars expiredDate:(NSDate*)expiredDate;
- (void)printMyCardInfo;

@end
