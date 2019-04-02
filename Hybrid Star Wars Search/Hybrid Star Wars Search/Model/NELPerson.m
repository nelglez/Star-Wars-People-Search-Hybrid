//
//  NELPerson.m
//  Hybrid Star Wars Search
//
//  Created by Nelson Gonzalez on 4/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import "NELPerson.h"

@implementation NELPerson

- (instancetype)initWithName:(NSString *)name birthYear:(NSString *)birthYear eyeColor:(NSString *)eyeColor height:(NSInteger)height
{
    self = [super init];
    if (self) {
        _name = [name copy];//I want to make a brand new copy
        _birthYear = [birthYear copy];
        _eyeColor = [eyeColor copy];
        _height = height;
        
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *name = dictionary[@"name"];
    NSString *birthYear = dictionary[@"birth_year"];
    NSString *eyeColor = dictionary[@"eye_color"];
    NSString *heightString = dictionary[@"height"];
    NSInteger height = [heightString integerValue];
    
    return [self initWithName:name birthYear:birthYear eyeColor:eyeColor height:height];
    
}


@end
