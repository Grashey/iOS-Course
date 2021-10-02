//
//  Pilot.h
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import <Foundation/Foundation.h>

@interface Pilot: NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *number;
@property (nonatomic, strong) NSString *team;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *achievement;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
