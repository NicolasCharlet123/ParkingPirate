//
//  ViewController3.h
//  Parking Pirate
//
//  Created by Nicolas Charlet on 4/23/14.
//  Copyright (c) 2014 Nicolas Charlet. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Parked : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *myTimePicker;
@property (weak, nonatomic) IBOutlet UITextField *textDisplay;

- (IBAction)buttonClicked:(id)sender;
@end
