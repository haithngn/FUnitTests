//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ProjectEntity : NSObject

@property (nonatomic, strong) NSString * projectId;
@property (nonatomic, strong) NSString * projectName;

- (instancetype)initWithId:(NSString *)id andName:(NSString *)name;

@end