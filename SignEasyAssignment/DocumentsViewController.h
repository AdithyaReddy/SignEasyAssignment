//
//  DocumentsViewController.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 27/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Document.h"
#import "CommonTableViewCell.h"
#import "DocumentCollectionViewCell.h"
#import "DetailsViewController.h"

@interface DocumentsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate, DocumentCollectionViewCellDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *searchbarDistanceFromTop;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (void) setDataWithDocumentObject: (Document*) document;

@end
