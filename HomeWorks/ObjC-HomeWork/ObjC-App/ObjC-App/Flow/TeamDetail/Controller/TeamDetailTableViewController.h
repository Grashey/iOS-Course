//
//  TeamDetailTableViewController.h
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import <UIKit/UIKit.h>
#import "Team.h"

NS_ASSUME_NONNULL_BEGIN

@interface TeamDetailTableViewController : UITableViewController

@property (nonatomic, strong) Team *team;

@end

NS_ASSUME_NONNULL_END
