//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingService.h"

@protocol SettingRespository;


@interface SettingServiceImpl : NSObject <SettingService>

- (instancetype)initWithRepository:(NSObject <SettingRespository> *)repository;

@end