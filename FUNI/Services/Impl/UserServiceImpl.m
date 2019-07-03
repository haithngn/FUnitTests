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
#import "SettingService.h"
#import "ProjectService.h"
#import "Configurations.h"

@interface UserServiceImpl ()

@property (nonatomic, strong) User * user;
@property (nonatomic, strong) NSObject<SessionRepository> * sessionRepository;
@property (nonatomic, strong) NSObject<UserRepository> * repository;
@property (nonatomic, strong) NSObject <UserApi> * api;
@property (nonatomic, strong) NSObject <SettingService> * settingService;
@property (nonatomic, strong) NSObject <ProjectService> * projectService;
@property (nonatomic, strong) NSMutableArray <NSObject<UserServiceObservable>*> * observers;
@property (nonatomic, strong) Configurations * configurations;

@end

@implementation UserServiceImpl
@synthesize user = _user;

- (instancetype)initWithUserRepository:(NSObject <UserRepository> *)repository
                     sessionRepository:(NSObject <SessionRepository> *)sessionRepository api:(NSObject <UserApi> *)api
                        settingService:(NSObject <SettingService> *)settingService
                        projectService:(NSObject <ProjectService> *) projectService
                        configurations:(Configurations *)configurations {
    if (self = [super init]) {
        self.repository = repository;
        self.sessionRepository = sessionRepository;
        self.observers = [NSMutableArray new];
        self.api = api;
        self.settingService = settingService;
        self.projectService = projectService;
        self.configurations = configurations;
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
    NSString * hashedPwd = [NSString stringWithFormat:@"%@_%@", params.password, _configurations.secret];
    SignInParams * signInParams = [[SignInParams alloc] initWithUsername:params.username
                                                                password:hashedPwd];
    __weak typeof(self) weakSelf = self;
    [_api signIn:signInParams handler:^(NSError *error, Credential *credential) {
        if (error == nil) {
            [weakSelf.sessionRepository setCurrentUserId:params.username];
            [weakSelf.settingService createSetting:params.username];
            [weakSelf.projectService createDefaultProjectsBelongTo:params.username];
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
