//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectService.h"

@protocol ProjectRepository;

@interface ProjectServiceImpl : NSObject <ProjectService>

- (instancetype)initWithRepository:(NSObject <ProjectRepository> *)repository;

@end