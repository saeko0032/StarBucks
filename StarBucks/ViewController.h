//
//  ViewController.h
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"
#import "Customer.h"
#import "Staff.h"
#import "Coffee.h"
#import "Barista.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *orderButton;
@property (weak, nonatomic) IBOutlet UITextField *reloadMoney;
@property (weak, nonatomic) IBOutlet UIButton *reloadButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sizeSegment;
@property (weak, nonatomic) IBOutlet UIPickerView *amountPicker;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UILabel *starLabel;
@property (strong,nonatomic) NSString* size;
@property (nonatomic) NSInteger amount;
@end

