//
//  Document.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 29/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Document : NSObject

@property (nonatomic, strong) NSNumber* totalFilesCount;

@property (nonatomic, strong) NSNumber* draftFilesCount;
@property (nonatomic, strong) NSNumber* pendingFilesCount;
@property (nonatomic, strong) NSNumber* signedFilesCount;
@property (nonatomic, strong) NSNumber* originalFilesCount;

@property (nonatomic, strong) NSArray* draftFiles;
@property (nonatomic, strong) NSArray* pendingFiles;
@property (nonatomic, strong) NSArray* signedFiles;
@property (nonatomic, strong) NSArray* originalFiles;


@end
