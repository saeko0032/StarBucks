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
@property (strong, nonatomic) Store *storeA;
@property (strong, nonatomic) Store *storeB;
@property (strong, nonatomic) NSDate *myExpiredDate;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.size = @"Tall";

    NSDate * currentPSTDate = [self getDate];
    Store * store = [[Store alloc]init];
    NSString *result = [store openStore:self.localDate];
    
    self.storeLabel.text = result;
    
    NSNumber *myUniqueID = [[NSNumber alloc] initWithInt:12345];
    NSInteger currentStars = self.starLabel.text.integerValue;
    NSString *cardLevel;
    if (0 < currentStars && currentStars < 300) {
        cardLevel = @"Green";
    } else {
        cardLevel = @"Gold";
    }
    
    Card * card = [[Card alloc] initWithMyParameters:self.moneyLabel.text.floatValue currentStars:currentStars uniquId:myUniqueID expiredDate:self.myExpiredDate cardLevel:cardLevel];
        
    Customer * customer = [[Customer alloc] initWithMyInformationPrameters:@"AI" card:card];
        self.customer = customer;
        self.card = card;
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
    NSLog(@"%@\n",worldTime);
    NSLog(@"%ld\n",(long)worldTime.hour);
    
    //for myExpiredDate tody's date + 1 year
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    dateComponents.year = 1;
    self.myExpiredDate = [calendar dateByAddingComponents:dateComponents toDate:currentPSTDate options:0];
    NSLog(@"%@\n",self.myExpiredDate);
    
    return currentPSTDate;
}

//- (void)getOpenCloseTime:(NSDate*)currentPSTDate
//{
//    NSCalendar* calendar = [NSCalendar currentCalendar];
//    
//    //OpeningTime 12am
//    NSDateComponents *comOpen = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentPSTDate];
//    
//    [comOpen setHour:4];
//    
//    NSDate * openingTime = [calendar dateFromComponents:comOpen];
//    
//    //ClosingTime 10pm
//    NSDateComponents *comClose = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentPSTDate];
//    
//    [comClose setHour:14];
//    
//    NSDate * closingTime = [calendar dateFromComponents:comClose];
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
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


- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString * title = nil;
    switch(row) {
        case 0:
            title = @"1";
            self.amount = 1;
            break;
        case 1:
            title = @"2";
            self.amount = 2;
            break;
        case 2:
            title = @"3";
            self.amount = 3;
            break;
        case 3:
            title = @"4";
            self.amount = 4;
            break;
        case 4:
            title = @"5";
            self.amount = 5;
            break;
        case 5:
            title = @"6";
            self.amount = 6;
            break;
        case 6:
            title = @"7";
            self.amount = 7;
            break;
        case 7:
            title = @"8";
            self.amount = 8;
            break;
        case 8:
            title = @"9";
            self.amount = 9;
            break;
        case 9:
            title = @"10";
            self.amount = 10;
            break;
    }
    return title;
}

- (IBAction)getOrderFromButton:(id)sender {
    
    
    Staff * staff = [[Staff alloc]initWithStaffParameters:@"staff1" perHourWage:10 workingHours:nil workingDays:nil];

    Coffee * coffee = [[Coffee alloc] initWithCoffeeParameters:self.size addIns:nil serveOptions:nil shotOptions:nil flavours:nil toppings:nil];
    
    Order * order = [[Order alloc] initWithOrderPrameters:self.amount coffee:coffee];
    
    self.customer.order = order;
    self.customer.order.coffee = coffee;
    self.customer.card = self.card;
    
    [order printMyOrderInfo];
    [self.card printMyCardInfo];
    [staff takeOrder:self.customer];
    
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f", self.customer.card.storedMoney];
    self.starLabel.text = [NSString stringWithFormat:@"%ld", self.customer.card.currentStars];
}

- (IBAction)reloadMoneyFromButton:(id)sender {
    float reloadMoney = self.reloadMoney.text.floatValue;
    [self.customer reloadStoredMoney:reloadMoney];
    self.moneyLabel.text = [NSString stringWithFormat:@"%.2f", self.customer.card.storedMoney];
    self.starLabel.text = [NSString stringWithFormat:@"%ld", self.customer.card.currentStars];
    self.reloadMoney.text = @"";
    NSLog(@"Reloaded!\n");
}

@end
