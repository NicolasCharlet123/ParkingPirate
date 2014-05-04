//
//  ViewController4.m
//  Parking Pirate
//
//  Created by Nicolas Charlet on 5/1/14.
//  Copyright (c) 2014 Nicolas Charlet. All rights reserved.
//

#import "mapViewController.h"
#import <GoogleMaps/GoogleMaps.h>



@interface mapViewController ()

@end

@implementation mapViewController




- (void)viewDidLoad {

    // Create a GMSCameraPosition that tells the map to display the
    // coordinate -33.86,151.20 at zoom level 6.
   
    
    // Creates a marker in the center of the map.
    GMSMarker * marker1 = [[GMSMarker alloc] init];
    
    NSString *myName = self.centralLocation[@"name"];
    NSDictionary *geometry = self.centralLocation[@"geometry"];
    NSDictionary *location = geometry[@"location"];
    NSNumber *latitude = location[@"lat"];
    NSNumber *longitude = location[@"lng"];
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latitude.doubleValue
                                                            longitude:longitude.doubleValue
                                                                 zoom:15];
    
    self.mapView.myLocationEnabled = YES;
    
    [self.mapView setCamera:camera];
    
    NSLog(@"%@", self.centralLocation);

    
    
    marker1.position = CLLocationCoordinate2DMake(latitude.doubleValue, longitude.doubleValue);
    marker1.title = myName;
    marker1.snippet = @"Boston";
    marker1.map = self.mapView;
    
//    GMSMarker * marker2 = [[GMSMarker alloc] init];
//    marker2.position = CLLocationCoordinate2DMake(42.37, -71.08);
//    marker2.title = @"34 Boylston Street";
//    marker2.snippet = @"Boston";
//    marker2.map = _mapView;
//    
//    GMSMarker * marker3 = [[GMSMarker alloc] init];
//    marker3.position = CLLocationCoordinate2DMake(42.35, -71.10);
//    marker3.title = @"12 Newbury Street";
//    marker3.snippet = @"Boston";
//    marker3.map = _mapView;
    
    
}

- (IBAction)goBackToMainView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

