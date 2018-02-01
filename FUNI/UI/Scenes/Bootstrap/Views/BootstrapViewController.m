//
// Created by Hai on 1/31/18.
// Copyright (c) 2018 Floware. All rights reserved.
//

#import "BootstrapViewController.h"
#import "BootstrapViewModel.h"
#import "Storyboards.h"
#import "Dependences.h"

@interface BootstrapViewController ()

@property (nonatomic, strong) BootstrapViewModel * model;

@end

@implementation BootstrapViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    _model = [[BootstrapViewModel alloc] initWithUserService:[Dependences userService]];

    [self bindEvents];

    [_model load];
}

- (void)bindEvents {
    __weak typeof(self) weakSelf = self;
    _model.onSignedIn = ^{
        [weakSelf navigateToMainScreen];
    };
    _model.onSignedOut = ^{
        [weakSelf navigateToAuthorizeScreen];
    };
}

- (void)navigateToMainScreen {
    self.viewControllers = @[[[Storyboards main] instantiateViewControllerWithIdentifier:@"MainViewController"]];
}

- (void)navigateToAuthorizeScreen {
    self.viewControllers = @[[[Storyboards main] instantiateViewControllerWithIdentifier:@"AuthorizeViewController"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
