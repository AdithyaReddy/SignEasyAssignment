//
//  LoginAuthentication.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 28/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "LoginAuthentication.h"


@implementation LoginAuthentication


+ (NSString*) encodeWithPassword : (NSString*) passwordText {
    
    NSString* base64PasswordString = [self encodeStringTo64:passwordText];
    NSString* finalEncodedString = [self sha256:base64PasswordString];
    
    return finalEncodedString;
}


/*
 *  To convert String to 'base64'
 */
+ (NSString*)encodeStringTo64:(NSString*)fromString
{
    NSData *plainData = [fromString dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String;
    base64String = [plainData base64EncodedStringWithOptions:kNilOptions];  // iOS 7+
    
    return base64String;
}


/*
 *  To convert 'base64' String to SHA256 hash
 */

+ (NSString*) sha256:(NSString *)clear{
    const char *s=[clear cStringUsingEncoding:NSASCIIStringEncoding];
    NSData *keyData=[NSData dataWithBytes:s length:strlen(s)];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH]={0};
    CC_SHA256(keyData.bytes, keyData.length, digest);
    NSData *out=[NSData dataWithBytes:digest length:CC_SHA256_DIGEST_LENGTH];
    NSString *hash=[out description];
    hash = [hash stringByReplacingOccurrencesOfString:@" " withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@"<" withString:@""];
    hash = [hash stringByReplacingOccurrencesOfString:@">" withString:@""];
    return hash;
}


@end
