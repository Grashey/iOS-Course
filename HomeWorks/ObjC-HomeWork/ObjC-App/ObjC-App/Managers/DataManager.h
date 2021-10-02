//
//  DataManager.h
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import "Team.h"
#import "Pilot.h"

typedef enum DataSourceType {
    DataSourceTypeTeam,
    DataSourceTypePilot
} DataSourceType;

@interface DataManager : NSObject

+ (instancetype)sharedInstance;

- (void)loadData;

@property (nonatomic, strong, readonly) NSArray *teams;
@property (nonatomic, strong, readonly) NSArray *pilots;

@end
