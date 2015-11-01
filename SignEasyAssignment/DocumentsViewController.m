//
//  DocumentsViewController.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 27/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "DocumentsViewController.h"
#import "UIView+Toast.h"

@interface DocumentsViewController ()

@property (nonatomic) Document* documentsInfo;
@property (nonatomic) UITableViewCell* returnCell;

@end

@implementation DocumentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.searchBar.showsCancelButton = NO;
    self.searchBar.placeholder = @"Search Documents";
    self.searchbarDistanceFromTop.constant = self.navigationController.navigationBar.frame.size.height + (int)[UIApplication sharedApplication].statusBarFrame.size.height;
    [self.searchBar setNeedsUpdateConstraints];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}

- (void) setDataWithDocumentObject: (Document*) document {
    
    self.documentsInfo = document;
    //Document object parse
    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    CommonTableViewCell *commonCell;
 
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"CommonTableViewCell" owner:self options:nil];
        commonCell = [nibArray objectAtIndex:0];
    
        if(indexPath.section == [[NSNumber numberWithInt:ORIGINAL_FILE] intValue]) {
            //original
            commonCell.documentType = [NSNumber numberWithInt:ORIGINAL_FILE];
            commonCell.documentCount = self.documentsInfo.originalFilesCount;
            commonCell.documentArray = self.documentsInfo.originalFiles;
        }
        
        else if (indexPath.section == [[NSNumber numberWithInt:DRAFT_FILE] intValue]) {
            //Drafts
            commonCell.documentType = [NSNumber numberWithInt:DRAFT_FILE];
            commonCell.documentCount = self.documentsInfo.draftFilesCount;
            commonCell.documentArray = self.documentsInfo.draftFiles;
        }
        
        else if (indexPath.section == [[NSNumber numberWithInt:SIGNED_FILE] intValue]) {
            
            commonCell.documentType = [NSNumber numberWithInt:SIGNED_FILE];
            commonCell.documentCount = self.documentsInfo.signedFilesCount;
            commonCell.documentArray = self.documentsInfo.signedFiles;
        }
        
        else if (indexPath.section == [[NSNumber numberWithInt:PENDING_FILE] intValue]) {
            
            commonCell.documentType = [NSNumber numberWithInt:PENDING_FILE];
            commonCell.documentCount = self.documentsInfo.pendingFilesCount;
            commonCell.documentArray = self.documentsInfo.pendingFiles;
        }
    
    
    if (commonCell.documentCount.intValue == 0) {
        int value = [commonCell.documentCount intValue];
        commonCell.documentCount = [NSNumber numberWithInt:value + 1];
    }
    
    
        commonCell.document = self.documentsInfo;
        commonCell.delegate = self;
        //[commonCell setCellData:self.documentsInfo];
        
        return commonCell;
  
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (section == [[NSNumber numberWithInt:ORIGINAL_FILE] intValue])
        return [NSString stringWithFormat:@"Original (%@)",self.documentsInfo.originalFilesCount];
    else if (section == [[NSNumber numberWithInt:DRAFT_FILE] intValue])
        return [NSString stringWithFormat:@"Drafts (%@)",self.documentsInfo.draftFilesCount];
    else if (section == [[NSNumber numberWithInt:SIGNED_FILE] intValue])
        return [NSString stringWithFormat:@"Signed (%@)",self.documentsInfo.signedFilesCount];
    else
        return [NSString stringWithFormat:@"Pending (%@)",self.documentsInfo.pendingFilesCount];;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  150.0;
}

#pragma mark DocumentCollectionViewControllerCell delegate methods

- (void) moveToDetailsController:(NSDictionary*) documentDetails {
    
    DetailsViewController* detailsController = [[DetailsViewController alloc] init];
    [detailsController showDocumentDetails:documentDetails];
    [self.navigationController pushViewController:detailsController animated:YES];
}

- (void) showToast:(NSString *)messageToShow {
    [self.view makeToast:messageToShow duration:2.0 position:CSToastPositionCenter];
}

@end
