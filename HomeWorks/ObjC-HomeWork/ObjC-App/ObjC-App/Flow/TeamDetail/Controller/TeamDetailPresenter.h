//
//  TeamDetailPresenter.h
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 03.10.2021.
//

#import <UIKit/UIKit.h>
#import "Team.h"

NS_ASSUME_NONNULL_BEGIN

@interface TeamDetailPresenter : NSObject

@property (nonatomic, weak) UITableViewController *controller;
@property (nonatomic, strong) Team *team;

- (UIViewController *)prepareVC;

@end

NS_ASSUME_NONNULL_END
