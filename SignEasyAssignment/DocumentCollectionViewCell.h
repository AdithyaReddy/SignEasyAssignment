//
//  DocumentCollectionViewCell.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 30/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DocumentCollectionViewCellDelegate <NSObject>

@optional
- (void) moveToDetailsController:(NSDictionary*) documentDetails;
- (void) showToast: (NSString*) messageToShow;

@end

@interface DocumentCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *filenameLabel;
@property (weak, nonatomic) IBOutlet UIButton *fileDetailsButton;

@property (nonatomic, strong) NSString* fileName;
@property (nonatomic, strong) NSDictionary* fileInfoDictionary;
@property (nonatomic, strong) NSArray* fileInfoArray;

@property (nonatomic, strong) id delegate;

- (IBAction)filDetailsOnClick:(id)sender;

- (void) createCellWithDelegate:(id)withDelegate;
@end
