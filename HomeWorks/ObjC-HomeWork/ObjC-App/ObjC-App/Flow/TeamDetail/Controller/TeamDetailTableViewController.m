//
//  TeamDetailTableViewController.m
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import "TeamDetailTableViewController.h"
#import "TeamDetailTableViewCell.h"
#define ReuseIdentifier @"CellIdentifier"

@interface TeamDetailTableViewController ()

@end

@implementation TeamDetailTableViewController

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[TeamDetailTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:ReuseIdentifier];
    }
    [cell configureWithTeam:_presenter.team];
    [cell.showPilotsButton addTarget:self action:@selector(showTeamPilots) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)showTeamPilots {
    [self.navigationController pushViewController: [_presenter prepareVC] animated:YES];
}

@end
