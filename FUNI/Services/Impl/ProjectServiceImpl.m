//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "ProjectServiceImpl.h"
#import "ProjectRepository.h"

@interface ProjectServiceImpl ()

@property (nonatomic, strong) NSObject <ProjectRepository> * repository;

@end

@implementation ProjectServiceImpl {

}

- (instancetype)initWithRepository:(NSObject <ProjectRepository> *) repository {
    if (self = [super init]) {
        self.repository = repository;
    }
    return self;
}

- (void)createDefaultProjectsBelongTo:(NSString *)username {
    [_repository createDefaultProjectsBelongTo:username];
}


@end