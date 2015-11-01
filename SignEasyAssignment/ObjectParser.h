//
//  ObjectParser.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 29/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObjectParser : NSObject

- (NSNumber *) getNumberForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue: (NSNumber *)initialValue;
- (NSString *) getStringForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue: (NSString *)initialValue;
- (NSArray *) getArrayForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue: (NSArray *)initialValue;
- (BOOL) getBoolForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue:(BOOL)initialValue;
- (NSInteger) getIntegerForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue:(NSInteger)initialValue;
- (NSDictionary*) getDictionaryForKey: (NSString *)key fromDictionary: (NSDictionary *)dictionary withInitialValue:(NSDictionary*)initialValue;
@end