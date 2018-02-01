//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserService;

@interface Dependences : NSObject

+ (NSObject<UserService> *)userService;

@end