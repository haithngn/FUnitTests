//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "Dependences.h"
#import "UserService.h"
#import "UserServiceImpl.h"
#import "UserRepositoryImpl.h"
#import "SessionRepositoryImpl.h"
#import "UserApiImpl.h"

@interface Dependences ()

@property (nonatomic, strong) NSObject<UserService> * insternalUserService;
@property (nonatomic, strong) NSObject<UserRepository> * internalUserRepository;
@property (nonatomic, strong) NSObject<SessionRepository> * internalSessionRepository;
@property (nonatomic, strong) NSObject<UserApi> * internalUserApi;

@end

@implementation Dependences {
@private
    NSObject <UserService> *_insternalUserService;
    NSObject <UserRepository> *_internalUserRepository;
    NSObject <SessionRepository> *_internalSessionRepository;
    NSObject <UserApi> *_internalUserApi;
}

@synthesize insternalUserService = _insternalUserService;
@synthesize internalUserRepository = _internalUserRepository;
@synthesize internalSessionRepository = _internalSessionRepository;
@synthesize internalUserApi = _internalUserApi;

+ (instancetype)instance {
    static Dependences *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[Dependences alloc] init];
    });

    return sharedInstance;
}

- (NSObject <UserService> *)insternalUserService {
    if (_insternalUserService == nil) {
        _insternalUserService = [[UserServiceImpl alloc] initWithUserRepository:self.internalUserRepository
                                                     sessionRepository:self.internalSessionRepository api:self.internalUserApi];
    }

    return _insternalUserService;
}

- (NSObject <UserRepository> *)internalUserRepository {
    if (_internalUserRepository == nil) {
        _internalUserRepository = [[UserRepositoryImpl alloc] init];
    }

    return _internalUserRepository;
}

- (NSObject <SessionRepository> *)internalSessionRepository {
    if (_internalSessionRepository == nil) {
        _internalSessionRepository = [[SessionRepositoryImpl alloc] init];
    }

    return _internalSessionRepository;
}

- (NSObject <UserApi> *)internalUserApi {
    if (_internalUserApi == nil) {
        _internalUserApi = [[UserApiImpl alloc] init];
    }

    return _internalUserApi;
}

+ (NSObject <UserService> *)userService {
    return [Dependences instance].insternalUserService;
}

@end