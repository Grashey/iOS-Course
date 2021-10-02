//
//  Team.h
//  ObjC-HomeWork
//
//  Created by Aleksandr Fetisov on 01.10.2021.
//

#import <Foundation/Foundation.h>

@interface Team: NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *chassis;
@property (nonatomic, strong) NSString *engine;
@property (nonatomic, strong) NSString *head;
@property (nonatomic, strong) NSString *base;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
