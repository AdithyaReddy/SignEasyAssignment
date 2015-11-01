//
//  LoginScreenViewController.m
//  SignEasyAssignment
//
//  Created by Adithya Reddy on 27/10/15.
//  Copyright © 2015 Adithya Reddy. All rights reserved.
//

#import "LoginScreenViewController.h"



@interface LoginScreenViewController () <UITextFieldDelegate>

@property (nonatomic, strong) Document* document;

@end

@implementation LoginScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    CALayer *bottomBorderUsername = [CALayer layer];
    bottomBorderUsername.frame = CGRectMake(0.0f, self.usernameTextfield.frame.size.height - 1, self.usernameTextfield.frame.size.width, 1.0f);
    bottomBorderUsername.backgroundColor = [UIColor grayColor].CGColor;
    
    [self.usernameTextfield.layer addSublayer:bottomBorderUsername];
    
    
    CALayer *bottomBorderPassword = [CALayer layer];
    bottomBorderPassword.frame = CGRectMake(0.0f, self.passwordTextfield.frame.size.height - 1, self.passwordTextfield.frame.size.width, 1.0f);
    bottomBorderPassword.backgroundColor = [UIColor grayColor].CGColor;
    
    [self.passwordTextfield.layer addSublayer:bottomBorderPassword];
    
    
    self.usernameTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"FFFFFF" andAlpha:0.54]}];
    
    self.passwordTextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithHexString:@"FFFFFF" andAlpha:0.54]}];
    
    self.passwordTextfield.secureTextEntry = YES;
    
    self.usernameTextfield.delegate = self;
    self.passwordTextfield.delegate = self;
    //[self.usernameTextfield becomeFirstResponder];
    
    UITapGestureRecognizer* removeKeyboard = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeKeyboardFromScreen)];
    [self.view addGestureRecognizer:removeKeyboard];
    
}

- (void) removeKeyboardFromScreen {
    [self.usernameTextfield resignFirstResponder];
    [self.passwordTextfield resignFirstResponder];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

- (IBAction)loginClicked:(id)sender {
    
    [self.loginBtn setUserInteractionEnabled:NO];
    [self.loginBtn setSelected:YES];
    
    [self.view makeToastActivity:CSToastPositionCenter];

    self.usernameTextfield.text = @"signeasytask2@gmail.com";
    
    if (self.usernameTextfield) {
        if ([self.usernameTextfield.text isEqualToString:@"signeasytask2@gmail.com"]) {
            NSLog(@"Login successful, good to go");
            
            /*
             * Password is assumed to be "signeasytask2" and then ENCRYPTED
             */
            
            NSString* password = @"signeasytask2";
            NSString* finalEncryptedString;
            finalEncryptedString = [LoginAuthentication encodeWithPassword:password];
            
            
            [ApiManager getDocumentsWithUsername:self.usernameTextfield.text andPassword:finalEncryptedString onSuccess:^(id responseObject) {
                
                DocumentParser* docParser = [[DocumentParser alloc] init];
                self.document = [[Document alloc] init];
                self.document = [docParser getParsedDocumentData:responseObject];
                [self gotoNextScreen];
                
            }
            onFail:^(NSError *error) {
                [self.view makeToast:@"Network connection problem!" duration:2.0 position:CSToastPositionCenter];
            }];
         
            
            
        }
    }
    
}

- (void) gotoNextScreen {
    DocumentsViewController* docsController = [[DocumentsViewController alloc] init];
    docsController.title = @"All Documents";
    [docsController setDataWithDocumentObject:self.document];
    UINavigationController *navCtrl = [[UINavigationController alloc] initWithRootViewController:docsController];
    [self.view hideToastActivity];
    [self presentViewController:navCtrl animated:YES completion:nil];
}




@end
