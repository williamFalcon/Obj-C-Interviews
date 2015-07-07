//
//  User.m
//  Ints
//
//  Created by William Falcon on 7/1/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import "User.h"

@implementation User

- (NSString *)description {
    return [NSString stringWithFormat:@"first:%@, last: %@, social:%@",self.firstName, self.lastName, self.social];
}

-(id)copyWithZone:(NSZone *)zone {
    User *user = [[self class]allocWithZone:zone];
    if (user) {
        user.firstName = self.firstName;
        user.lastName = self.lastName;
        user.social = self.social;
    }
    return user;
}

- (BOOL)isEqual:(id)object {
    
    User *u = object;
    return (self.firstName == u.firstName && (self.lastName == u.lastName) && (self.social == u.social));
}

- (NSUInteger)hash {
    NSUInteger prime = 31;
    NSUInteger result = 1;
    
    result = prime * result + [self.firstName hash];
    result = prime * result + [self.lastName hash];
    result = prime * result + [self.social hash];
    
    return result;
}

@end
