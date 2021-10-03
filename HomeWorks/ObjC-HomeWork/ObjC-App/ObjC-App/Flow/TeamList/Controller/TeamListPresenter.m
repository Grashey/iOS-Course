//
//  TeamListPresenter.m
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 02.10.2021.
//

#import "TeamListPresenter.h"
#import "ViewControllerFactory.h"
#import "DataManager.h"
#import "TeamDetailTableViewController.h"

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
    UITableViewController *controller = [[ViewControllerFactory alloc] createTeamDetailVC];
    ((TeamDetailTableViewController *)controller).presenter.team = _teamsArray[index];
    return controller;
}

@end
