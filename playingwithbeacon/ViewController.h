//
//  ViewController.h
//  playingwithbeacon
//
//  Created by Leonard Yeo on 14/3/14.
//  Copyright (c) 2014 vueartiste. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface ViewController : UIViewController<CBPeripheralManagerDelegate>
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;
- (IBAction)buttonClicked:(id)sender;
@property (strong, nonatomic) CLBeaconRegion *myBeaconRegion;
@property (strong, nonatomic) NSDictionary *myBeaconData;
@property (strong, nonatomic) CBPeripheralManager *peripheralManager;

@end
