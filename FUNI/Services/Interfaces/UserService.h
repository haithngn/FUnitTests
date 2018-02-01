//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@class LoginParams;

@protocol UserServiceObservable <NSObject>

- (void)currentUserHasBeenChanged;

@end

@protocol UserService <NSObject>

- (User*)currentUser;
- (void)login:(LoginParams*)params handler:(void (^)(NSError* error, User * user))handler;
- (void)addObserver:(NSObject<UserServiceObservable> *) observer;

@end