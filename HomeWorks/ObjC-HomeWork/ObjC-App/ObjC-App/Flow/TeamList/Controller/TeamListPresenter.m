//
//  TeamListPresenter.m
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 02.10.2021.
//

#import "TeamListPresenter.h"
#import "TeamDetailTableViewController.h"
#import "TeamDetailPresenter.h"
#import "DataManager.h"

@interface TeamListPresenter ()

@end

@implementation TeamListPresenter

- (void)getData {
    [[DataManager sharedInstance] loadData];
    _teamsArray = [DataManager sharedInstance].teams;
    [_controller.tableView reloadData];
}

- (NSString *)makeModel:(NSInteger)index {
    Team *team = _teamsArray[index];
    return  team.name;
}

- (UIViewController *)prepareVC:(NSInteger)index {
    TeamDetailTableViewController *controller = [[TeamDetailTableViewController alloc] init];
    TeamDetailPresenter *presenter = [[TeamDetailPresenter alloc] init];
    presenter.team = _teamsArray[index];
    controller.presenter = presenter;
    presenter.controller = controller;
    return controller;
}

@end
