//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserApiImpl.h"
#import "Credential.h"

@implementation UserApiImpl

- (void)signIn:(SignInParams *)params handler:(void (^)(NSError * error, Credential * credential))handler {
    handler ? handler(nil, [[Credential alloc] init]) : nil;
}

@end