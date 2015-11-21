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
    
    [self initializeTableContent];

    [self initializeSearchController];
    
    [self styleTableView];
}

- (void)initializeTableContent {
    
//    //sections are defined here as a NSArray of string objects (i.e. letters representing each section)
//    self.tableSections = [[Item fetchDistinctItemGroupsInManagedObjectContext:self.managedObjectContext] mutableCopy];
//    
//    //sections and items are defined here as a NSArray of NSDictionaries whereby the key is a letter and the value is a NSArray of string opbjects of names
//    self.tableSectionsAndItems = [[Item fetchItemNamesByGroupInManagedObjectContext:self.managedObjectContext] mutableCopy];
}

- (void)initializeSearchController {
    
    //instantiate a search results controller for presenting the search/filter results (will be presented on top of the parent table view)
    UITableViewController *searchResultsController = [[UITableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    searchResultsController.tableView.dataSource = self;
    
    searchResultsController.tableView.delegate = self;
    
    //instantiate a UISearchController - passing in the search results controller table
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:searchResultsController];
    
    //this view controller can be covered by theUISearchController's view (i.e. search/filter table)
    self.definesPresentationContext = YES;
    
    
    //define the frame for the UISearchController's search bar and tint
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y, self.searchController.searchBar.frame.size.width, 44.0);
    
    self.searchController.searchBar.tintColor = [UIColor whiteColor];
    
    self.searchController.searchBar.placeholder = @"Search Documents";
    
    //add the UISearchController's search bar to the header of this table
    self.tableView.tableHeaderView = self.searchController.searchBar;
    
    
    //this ViewController will be responsible for implementing UISearchResultsDialog protocol method(s) - so handling what happens when user types into the search bar
    self.searchController.searchResultsUpdater = self;
    
    
    //this ViewController will be responsisble for implementing UISearchBarDelegate protocol methods(s)
    self.searchController.searchBar.delegate = self;
}

- (void)styleTableView {
    
//    [[self tableView] setSectionIndexColor:[UIColor colorWithRed:100.0f/255.0f green:100.0f/255.0f blue:100.0f/255.0f alpha:1.0f]];
//    
//    [[self tableView] setSectionIndexBackgroundColor:[UIColor colorWithRed:230.0f/255.0f green:230.0f/255.0f blue:230.0f/255.0f alpha:1.0f]];
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


#pragma mark UISearchController results updating delegate method

-(void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
//    //get search text from user input
//    NSString *searchText = [self.searchController.searchBar text];
//    
//    //exit if there is no search text (i.e. user tapped on the search bar and did not enter text yet)
//    if(![searchText length] > 0) {
//        
//        return;
//    }
//    //handle when there is search text entered by the user
//    else {
//        
//        //based on the user's search, we will update the contents of the tableSections and tableSectionsAndItems properties
//        [self.tableSections removeAllObjects];
//        
//        [self.tableSectionsAndItems removeAllObjects];
//        
//        
//        NSString *firstSearchCharacter = [searchText substringToIndex:1];
//        
//        //handle when user taps into search bear and there is no text entered yet
//        if([searchText length] == 0) {
//            
//            self.tableSections = [[Item fetchDistinctItemGroupsInManagedObjectContext:self.managedObjectContext] mutableCopy];
//            
//            self.tableSectionsAndItems = [[Item fetchItemNamesByGroupInManagedObjectContext:self.managedObjectContext] mutableCopy];
//        }
//        //handle when user types in one or more characters in the search bar
//        else if(searchText.length > 0) {
//            
//            //the table section will always be based off of the first letter of the group
//            NSString *upperCaseFirstSearchCharacter = [firstSearchCharacter uppercaseString];
//            
//            self.tableSections = [[[NSArray alloc] initWithObjects:upperCaseFirstSearchCharacter, nil] mutableCopy];
//            
//            
//            //there will only be one section (based on the first letter of the search text) - but the property requires an array for cases when there are multiple sections
//            NSDictionary *namesByGroup = [Item fetchItemNamesByGroupFilteredBySearchText:searchText inManagedObjectContext:self.managedObjectContext];
//            
//            self.tableSectionsAndItems = [[[NSArray alloc] initWithObjects:namesByGroup, nil] mutableCopy];
//        }
//        
//        //now that the tableSections and tableSectionsAndItems properties are updated, reload the UISearchController's tableview
//        [((UITableViewController *)self.searchController.searchResultsController).tableView reloadData];
//    }
}

#pragma mark - UISearchBarDelegate methods

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
//    
//    [self.tableSections removeAllObjects];
//    
//    [self.tableSectionsAndItems removeAllObjects];
//    
//    self.tableSections = [[Item fetchDistinctItemGroupsInManagedObjectContext:self.managedObjectContext] mutableCopy];
//    
//    self.tableSectionsAndItems = [[Item fetchItemNamesByGroupInManagedObjectContext:self.managedObjectContext] mutableCopy];
}


@end
