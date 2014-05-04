//
//  ViewController2.h
//  Parking Pirate
//
//  Created by Nicolas Charlet on 4/23/14.
//  Copyright (c) 2014 Nicolas Charlet. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchingViewController.h"

@interface SearchParking : UIViewController <SearchingViewControllerDelegate>


@property (weak, nonatomic) IBOutlet UIDatePicker *TimeScrolling;

- (IBAction)SetTimeClicker:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *DisplayTimeField;

@property (nonatomic) NSDictionary * chosenLocation;

@end
