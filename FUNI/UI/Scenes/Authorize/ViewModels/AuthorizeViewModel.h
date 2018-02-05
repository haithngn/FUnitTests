//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseViewModel.h"

@protocol UserService;

@interface AuthorizeViewModel : BaseViewModel

@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * password;

@property (nonatomic, copy) void (^onDisableSubmit)(BOOL enable);

- (id)initWithUserService:(NSObject <UserService> *)userService;
- (void)login;

@end
