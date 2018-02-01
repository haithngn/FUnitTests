//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "UserServiceImpl.h"
#import "LoginParams.h"
#import "UserRepository.h"
#import "SessionRepository.h"
#import "User.h"
#import "UserApi.h"
#import "SignInParams.h"

@interface UserServiceImpl ()

@property (nonatomic, strong) User * user;
@property (nonatomic, strong) NSObject<SessionRepository> * sessionRepository;
@property (nonatomic, strong) NSObject<UserRepository> * repository;
@property (nonatomic, strong) NSObject <UserApi> * api;
@property (nonatomic, strong) NSMutableArray <NSObject<UserServiceObservable>*> * observers;

@end

@implementation UserServiceImpl
@synthesize user = _user;

- (instancetype)initWithUserRepository:(NSObject <UserRepository> *)repository
                     sessionRepository:(NSObject <SessionRepository> *)sessionRepository api:(NSObject <UserApi> *)api {
    if (self = [super init]) {
        self.repository = repository;
        self.sessionRepository = sessionRepository;
        self.observers = [NSMutableArray new];
        self.api = api;
    }

    return self;
}


- (User *)user {
    NSString * userId = [_sessionRepository currentUserId];
    User * usr = nil;
    if (userId != nil) {
        usr = [_repository findById:userId];
    }

    return usr;
}

- (User *)currentUser {
    return self.user;
}

- (void)login:(LoginParams *)params handler:(void (^)(NSError *error, User *user))handler {
    SignInParams * signInParams = [[SignInParams alloc] initWithUsername:params.username password:params.password];
    __weak typeof(self) weakSelf = self;
    [_api signIn:signInParams handler:^(NSError *error, Credential *credential) {
        if (error == nil) {
            [weakSelf.sessionRepository setCurrentUserId:params.username];
            handler ? handler(nil, [[User alloc] initWithUsername: params.username]) : nil;

            [weakSelf broadcastUpdateCredential];
        } else {
            handler ? handler(error, nil) : nil;
        }
    }];
}

- (void)broadcastUpdateCredential {
    [_observers enumerateObjectsUsingBlock:^(NSObject <UserServiceObservable> *obj, NSUInteger idx, BOOL *stop) {
        [obj currentUserHasBeenChanged];
    }];
}

- (void)addObserver:(NSObject <UserServiceObservable> *)observer {
    if ([self.observers containsObject:observer] == NO) {
        [self.observers addObject:observer];
    }
}


@end
