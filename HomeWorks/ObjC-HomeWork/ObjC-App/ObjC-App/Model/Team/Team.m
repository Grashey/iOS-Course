//
//  Team.m
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import "Team.h"

@implementation Team

- (instancetype)initWithDictionary:(NSDictionary *) dictionary {
    self = [super init];
    if (self) {
        _name = [dictionary valueForKey:@"name"];
        _chassis = [dictionary valueForKey:@"chassis"];
        _engine = [dictionary valueForKey:@"engine"];
        _head = [dictionary valueForKey:@"head"];
        _base = [dictionary valueForKey:@"base"];
    }
    return self;
}

@end
