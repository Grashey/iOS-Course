//
//  PilotsTableViewController.m
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 02.10.2021.
//

#import "PilotsTableViewController.h"
#import "PilotDetailTableViewCell.h"
#define ReuseIdentifier @"CellIdentifier"

@interface PilotsTableViewController ()

@end

@implementation PilotsTableViewController

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _pilots.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PilotDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier];
    if (!cell) {
        cell = [[PilotDetailTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:ReuseIdentifier];
    }
    [cell configureWithPilot:_pilots[indexPath.row]];
    return cell;
}

@end
