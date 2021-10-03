//
//  ViewControllerAbstractFactory.h
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 03.10.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewControllerAbstractFactory

- (UITableViewController *)createTeamListVC;
- (UITableViewController *)createTeamDetailVC;

@end

NS_ASSUME_NONNULL_END
