//
//  CommonTableViewCell.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 30/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "DocumentCollectionViewCell.h"


@implementation CommonTableViewCell


- (void)awakeFromNib {
    // Initialization code

    
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    UINib *cellNib = [UINib nibWithNibName:@"DocumentCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"DocCell"];

    
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.documentCount intValue];
 }

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        DocumentCollectionViewCell *cellView = (DocumentCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DocCell" forIndexPath:indexPath];
        if (cellView == nil)
        {
            [collectionView registerNib:[UINib nibWithNibName:@"DocumentCollectionViewCell" bundle:[NSBundle mainBundle]  ] forCellWithReuseIdentifier:@"DocCell"];
            cellView = (DocumentCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DocCell" forIndexPath:indexPath];
            
        }
    
    if (self.documentCount.intValue > 1) {
        NSDictionary* tempDictionary = [[NSDictionary alloc] init];
        tempDictionary = [self.documentArray objectAtIndex:indexPath.item];
        
        cellView.fileInfoDictionary = tempDictionary;
    }
    
        
        
        [cellView createCellWithDelegate:self.delegate];
        
        return cellView;
    
}


@end
