//
//  ViewController.m
//  SITUBluetoothSample
//
//  Created by Gary on 7/2/15.
//  Copyright (c) 2015 SITU. All rights reserved.
//

#import "ViewController.h"

#import "SITUBluetoothScaleController.h"

@interface ViewController () <SITUBluetoothDelegate>

@property (nonatomic, weak) IBOutlet UILabel *statusLabel;
@property (nonatomic, weak) IBOutlet UILabel *weight;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self scaleDisconnected];
    [[SITUBluetoothScaleController sharedInstance] scanForDevice:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)scaleConnected
{
    [self.statusLabel setText:@"Connected"];
    [self.statusLabel setTextColor:[UIColor greenColor]];
}

- (void)scaleDisconnected
{
    [self.statusLabel setText:@"Disconnected"];
    [self.statusLabel setTextColor:[UIColor grayColor]];
    [self.weight setText:@"N/A"];
}

- (void)scaleUnsupported
{
    NSLog(@"This scale is unsupported.");
}

- (void)scaleDidUpdateValue:(int)value
{
    [self.weight setText:[NSString stringWithFormat:@"%i g", value]];
}

@end
