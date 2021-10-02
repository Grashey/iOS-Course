//
//  TeamDetailTableViewCell.m
//  ObjC-App
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import "TeamDetailTableViewCell.h"

@implementation TeamDetailTableViewCell

double teamDetailRowHeight = 30.0;
double teamDetailInset = 10.0;
double teamDetailFontSize = 15.0;


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
    
    self.contentView.frame = CGRectMake(teamDetailInset, teamDetailInset, [UIScreen mainScreen].bounds.size.width - 2*teamDetailInset, self.frame.size.height);
}

- (void)addSubviews {
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, teamDetailRowHeight)];
    _nameLabel.font = [UIFont systemFontOfSize:teamDetailFontSize weight:UIFontWeightLight];
    _nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _baseLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, teamDetailRowHeight, self.contentView.frame.size.width, teamDetailRowHeight)];
    _baseLabel.font = [UIFont systemFontOfSize:teamDetailFontSize weight:UIFontWeightLight];
    _baseLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 2*teamDetailRowHeight, self.contentView.frame.size.width, teamDetailRowHeight)];
    _headLabel.font = [UIFont systemFontOfSize:teamDetailFontSize weight:UIFontWeightLight];
    _headLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _engineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 3*teamDetailRowHeight, self.contentView.frame.size.width, teamDetailRowHeight)];
    _engineLabel.font = [UIFont systemFontOfSize:teamDetailFontSize weight:UIFontWeightLight];
    _engineLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _chassisLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 4*teamDetailRowHeight, self.contentView.frame.size.width, teamDetailRowHeight)];
    _chassisLabel.font = [UIFont systemFontOfSize:teamDetailFontSize weight:UIFontWeightLight];
    _chassisLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    _showPilotsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 5*teamDetailRowHeight, self.contentView.frame.size.width, teamDetailRowHeight)];
    [_showPilotsButton setTitle:@"Team pilots >>" forState:UIControlStateNormal];
    [_showPilotsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _showPilotsButton.titleLabel.font = [UIFont boldSystemFontOfSize:teamDetailFontSize];
    _showPilotsButton.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_baseLabel];
    [self.contentView addSubview:_headLabel];
    [self.contentView addSubview:_engineLabel];
    [self.contentView addSubview:_chassisLabel];
    [self.contentView addSubview:_showPilotsButton];
}

- (void)addConstraints {
    [_nameLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor].active = YES;
    [_baseLabel.topAnchor constraintEqualToAnchor:_nameLabel.bottomAnchor].active = YES;
    [_headLabel.topAnchor constraintEqualToAnchor:_baseLabel.bottomAnchor].active = YES;
    [_engineLabel.topAnchor constraintEqualToAnchor:_headLabel.bottomAnchor].active = YES;
    [_chassisLabel.topAnchor constraintEqualToAnchor:_engineLabel.bottomAnchor].active = YES;
    [_showPilotsButton.topAnchor constraintEqualToAnchor:_chassisLabel.bottomAnchor].active = YES;
    [_showPilotsButton.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-teamDetailInset].active = YES;
}

// хардкод вместо парных лейблов
- (void) configureWithTeam:(Team *)team {
    _nameLabel.text = [NSString stringWithFormat:@"Team Name: %@", team.name];
    _baseLabel.text = [NSString stringWithFormat:@"Base: %@", team.base];
    _headLabel.text = [NSString stringWithFormat:@"Team Chief: %@", team.head];
    _engineLabel.text = [NSString stringWithFormat:@"Power Unit: %@", team.engine];
    _chassisLabel.text = [NSString stringWithFormat:@"Chassis: %@", team.chassis];
}

@end
