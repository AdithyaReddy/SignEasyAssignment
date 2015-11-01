//
//  ApiManager.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 29/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiManager : NSObject

+ (void) getDocumentsWithUsername:(NSString *)postId andPassword:(NSString*)andPassword onSuccess:(void (^)(id))successFunction onFail:(void (^)(NSError *))failFunction;

@end
