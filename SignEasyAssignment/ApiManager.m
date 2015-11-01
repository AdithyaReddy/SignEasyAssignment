//
//  ApiManager.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 29/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "ApiManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation ApiManager

+ (void) getDocumentsWithUsername:(NSString *)username andPassword:(NSString*)andPassword onSuccess:(void (^)(id))successFunction onFail:(void (^)(NSError *))failFunction {
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:username password:andPassword];
    
    
    [manager GET:@"https://api.getsigneasy.com/v4/files/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if (successFunction) {
            successFunction(responseObject);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (failFunction) {
            failFunction(error);
        }
    }];            //---------------
    
    
    
}

@end
