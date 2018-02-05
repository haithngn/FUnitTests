//
//  LoginUsrServiceMocks.m
//  FUNI
//
//  Created by lcl on 2/5/18.
//  Copyright © 2018 Floware. All rights reserved.
//

#import "LoginUsrServiceMocks.h"

@interface LoginUsrServiceMocks ()

@property (nonatomic, assign) BOOL callLogin;

@end

@implementation LoginUsrServiceMocks

- (instancetype)init {
    if (self = [super init]) {
        _callLogin = NO;
    }
    
    return self;
}

- (User*)currentUser {
    return nil;
}

- (void)login:(LoginParams*)params handler:(void (^)(NSError* error, User * user))handler {
    _callLogin = YES;
}
- (void)addObserver:(NSObject<UserServiceObservable> *) observer {
    
}

@end
