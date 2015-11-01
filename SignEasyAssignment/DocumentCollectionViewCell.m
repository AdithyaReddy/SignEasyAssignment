//
//  DocumentCollectionViewCell.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 30/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "DocumentCollectionViewCell.h"
#import "UIView+Toast.h"

@implementation DocumentCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    
    UIImageView* backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"orange-doc.png"]];
    [self setBackgroundView:backImage];
    [self.layer setCornerRadius:5.0];
    
}

- (void) createCellWithDelegate:(id)withDelegate {
    
    if (self.fileInfoDictionary) {
        self.fileName = [self.fileInfoDictionary objectForKey:@"name"];
        
        if (self.fileName) {
            self.filenameLabel.text = self.fileName;
        }
    }
    else
    self.filenameLabel.text = @"No Files! Sorry";
   
    
    self.delegate = withDelegate;
    
}

- (IBAction)filDetailsOnClick:(id)sender {
    
    if(self.fileInfoDictionary) {
    if ([self.delegate respondsToSelector:@selector(moveToDetailsController:)]) {
        [self.delegate moveToDetailsController:self.fileInfoDictionary];
    }
    }
    else {
        
        if ([self.delegate respondsToSelector:@selector(showToast:)]) {
            [self.delegate showToast:@"You havent added any files into this section!"];
        }
    }
}
@end
