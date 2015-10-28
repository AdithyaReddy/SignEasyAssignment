//
//  DocumentsViewController.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 27/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "DocumentsViewController.h"

@interface DocumentsViewController ()

@end

@implementation DocumentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.searchBar.showsCancelButton = NO;
    self.searchbarDistanceFromTop.constant = self.navigationController.navigationBar.frame.size.height + (int)[UIApplication sharedApplication].statusBarFrame.size.height;
    [self.searchBar setNeedsUpdateConstraints];
}



@end
