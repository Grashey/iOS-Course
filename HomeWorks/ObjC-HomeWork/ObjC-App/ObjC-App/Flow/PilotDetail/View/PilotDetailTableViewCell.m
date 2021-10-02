//
//  PilotDetailTableViewCell.m
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 02.10.2021.
//

#import "PilotDetailTableViewCell.h"

@implementation PilotDetailTableViewCell

double pilotDetailRowHeight = 30.0;
double pilotDetailInset = 10.0;
double pilotDetailFontSize = 15.0;


- (void)prepareForReuse{
    [super prepareForReuse];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addSubviews];
        [self addConstraints];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(pilotDetailInset, pilotDetailInset, [UIScreen mainScreen].bounds.size.width - 2*pilotDetailInset, self.frame.size.height);
}

- (void)addSubviews {
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, pilotDetailRowHeight)];
    _nameLabel.font = [UIFont boldSystemFontOfSize:pilotDetailFontSize];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _countryLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 3*pilotDetailRowHeight, self.contentView.frame.size.width, pilotDetailRowHeight)];
    _countryLabel.font = [UIFont systemFontOfSize:pilotDetailFontSize weight:UIFontWeightLight];
    _countryLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    //TODO: нужна динамическая высота 
    _achievementLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 4*pilotDetailRowHeight, self.contentView.frame.size.width, pilotDetailRowHeight)];
    _achievementLabel.font = [UIFont systemFontOfSize:pilotDetailFontSize weight:UIFontWeightLight];
    _achievementLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_countryLabel];
    [self.contentView addSubview:_achievementLabel];
}

- (void)addConstraints {
    [_nameLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [_countryLabel.topAnchor constraintEqualToAnchor:_nameLabel.bottomAnchor].active = YES;
    [_achievementLabel.topAnchor constraintEqualToAnchor:_countryLabel.bottomAnchor].active = YES;
    [_achievementLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-pilotDetailInset].active = YES;
}

// хардкод вместо парных лейблов
- (void) configureWithPilot:(Pilot *)pilot {
    _nameLabel.text = [NSString stringWithFormat:@"%@. %@", pilot.number, pilot.name];
    _countryLabel.text = [NSString stringWithFormat:@"Country: %@", pilot.country];
    _achievementLabel.text = [NSString stringWithFormat:@"Highest Champ position: %@", pilot.achievement];
}

@end
