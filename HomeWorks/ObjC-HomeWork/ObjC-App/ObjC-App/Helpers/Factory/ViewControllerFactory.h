//
//  ViewControllerFactory.h
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 03.10.2021.
//

#import <UIKit/UIKit.h>
#import "ViewControllerAbstractFactory.h"

@interface ViewControllerFactory: NSObject <ViewControllerAbstractFactory>

- (UITableViewController *)createTeamListVC;
- (UITableViewController *)createTeamDetailVC;

@end

