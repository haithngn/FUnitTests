//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "ProjectRepositoryImpl.h"
#import "DBProjectRepository.h"
#import "CreateProjectParams.h"

@interface ProjectRepositoryImpl ()

@property (nonatomic, strong) NSObject <DBProjectRepository> * repository;

@end

@implementation ProjectRepositoryImpl {

}

- (instancetype)initWithRepository:(NSObject <DBProjectRepository> *)repository {
    self = [super init];
    if (self) {
        self.repository = repository;
    }

    return self;
}

- (void)createDefaultProjectsBelongTo:(NSString *)username {
    NSMutableArray <CreateProjectParams*> * params = [NSMutableArray new];

    for (int i = 0; i < 1; ++i) {
        NSString * projId = [NSString stringWithFormat:@"%@_%d", username, i];
        [params addObject:[[CreateProjectParams alloc] initWithId:projId andName:projId]];
    }

    [_repository createProjects:params];
}

@end
