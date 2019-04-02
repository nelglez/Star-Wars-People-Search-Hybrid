//
//  NELPerson.h
//  Hybrid Star Wars Search
//
//  Created by Nelson Gonzalez on 4/1/19.
//  Copyright © 2019 Nelson Gonzalez. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//Typealias when used in swift

NS_SWIFT_NAME(Person)
@interface NELPerson : NSObject

//Designated init
- (instancetype)initWithName:(NSString *)name birthYear:(NSString *)birthYear eyeColor:(NSString *)eyeColor height:(NSInteger)height;

//Convenience init for the JSON dict
-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

//name
//birthYear
//eyeColor
//height

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *birthYear;
@property (nonatomic, copy) NSString *eyeColor;

//its primitive, value type. Not reference type like a class. Going to have a value
@property (nonatomic) NSInteger height;



@end

NS_ASSUME_NONNULL_END
