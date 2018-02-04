//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBProjectRepository.h"

@interface DBProjectRepoMocks : NSObject <DBProjectRepository>

@property (nonatomic, readonly) NSString * project1Id;
@property (nonatomic, readonly) NSString * project2Id;
@property (nonatomic, readonly) NSString * project3Id;
@property (nonatomic, readonly) NSString * project4Id;
@property (nonatomic, readonly) NSString * project5Id;
@property (nonatomic, readonly) NSInteger nbDefaultProject;

@end