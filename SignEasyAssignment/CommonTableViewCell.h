//
//  CommonTableViewCell.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 30/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Document.h"

@class CommonTableViewCell;
typedef enum {
    
    ORIGINAL_FILE = 0,
    DRAFT_FILE,
    SIGNED_FILE,
    PENDING_FILE
    
}DocType;

@interface CommonTableViewCell : UITableViewCell <UICollectionViewDataSource, UICollectionViewDelegate>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) Document* document;
@property (nonatomic, strong) NSNumber* documentType;
@property (nonatomic, strong) NSNumber* documentCount;
@property (nonatomic, strong) NSArray* documentArray;
@property (nonatomic, strong) id delegate;


@end
