//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CreateProjectParams;

@protocol DBProjectRepository <NSObject>

- (void)createProjects:(NSArray <CreateProjectParams *> *)params;

@end