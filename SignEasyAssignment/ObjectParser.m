//
//  ObjectParser.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 29/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "ObjectParser.h"

@implementation ObjectParser

#pragma mark - Value descriptors

- (NSNumber *) getNumberForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue: (NSNumber *)initialValue {
    NSNumber *returnVal = initialValue;
    @try {
        returnVal = [dictionary valueForKeyPath:key];
    }
    @catch (NSException *exception) {
        NSLog(@"catched");
    }
    
    if (returnVal == nil || [returnVal class] == [NSNull null]){
        return initialValue;
    }
    else{
        if([returnVal isKindOfClass:[NSString class]]){
            NSString *tempString = (NSString *)returnVal;
            @try{
                returnVal = [NSDecimalNumber decimalNumberWithString:tempString];
            }
            @catch (NSException *exception){
                NSLog(@"catched in get number of key %@", returnVal);
            }
        }
        
    }
    
    return returnVal;
}

- (NSString *) getStringForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue: (NSString *)initialValue {
    NSString *returnVal = initialValue;
    @try {
        returnVal = [dictionary valueForKeyPath:key];
    }
    @catch (NSException *exception) {
        NSLog(@"catched");
    }
    
    if (returnVal == nil || [returnVal class] == [NSNull class]){
        return initialValue;
    }
    else{
        returnVal = [NSString stringWithFormat:@"%@",returnVal];
    }
    
    return returnVal;
}

- (NSArray *) getArrayForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue: (NSArray *)initialValue {
    NSArray *returnVal = initialValue;
    @try {
        returnVal = [dictionary valueForKeyPath:key];
    }
    @catch (NSException *exception) {
        NSLog(@"catched");
    }
    
    if (returnVal == nil)
        return initialValue;
    
    return returnVal;
}

- (BOOL) getBoolForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue:(BOOL)initialValue {
    BOOL returnVal = initialValue;
    @try {
        returnVal = [[dictionary valueForKeyPath:key] boolValue];
    }
    @catch (NSException *exception) {
        NSLog(@"catched");
    }
    
    return returnVal;
}

- (NSInteger) getIntegerForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue:(NSInteger)initialValue {
    NSInteger returnVal = initialValue;
    @try {
        returnVal = [[dictionary valueForKeyPath:key] integerValue];
    }
    @catch (NSException *exception) {
        NSLog(@"catched");
    }
    
    return returnVal;
}

- (NSDictionary*) getDictionaryForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue:(NSDictionary*)initialValue {
    NSDictionary* returnDict = [[NSDictionary alloc] init];
    
    @try {
        returnDict = [dictionary valueForKeyPath:key] ;
    }
    @catch (NSException *exception) {
        NSLog(@"catched");
    }
    
    
    return returnDict;
}
@end
