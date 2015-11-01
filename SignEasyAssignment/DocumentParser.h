//
//  DocumentParser.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 29/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Document.h"

@interface DocumentParser : NSObject

- (Document*) getParsedDocumentData : (id)responseObject;

@end
