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
@property (strong, nonatomic) NSDate *localDate;
@property (strong, nonatomic) Store *storeA;
@property (strong, nonatomic) Store *storeB;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.size = @"Tall";

    self.localDate = [NSDate dateWithTimeIntervalSinceNow:[[NSTimeZone systemTimeZone] secondsFromGMT]];;
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    
    //OpeningTime 12am
    NSDateComponents *comOpen = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self.localDate];
    
    [comOpen setHour:4];
    
    NSDate * openingTime = [calendar dateFromComponents:comOpen];
    
    //ClosingTime 10pm
    NSDateComponents *comClose = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self.localDate];
    
    [comClose setHour:14];
    
    NSDate * closingTime = [calendar dateFromComponents:comClose];

    NSDateComponents *date = [[NSDateComponents alloc]init];
    date.year = 1;
    NSDate *myExpiredDate = [calendar dateByAddingComponents:date toDate:self.localDate options:0];
    
    Store * storeA = [[Store alloc] initWithStoreParameters:@"storeA" address:nil phoneNumber:nil openingTime:openingTime closingTime:closingTime];
    self.storeA = storeA;
    
    //NSLog(@"time1:%@",today12am);
    //NSLog(@"time2:%@",today10pm);
    
    NSNumber *myUniqueID = [[NSNumber alloc] initWithInt:12345];
    NSInteger currentStars = self.starLabel.text.integerValue;
    NSString *cardLevel;
    if (0 < currentStars && currentStars < 300) {
        cardLevel = @"Green";
    } else {
        cardLevel = @"Gold";
    }
    
    Card * card = [[Card alloc] initWithMyParameters:self.moneyLabel.text.floatValue currentStars:currentStars uniquId:myUniqueID expiredDate:myExpiredDate cardLevel:cardLevel];
        
    Customer * customer = [[Customer alloc] initWithMyInformationPrameters:@"AI" card:card];
        self.customer = customer;
        self.card = card;
}

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
