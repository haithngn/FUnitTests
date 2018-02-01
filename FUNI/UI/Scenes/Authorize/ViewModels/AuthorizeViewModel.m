//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "AuthorizeViewModel.h"
#import "UserService.h"
#import "LoginParams.h"

@interface AuthorizeViewModel ()

@property (nonatomic, strong) NSObject <UserService> * userService;
@property (nonatomic, strong) NSString * usr;
@property (nonatomic, strong) NSString * pwd;

@end

@implementation AuthorizeViewModel {
@private
    NSString *_username;
    NSString *_password;
}

@synthesize username = _username;
@synthesize password = _password;

- (id)initWithUserService:(NSObject <UserService> *)userService {
    if (self = [super init]) {
        self.userService = userService;
    }

    return self;
}

- (void)login {
    LoginParams * params = [[LoginParams alloc] initWithUsername:_usr password:_pwd];
    [_userService login:params handler:^(NSError *error, User *user) {
        if (error != nil) {
            //TODO: Bind Error to the View
        }
    }];
}

- (void)setUsername:(NSString *)username {
    _usr = username;
    [self validateInputs];
}

- (void)setPassword:(NSString *)password {
    _password = password;
    [self validateInputs];
}

- (void)validateInputs {
    _onDisableSubmit ? _onDisableSubmit([[_usr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]> 5 &&
            [[_password stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]> 5) : nil;
}

@end
