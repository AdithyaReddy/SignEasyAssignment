//
//  LoginScreenViewController.h
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 27/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Document.h"
#import "UIColor+ColorFunctions.h"
#import "DocumentsViewController.h"
#import "LoginAuthentication.h"
#import <AFNetworking.h>
#import "DocumentParser.h"
#import "ApiManager.h"
#import "UIView+Toast.h"

@interface LoginScreenViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextfield;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextfield;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)loginClicked:(id)sender;
@end
