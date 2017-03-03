//
//  ViewController.m
//  StarBucks
//
//  Created by saeko fukui on 2017-02-20.
//  Copyright © 2017 Saeko Fukui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) Customer* customer;
@property (strong, nonatomic) Card* card;
@property (strong, nonatomic) NSDateComponents *localDate;
@property (strong, nonatomic) NSDate *currentDate;
@property (strong, nonatomic) Store *storeA;
@property (strong, nonatomic) Store *storeB;
@property (strong, nonatomic) NSDate *myExpiredDate;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // check my Card status
    NSNumber *myUniqueID = [[NSNumber alloc] initWithInt:12345];
    NSInteger currentStars = self.starLabel.text.integerValue;
    NSString *cardLevel;
    if (0 < currentStars && currentStars < 300) {
        cardLevel = @"Green";
    } else {
        cardLevel = @"Gold";
    }
    Card * card = [[Card alloc] initWithMyParameters:self.moneyLabel.text.floatValue currentStars:currentStars uniquId:myUniqueID expiredDate:self.myExpiredDate cardLevel:cardLevel];
    self.card = card;
    
    // initialize segment Value
    self.foodName = @"Muffin";
    self.size = @"Tall";
    
    // check available Store by checking time
    self.currentDate = [self getDate];
    Store * store = [[Store alloc]init];
    NSString *availableStore = [store openStore:self.localDate];
    self.storeLabel.text = availableStore;
    
    // create customer by avobe information
    Customer * customer = [[Customer alloc] initWithMyInformationPrameters:@"AI" card:card];
    self.customer = customer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reloadMoneyFromButton:(id)sender {
    float reloadMoney = self.reloadMoney.text.floatValue;
    [self.customer reloadStoredMoney:reloadMoney];
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f", self.customer.card.storedMoney];
    //self.starLabel.text = [NSString stringWithFormat:@"%ld", self.customer.card.currentStars];
    self.reloadMoney.text = @"";
    NSLog(@"Reloaded!\n");
}

- (IBAction)segmentFoodChanged:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    if (selectedSegment == 0) {
        self.foodName = @"Scone";
    }
    else if (selectedSegment == 1) {
        self.foodName = @"Muffin";
    } else if (selectedSegment == 2) {
        self.foodName = @"Cookie";
    }
}

- (IBAction)segmentValueChanged:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
        if (selectedSegment == 0) {
            // short
            self.size = @"Short";
        }
        else if (selectedSegment == 1) {
            // tall
            self.size = @"Tall";
        } else if (selectedSegment == 2) {
            // grande
            self.size = @"Grande";
        }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = nil;
    switch(row) {
        case 0:
            title = @"1";
            self.coffeeAmount = 1;
            break;
        case 1:
            title = @"2";
            self.coffeeAmount = 2;
            break;
        case 2:
            title = @"3";
            self.coffeeAmount = 3;
            break;
        case 3:
            title = @"4";
            self.coffeeAmount = 4;
            break;
        case 4:
            title = @"5";
            self.coffeeAmount = 5;
            break;
        case 5:
            title = @"6";
            self.coffeeAmount = 6;
            break;
        case 6:
            title = @"7";
            self.coffeeAmount = 7;
            break;
        case 7:
            title = @"8";
            self.coffeeAmount = 8;
            break;
        case 8:
            title = @"9";
            self.coffeeAmount = 9;
            break;
        case 9:
            title = @"10";
            self.coffeeAmount = 10;
            break;
    }
    return title;
}

- (NSDate*)getDate
{
    NSDate* date = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSUInteger flg = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
    | NSCalendarUnitHour | NSCalendarUnitMinute;
    
    NSTimeZone* worldTimeZone = [NSTimeZone timeZoneWithName:@"PST"];
    
    NSDateFormatter *dateFormatter1 = [[NSDateFormatter alloc] init];
    [dateFormatter1 setTimeZone:worldTimeZone];
    [dateFormatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *currentPSTDateString = [dateFormatter1 stringFromDate:date];
    
    
    //NSString to NSDate
    NSDateFormatter* dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //for timezone
    [dateFormatter2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    NSDate *currentPSTDate = [dateFormatter2 dateFromString:currentPSTDateString];
    
    NSDateComponents* worldTime = [calendar components:flg fromDate:date];
    
    self.localDate = worldTime;
    
    return currentPSTDate;
}

- (IBAction)getOrderFromButton:(id)sender {
    
    NSMutableArray <Products*>* orderArray = [[NSMutableArray alloc]init];
    
    Staff * staff = [[Staff alloc]initWithStaffParameters:@"staff1" perHourWage:10 workingHours:nil workingDays:nil];

    Coffee * coffee = [[Coffee alloc] initWithProductsParameters:@"123" productsName:@"coffee" size:self.size addIns:nil serveOptions:nil shotOptions:nil flavours:nil toppings:nil];

    Food * food = [[Food alloc]initWithProductsParameters:@"456" productsName:self.foodName];
    [orderArray addObject:coffee];
    [orderArray addObject:food];
    
    Order * order = [[Order alloc] initWithOrderPrameters:self.coffeeAmount coffee:coffee foodAmount:1 food:food];
    
    for(int i = 0; i < orderArray.count; i++) {
        if([[orderArray objectAtIndex:i] isMemberOfClass:[Coffee class]]) {
            self.customer.order.coffee = coffee;
        } else if([[orderArray objectAtIndex:i] isMemberOfClass:[Food class]]) {
            self.customer.order.food = food;
        }
    }
    
    self.customer.order = order;
    self.customer.card = self.card;
    
    [order printMyOrderInfo];
    [self.card printMyCardInfo];
    [staff takeOrder:self.customer date:self.currentDate];
    
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f", self.customer.card.storedMoney];
    self.starLabel.text = [NSString stringWithFormat:@"%ld", self.customer.card.currentStars];
}


@end
