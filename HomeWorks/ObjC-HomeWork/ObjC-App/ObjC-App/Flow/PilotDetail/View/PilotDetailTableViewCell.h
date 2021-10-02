//
//  PilotDetailTableViewCell.h
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 02.10.2021.
//

#import <UIKit/UIKit.h>
#import "Pilot.h"

NS_ASSUME_NONNULL_BEGIN

@interface PilotDetailTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *countryLabel;
@property (nonatomic, strong) UILabel *achievementLabel;

-(void)configureWithPilot:(Pilot *) pilot;

@end

NS_ASSUME_NONNULL_END
