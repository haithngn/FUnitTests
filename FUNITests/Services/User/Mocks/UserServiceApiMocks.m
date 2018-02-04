//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserServiceApiMocks.h"
#import "SignInParams.h"
#import "Credential.h"

@interface UserServiceApiMocks ()

@property (nonatomic, strong) NSString * usr;
@property (nonatomic, strong) NSString * pwd;

@end

@implementation UserServiceApiMocks {

}

- (void)signIn:(SignInParams *)params handler:(void (^)(NSError *error, Credential *credential))handler {
    _usr = params.username;
    _pwd = params.password;
    handler ? handler(nil, [[Credential alloc] init]) : nil;
}

@end