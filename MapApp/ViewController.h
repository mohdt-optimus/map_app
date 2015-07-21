//
//  ViewController.h
//  MapApp
//
//  Created by optimusmac-12 on 20/07/15.
//  Copyright (c) 2015 mdtaha.optimus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

@property (nonatomic,strong) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet MKMapView *mapsView;

@property (weak, nonatomic) IBOutlet UILabel *labelLongitude;
@property (weak, nonatomic) IBOutlet UILabel *labelLatitude;


- (IBAction)select:(id)sender;


@end

