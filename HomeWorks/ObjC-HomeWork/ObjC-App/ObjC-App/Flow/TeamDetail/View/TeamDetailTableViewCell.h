//
//  TeamDetailTableViewCell.h
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import <UIKit/UIKit.h>
#import "Team.h"

NS_ASSUME_NONNULL_BEGIN

@interface TeamDetailTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *chassisLabel;
@property (nonatomic, strong) UILabel *engineLabel;
@property (nonatomic, strong) UILabel *headLabel;
@property (nonatomic, strong) UILabel *baseLabel;
@property (nonatomic, strong) UIButton *showPilotsButton;

-(void)configureWithTeam:(Team *) team;

@end

NS_ASSUME_NONNULL_END
