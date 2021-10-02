//
//  TeamListPresenter.h
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 02.10.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TeamListPresenter : NSObject

@property (nonatomic, weak) UITableViewController *controller;
@property (nonatomic, strong) NSArray *teamsArray;

- (void)getData;
- (NSString *)makeModel:(NSInteger)index;
- (UIViewController *)prepareVC:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
