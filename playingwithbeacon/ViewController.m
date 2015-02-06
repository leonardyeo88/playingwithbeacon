//
//  ViewController.m
//  playingwithbeacon
//
//  Created by Leonard Yeo on 14/3/14.
//  Copyright (c) 2014 vueartiste. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //create a NSUUID object
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
    
    //initiate the beacon region
    self.myBeaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid major:31895 minor:39130 identifier:@"com.vueartiste.playingwithbeacon"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonClicked:(id)sender {
    
    //get the beacon data to advertise
    self.myBeaconData = [self.myBeaconRegion peripheralDataWithMeasuredPower:nil];
    
    //start the peripheral manager
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil options:nil];
    
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if(peripheral.state == CBPeripheralManagerStatePoweredOn)
    {
        //bluetooth is on
        
        //update our status label
        self.statusLabel.text = @"broadcasting";
        
        //start boardcasting
        [self.peripheralManager startAdvertising:self.myBeaconData];
    }
    else if(peripheral.state == CBPeripheralManagerStatePoweredOff)
    {
        //update our status label
        self.statusLabel.text = @"stopped";
    }
}
@end
