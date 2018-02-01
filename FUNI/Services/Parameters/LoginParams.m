//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "LoginParams.h"


@implementation LoginParams
@synthesize username = _username;
@synthesize password = _password;

- (NSString *)username {
    return _username;
}

- (NSString*)password {
    return _password;
}

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password {
    if (self = [super init]) {
        _username = username;
        _password = password;
    }

    return self;
}


@end