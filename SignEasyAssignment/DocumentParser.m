//
//  DocumentParser.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 29/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "DocumentParser.h"
#import "ObjectParser.h"

@implementation DocumentParser

- (Document*) getParsedDocumentData : (id)responseObject {
    
    Document* document = [[Document alloc] init];
    ObjectParser* objParser = [[ObjectParser alloc] init];
    
    //Total docs count
    document.totalFilesCount = [objParser getNumberForKey:@"count" fromDictionary:responseObject withInitialValue:nil];
    
    
    /*
     *  Parsing For Draft Docs
     */
    
    //Draft - data
    NSDictionary* draftDocs = [[NSDictionary alloc] init];
    draftDocs = [objParser getDictionaryForKey:@"draft" fromDictionary:responseObject withInitialValue:nil];
    document.draftFilesCount = [draftDocs objectForKey:@"count"];
    // Draft - Data files
    document.draftFiles = [objParser getArrayForKey:@"files" fromDictionary:draftDocs withInitialValue:nil];
    
    
    /*
     *  Parsing For Pending Docs
     */
    
    //Pending - data
    NSDictionary* pendingDocs = [[NSDictionary alloc] init];
    pendingDocs = [objParser getDictionaryForKey:@"pending" fromDictionary:responseObject withInitialValue:nil];
    document.pendingFilesCount = [pendingDocs objectForKey:@"count"];
    // Pending - Data files
    document.pendingFiles = [objParser getArrayForKey:@"files" fromDictionary:pendingDocs withInitialValue:nil];

    
    
    /*
     *  Parsing For Signed Docs
     */
    
    //Signed - Docs Count
    NSDictionary* signedDocs = [[NSDictionary alloc] init];
    signedDocs = [objParser getDictionaryForKey:@"signed" fromDictionary:responseObject withInitialValue:nil];
    document.signedFilesCount = [signedDocs objectForKey:@"count"];
    // signed - Data files
    document.signedFiles = [objParser getArrayForKey:@"files" fromDictionary:signedDocs withInitialValue:nil];

    
    /*
    *  Parsing For Original Docs
    */
    
    //Original - Docs count
    NSDictionary* originalDocs = [[NSDictionary alloc] init];
    originalDocs = [objParser getDictionaryForKey:@"original" fromDictionary:responseObject withInitialValue:nil];
    document.originalFilesCount = [originalDocs objectForKey:@"count"];
    // Original - Data files
    document.originalFiles = [objParser getArrayForKey:@"files" fromDictionary:originalDocs withInitialValue:nil];
    

    
    
    return document;
    
}


@end
