//
//  DetailsViewController.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 01/11/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSDictionary* documentDetails;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableTopConstraint;


- (void) showDocumentDetails : (NSDictionary*) docInfo;

@end
