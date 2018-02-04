//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProjectRepository.h"

@protocol DBProjectRepository;


@interface ProjectRepositoryImpl : NSObject <ProjectRepository>

- (instancetype)initWithRepository:(NSObject <DBProjectRepository> *)repository;

@end