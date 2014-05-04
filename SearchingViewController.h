//
//  SearchingViewController.h
//  Parking Pirate
//
//  Created by Nicolas Charlet on 5/3/14.
//  Copyright (c) 2014 Nicolas Charlet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SearchingViewController;
@protocol SearchingViewControllerDelegate <NSObject>

-(void) searchingViewController:(SearchingViewController * ) svc currentLocation:(NSDictionary*) loc;

@end


@interface SearchingViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (strong, nonatomic) NSArray *myAdresses;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak,nonatomic) id<SearchingViewControllerDelegate> delegate;

@end
