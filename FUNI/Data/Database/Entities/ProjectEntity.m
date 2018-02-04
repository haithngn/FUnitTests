//
// Created by Hai Nguyen Thanh on 2/4/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "ProjectEntity.h"


@implementation ProjectEntity {

}

- (instancetype)initWithId:(NSString *)id1 andName:(NSString *)name {
    if (self = [super init]) {
        _projectId = id1;
        _projectName = name;
    }

    return self;
}


@end