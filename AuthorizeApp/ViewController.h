//
//  ViewController.h
//  AuthorizeApp
//
//  Created by Nikita Krylov on 06.12.2024.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    
    __weak IBOutlet UITextField *loginField;
    __weak IBOutlet UITextField *passwordField;
    NSDictionary *infoDictionary;
}

@property (nonatomic, strong) NSUserDefaults *userDefaults;

- (IBAction)buttonTap:(id)sender;
- (void)resetDefaults;

@end

