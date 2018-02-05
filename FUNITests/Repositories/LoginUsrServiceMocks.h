//
//  LoginUsrServiceMocks.h
//  FUNI
//
//  Created by lcl on 2/5/18.
//  Copyright © 2018 Floware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserService.h"

@interface LoginUsrServiceMocks : NSObject <UserService>

@property (nonatomic, readonly) BOOL callLogin;

@end
