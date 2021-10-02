//
//  TeamListTableViewController.m
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import "TeamListTableViewController.h"
#import "TeamDetailTableViewController.h"
#import "DataManager.h"
#define ReuseIdentifier @"CellIdentifier"

@interface TeamListTableViewController ()
@property (nonatomic, strong) NSArray *teamsArray;
@end

@implementation TeamListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Formula One Teams";
    
    DataManager *manager = [[DataManager alloc] init];
    [manager loadData];
    _teamsArray = [manager teams];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_teamsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:ReuseIdentifier];
    }
    Team *team = _teamsArray[indexPath.row];
    cell.textLabel.text = team.name;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TeamDetailTableViewController *teamDetailVC = [TeamDetailTableViewController alloc];
    teamDetailVC.team = _teamsArray[indexPath.row];
    [self.navigationController pushViewController: teamDetailVC animated:YES];
}

@end
