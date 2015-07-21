//
//  ViewController.m
//  MapApp
//
//  Created by optimusmac-12 on 20/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//
#define METERS_MILE 1609.344
#define METERS_FEET 3.28084
#import "ViewController.h"


@interface ViewController ()

<CLLocationManagerDelegate>

@end

@implementation ViewController
@synthesize mapsView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self mapsView] setShowsUserLocation:YES];
    
    self.locationManager = [[CLLocationManager alloc] init];
    
    [[self locationManager] setDelegate:self];
    
    // we have to setup the location maanager with permission in later iOS versions
    if ([[self locationManager] respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [[self locationManager] requestWhenInUseAuthorization];
    }
    
    [[self locationManager] setDesiredAccuracy:kCLLocationAccuracyBest];
    [[self locationManager] startUpdatingLocation];
}

-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = locations.lastObject;
    [[self labelLatitude] setText:[NSString stringWithFormat:@"%.6f", location.coordinate.latitude]];
    [[self labelLongitude] setText:[NSString stringWithFormat:@"%.6f", location.coordinate.longitude]];
    
    
    // zoom the map into the users current location
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2*METERS_MILE, 2*METERS_MILE);
    [[self mapsView] setRegion:viewRegion animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)select:(id)sender
{
    switch (((UISegmentedControl *)sender).selectedSegmentIndex)
    {
        case 0:
            mapsView.mapType=MKMapTypeStandard;
            break;
        case 1:
            mapsView.mapType=MKMapTypeSatellite;
            break;
        case 2:
            mapsView.mapType=MKMapTypeHybrid;
            break;
        default:
            break;
    }
}
@end
