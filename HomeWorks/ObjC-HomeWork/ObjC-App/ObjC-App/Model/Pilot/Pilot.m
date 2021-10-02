//
//  Pilot.m
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import "Pilot.h"

@implementation Pilot

- (instancetype)initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    if (self) {
        _name = [dictionary valueForKey:@"name"];
        _team = [dictionary valueForKey:@"team"];
        _number = [dictionary valueForKey:@"number"];
        _achievement = [dictionary valueForKey:@"achievement"];
        _country = [dictionary valueForKey:@"country"];
    }
    return self;
}

@end
