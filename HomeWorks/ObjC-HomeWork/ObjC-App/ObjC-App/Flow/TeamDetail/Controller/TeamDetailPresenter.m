//
//  TeamDetailPresenter.m
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 03.10.2021.
//

#import <Foundation/Foundation.h>
#import "TeamDetailPresenter.h"
#import "PilotsTableViewController.h"
#import "DataManager.h"

@interface TeamDetailPresenter ()

@end

@implementation TeamDetailPresenter

- (UIViewController *)prepareVC{
    PilotsTableViewController *pilotsVC = [PilotsTableViewController alloc];
    pilotsVC.pilots = [self prepareTeam];
    return pilotsVC;
}

- (NSArray *)prepareTeam {
    NSArray *allPilots = [DataManager sharedInstance].pilots;
    NSPredicate *teamPredicate = [NSPredicate predicateWithFormat:@"team = %@", _team.name];
    NSArray *teamPilots = [allPilots filteredArrayUsingPredicate:teamPredicate];
    return teamPilots;
}

@end
