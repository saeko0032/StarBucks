//
//  Products.h
//  StarBucks
//
//  Created by AiYamamoto on 2017-03-01.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Products : NSObject

@property (strong, nonatomic) NSString * productsID;
@property (strong, nonatomic) NSString * productsName;

- (id)initWithProductsParameters:(NSString*)productsID
                    productsName:(NSString*)productsName;

@end
