//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SignInParams;
@class Credential;

@protocol UserApi <NSObject>

- (void)signIn:(SignInParams *) params handler:(void(^)(NSError * error, Credential * credential)) handler;

@end