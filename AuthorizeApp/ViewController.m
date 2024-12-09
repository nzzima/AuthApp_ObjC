//
//  ViewController.m
//  AuthorizeApp
//
//  Created by Nikita Krylov on 06.12.2024.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    infoDictionary = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:@"login", nil] forKey:[NSArray arrayWithObjects:@"password", nil]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.userDefaults = [NSUserDefaults standardUserDefaults];
    [self.userDefaults setObject:@"nzzima" forKey:@"login"];
    [self.userDefaults setObject:@"12345" forKey:@"password"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *directoryPath = @"Users/nzzima/Desktop/IOS/ObjectiveC/AuthorizeApp/";
    NSString *filePath = [directoryPath stringByAppendingPathComponent:@"userInfo.txt"];
    
    if ([fileManager fileExistsAtPath:filePath]) {
        NSDictionary *attributes = [fileManager attributesOfItemAtPath:filePath error:nil];
        unsigned long long size = [attributes fileSize];
        if (attributes && size == 0) {
            NSData *data1 = [@"nzzima" dataUsingEncoding:NSUTF8StringEncoding];
            [data1 writeToFile:filePath atomically:YES];
            NSData *data2 = [@"12345" dataUsingEncoding:NSUTF8StringEncoding];
            [data2 writeToFile:filePath atomically:YES];
        }
    } else {
        NSLog(@"File not found");
    }
}

- (IBAction)buttonTap:(id)sender {
    NSString* loginDefault = [self.userDefaults stringForKey:@"login"];
    NSString* passwordDefault = [self.userDefaults stringForKey:@"password"];
    
    @try {
        if ([loginField.text isEqual: @""] || [passwordField.text isEqual: @""]) {
            NSException *e = [NSException
                    exceptionWithName:@"EmptyFields"
                    reason:@"Not all fields are field with some user data"
                    userInfo:nil];
            @throw e;
        } else {
            if ([loginField.text isEqualToString:loginDefault] && [passwordField.text isEqualToString:passwordDefault]) {
                NSLog(@"Password correct! %@, %@", loginField.text, passwordField.text);
            } else {
                NSLog(@"Password incorrect! %@, %@", loginField.text, passwordField.text);
            }
        }
    } @catch (NSException *e) {
        NSLog(@"Catching exception: %@\nTry again!", e.reason);
        
    }
}

- (void)resetDefaults {
    NSDictionary *dict = [self.userDefaults dictionaryRepresentation];
        for (id key in dict) {
            [self.userDefaults removeObjectForKey:key];
        }
        [self.userDefaults synchronize];
}

@end
