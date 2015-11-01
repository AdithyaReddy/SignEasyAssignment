//
//  DetailsViewController.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 01/11/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

- (void) showDocumentDetails:(NSDictionary *)docInfo {
    
    self.documentDetails = docInfo;
    
    self.title = [self.documentDetails objectForKey:@"name"];
    [self.tableView reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    


    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSInteger section = [indexPath section];
    
    switch (section) {
        case 0: // First cell in section 1
            cell.textLabel.text = [self.documentDetails objectForKey:@"name"];
            break;
        case 1: {
            id val = [self.documentDetails objectForKey:@"id"];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", val];

        }
            break;
        case 2: {
            
            id val = [self.documentDetails objectForKey:@"created_time"];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", val];
        }
            break;
        case 3:
        {
            id val = [self.documentDetails objectForKey:@"last_modified_time"];
            cell.textLabel.text = [NSString stringWithFormat:@"%@", val];
        }
            break;
    }
    return cell;
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"File Name";
    }
    else if (section == 1)
        return @"Id";
    else if (section == 2)
        return @"Created time";
    else
        return @"Last modified time";
}

@end
