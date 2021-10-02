//
//  TeamListViewController.h
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import <UIKit/UIKit.h>
#import "TeamListPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface TeamListTableViewController : UITableViewController

@property (nonatomic, strong) TeamListPresenter *presenter;

@end

NS_ASSUME_NONNULL_END
