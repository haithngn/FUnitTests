//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserService;
@protocol SettingService;
@protocol ProjectService;

@interface Dependences : NSObject

+ (NSObject<UserService> *)userService;
+ (NSObject<SettingService> *)settingService;
+ (NSObject<ProjectService> *)projectService;

@end