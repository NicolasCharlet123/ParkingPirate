//
//  ViewController4.h
//  Parking Pirate
//
//  Created by Nicolas Charlet on 5/1/14.
//  Copyright (c) 2014 Nicolas Charlet. All rights reserved.
//

#import <UIKit/UIKit.h>


@class GMSMapView;
@interface mapViewController : UIViewController

@property (weak, nonatomic) IBOutlet GMSMapView *mapView;

@property (nonatomic) NSDictionary * centralLocation;
@end
