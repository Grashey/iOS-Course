//
//  ViewControllerFactory.m
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 03.10.2021.
//

#import "ViewControllerFactory.h"
#import "TeamListPresenter.h"
#import "TeamListTableViewController.h"
#import "TeamDetailTableViewController.h"
#import "TeamDetailPresenter.h"

@interface ViewControllerFactory ()

@end

@implementation ViewControllerFactory

- (UITableViewController *)createTeamListVC {
    TeamListTableViewController *controller = [TeamListTableViewController alloc];
    TeamListPresenter *presenter = [TeamListPresenter alloc];
    controller.presenter = presenter;
    presenter.controller = controller;
    return controller;
}

- (TeamDetailTableViewController *)createTeamDetailVC {
    TeamDetailTableViewController *controller = [TeamDetailTableViewController alloc];
    TeamDetailPresenter *presenter = [TeamDetailPresenter alloc];
    controller.presenter = presenter;
    presenter.controller = controller;
    return controller;
}

@end
