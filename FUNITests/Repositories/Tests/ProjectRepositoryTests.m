//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "ProjectRepositoryTests.h"
#import "ProjectRepository.h"
#import "ProjectRepositoryImpl.h"
#import "DBProjectRepoMocks.h"

@interface ProjectRepositoryTests ()

@property (nonatomic, strong) NSObject<ProjectRepository> * projectRepository;
@property (nonatomic, strong) DBProjectRepoMocks * dbProjectRepositoryMocks;
@end

@implementation ProjectRepositoryTests {

}

- (void)setUp {
    [super setUp];

    _dbProjectRepositoryMocks = [[DBProjectRepoMocks alloc] init];
    _projectRepository = [[ProjectRepositoryImpl alloc] initWithRepository:_dbProjectRepositoryMocks];
}

- (void)testCreateDefaultProjects {
    [_projectRepository createDefaultProjectsBelongTo:@"xxx"];

    XCTAssertEqual(_dbProjectRepositoryMocks.nbDefaultProject, 5, @"You must create 5 default projects");
    XCTAssertTrue([_dbProjectRepositoryMocks.project1Id isEqualToString:@"xxx_0"], @"First Default Project ID is not correct");
}

- (void)tearDown {
    [super tearDown];
}

@end