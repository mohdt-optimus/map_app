//
//  ViewController.m
//  map test
//
//  Created by optimusmac-12 on 20/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import "ViewController.h"
#define METERS_MILE 1609.344
#define METERS_FEET 3.28084

@interface ViewController ()
<CLLocationManagerDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self map] setShowsUserLocation:YES];
    
    self.location = [[CLLocationManager alloc] init];
    
    [[self location] setDelegate:self];
    
    // we have to setup the location maanager with permission in later iOS versions
    if ([[self location] respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [[self location] requestWhenInUseAuthorization];
    }
    
    [[self location] setDesiredAccuracy:kCLLocationAccuracyBest];
    [[self location] startUpdatingLocation];
}
-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = locations.lastObject;
    [[self latitude] setText:[NSString stringWithFormat:@"%.6f", location.coordinate.latitude]];
    [[self longitude] setText:[NSString stringWithFormat:@"%.6f", location.coordinate.longitude]];
    [[self altitude] setText:[NSString stringWithFormat:@"%.2f feet", location.altitude*METERS_FEET]];
     MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2*METERS_MILE, 2*METERS_MILE);
    [[self map] setRegion:viewRegion animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
