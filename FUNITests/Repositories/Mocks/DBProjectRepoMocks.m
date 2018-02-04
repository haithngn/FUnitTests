//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "DBProjectRepoMocks.h"
#import "CreateProjectParams.h"


@implementation DBProjectRepoMocks {

}

- (void)createProjects:(NSArray <CreateProjectParams *> *)params {
    if (params.count > 4) {
        _project1Id = params[0].projectId;
        _project2Id = params[1].projectId;
        _project3Id = params[2].projectId;
        _project4Id = params[3].projectId;
        _project5Id = params[4].projectId;
    }

    _nbDefaultProject = params.count;
}


@end