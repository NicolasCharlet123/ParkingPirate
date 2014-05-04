//
//  SearchingViewController.m
//  Parking Pirate
//
//  Created by Nicolas Charlet on 5/3/14.
//  Copyright (c) 2014 Nicolas Charlet. All rights reserved.
//

#import "SearchingViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface SearchingViewController ()

@end

@implementation SearchingViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myAdresses = @[];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateSearchWithString:(NSString *) str {
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSDictionary * params = @{@"key": @"AIzaSyBo26XniG0PAJ5TgpTN6eAL0ZBJSVKujew",
                             
                              @"sensor" : @"false",
                              @"query" : str};

    [manager GET:@"https://maps.googleapis.com/maps/api/place/textsearch/json?" parameters: params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@",responseObject);
        self.myAdresses =  responseObject[@"results"];
        [self.tableView reloadData];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@", operation.request);
        NSLog(@"ERror: %@",error);
    }];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.myAdresses count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    NSDictionary * currentLocation = self.myAdresses[indexPath.row];
    
    cell.textLabel.text = currentLocation[@"name"];
    
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * location = self.myAdresses[indexPath.row];
    
    [self.delegate searchingViewController:self currentLocation:location];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)textFieldDidChange:(id)sender {
    [self updateSearchWithString:self.textField.text];
}


- (IBAction)goBackToMainView:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}









@end
