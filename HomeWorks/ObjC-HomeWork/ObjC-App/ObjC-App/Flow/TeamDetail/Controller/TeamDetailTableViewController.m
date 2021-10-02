//
//  TeamDetailTableViewController.m
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import "TeamDetailTableViewController.h"
#import "PilotsTableViewController.h"
#import "TeamDetailTableViewCell.h"
#import "DataManager.h"
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
    [cell configureWithTeam:_team];
    [cell.showPilotsButton addTarget:self action:@selector(showTeamPilots) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)showTeamPilots {
    PilotsTableViewController *pilotsVC = [PilotsTableViewController alloc];
    DataManager *manager = [[DataManager alloc] init];
    [manager loadData];
    NSArray *allPilots = [manager pilots];
    NSPredicate *teamPredicate = [NSPredicate predicateWithFormat:@"team = %@", _team.name];
    pilotsVC.pilots = [allPilots filteredArrayUsingPredicate:teamPredicate];
    pilotsVC.title = [NSString stringWithFormat:@"%@", _team.name];
    [self.navigationController pushViewController: pilotsVC animated:YES];
}

@end
