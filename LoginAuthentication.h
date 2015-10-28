//
//  LoginAuthentication.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 28/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>

@interface LoginAuthentication : NSObject

+ (NSString*) encodeWithPassword : (NSString*) passwordText;

@end
