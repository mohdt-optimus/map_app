//
//  ViewController.h
//  map test
//
//  Created by optimusmac-12 on 20/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) CLLocationManager *location;
@property (weak, nonatomic) IBOutlet UILabel *latitude;
@property (weak, nonatomic) IBOutlet UILabel *longitude;

@property (weak, nonatomic) IBOutlet UILabel *altitude;
@property (weak, nonatomic) IBOutlet MKMapView *map;

@end
