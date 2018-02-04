//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserService.h"

@protocol UserRepository;
@protocol SessionRepository;
@protocol UserApi;
@protocol ProjectService;
@protocol SettingService;

@interface UserServiceImpl : NSObject <UserService>

- (instancetype)initWithUserRepository:(NSObject <UserRepository> *)repository
                     sessionRepository:(NSObject <SessionRepository> *)sessionRepository
                                   api:(NSObject <UserApi> *)api
                        settingService:(NSObject <SettingService> *)settingService
                        projectService:(NSObject <ProjectService> *)projectService;

@end