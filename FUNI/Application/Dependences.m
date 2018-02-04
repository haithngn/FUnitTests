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
#import "SettingService.h"
#import "SettingRespository.h"
#import "ProjectService.h"
#import "ProjectRepository.h"
#import "SettingServiceImpl.h"
#import "SettingRepositoryImpl.h"
#import "ProjectRepositoryImpl.h"
#import "ProjectServiceImpl.h"
#import "Configurations.h"

@interface Dependences ()

@property (nonatomic, strong) NSObject<UserService> * internalUserService;
@property (nonatomic, strong) NSObject<UserRepository> * internalUserRepository;
@property (nonatomic, strong) NSObject<SessionRepository> * internalSessionRepository;
@property (nonatomic, strong) NSObject<UserApi> * internalUserApi;

@property (nonatomic, strong) NSObject<SettingRespository> * internalSettingRepository;
@property (nonatomic, strong) NSObject<SettingService> * internalSettingService;

@property (nonatomic, strong) NSObject<ProjectRepository> * internalProjectRepository;
@property (nonatomic, strong) NSObject<ProjectService> * internalProjectService;

@end

@implementation Dependences {
@private
    NSObject <UserService> *internalUserService;
    NSObject <UserRepository> *_internalUserRepository;
    NSObject <SessionRepository> *_internalSessionRepository;
    NSObject <UserApi> *_internalUserApi;
    NSObject <SettingRespository> *_internalSettingRepository;
    NSObject <SettingService> *_internalSettingService;
    NSObject <ProjectRepository> *_internalProjectRepository;
    NSObject <ProjectService> *_internalProjectService;
}

@synthesize internalUserService = _internalUserService;
@synthesize internalUserRepository = _internalUserRepository;
@synthesize internalSessionRepository = _internalSessionRepository;
@synthesize internalUserApi = _internalUserApi;
@synthesize internalSettingRepository = _internalSettingRepository;
@synthesize internalSettingService = _internalSettingService;
@synthesize internalProjectRepository = _internalProjectRepository;
@synthesize internalProjectService = _internalProjectService;

+ (instancetype)instance {
    static Dependences *sharedInstance = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        sharedInstance = [[Dependences alloc] init];
    });

    return sharedInstance;
}

- (NSObject <UserService> *)internalUserService {
    if (_internalUserService == nil) {
        _internalUserService = [[UserServiceImpl alloc] initWithUserRepository:self.internalUserRepository
                                                     sessionRepository:self.internalSessionRepository
                                                                           api:self.internalUserApi
                                                                settingService:self.internalSettingService
                                                                projectService:self.internalProjectService
                                                                configurations:[Configurations instance]];
    }

    return _internalUserService;
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

- (NSObject <SettingRespository> *)internalSettingRepository {
    if (_internalSettingRepository == nil) {
        _internalSettingRepository = [[SettingRepositoryImpl alloc] init];
    }

    return _internalSettingRepository;
}

- (NSObject <SettingService> *)internalSettingService {
    if (_internalSettingService == nil) {
        _internalSettingService = [[SettingServiceImpl alloc] initWithRepository:self.internalSettingRepository];
    }

    return _internalSettingService;
}

- (NSObject <ProjectRepository> *)internalProjectRepository {
    if (_internalProjectRepository == nil) {
        _internalProjectRepository = [[ProjectRepositoryImpl alloc] init];
    }

    return _internalProjectRepository;
}

- (NSObject <ProjectService> *)internalProjectService {
    if (_internalProjectService == nil) {
        _internalProjectService = [[ProjectServiceImpl alloc] initWithRepository:self.internalProjectRepository];
    }

    return _internalProjectService;
}

#pragma mark - Class Methods

+ (NSObject <UserService> *)userService {
    return [Dependences instance].internalUserService;
}

+ (NSObject <SettingService> *)settingService {
    return [Dependences instance].internalSettingService;
}

+ (NSObject <ProjectService> *)projectService {
    return [Dependences instance].internalProjectService;
}


@end