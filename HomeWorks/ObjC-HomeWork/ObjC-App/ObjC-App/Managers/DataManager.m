//
//  DataManager.m
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import "DataManager.h"

@interface DataManager ()
@property (nonatomic, strong) NSMutableArray *teamsArray;
@property (nonatomic, strong) NSMutableArray *pilotsArray;
@end

@implementation DataManager

- (void)loadData {
        NSArray *teamsJsonArray = [self arrayFromFileName:@"teams" ofType:@"json"];
        self.teamsArray = [self createObjectsFromArray:teamsJsonArray withType: DataSourceTypeTeam];
        
        NSArray *pilotsJsonArray = [self arrayFromFileName:@"pilots" ofType:@"json"];
        self.pilotsArray = [self createObjectsFromArray:pilotsJsonArray withType: DataSourceTypePilot];
}

- (NSMutableArray *)createObjectsFromArray:(NSArray *)array withType:(DataSourceType)type {
    NSMutableArray *results = [NSMutableArray new];
    
    for (NSDictionary *jsonObject in array) {
        if (type == DataSourceTypeTeam) {
            Team *team = [[Team alloc] initWithDictionary: jsonObject];
            [results addObject: team];
        }
        else if (type == DataSourceTypePilot) {
            Pilot *pilot = [[Pilot alloc] initWithDictionary: jsonObject];
            [results addObject: pilot];
        }
    }
    return results;
}

- (NSArray *)arrayFromFileName:(NSString *)fileName ofType:(NSString *)type {
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

- (NSArray *)teams {
    return _teamsArray;
}

- (NSArray *)pilots {
    return _pilotsArray;
}

@end

