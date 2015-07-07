//
//  WSet.m
//  Ints
//
//  Created by William Falcon on 6/29/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import "WSet.h"

@interface WSet ()

@property (nonatomic, readwrite) NSMutableDictionary *lookUp;
@property (nonatomic) NSUInteger cnt;
@end

@implementation WSet

- (instancetype)initWithArray:(NSArray *)array {
    
    if (self = [super init]) {
        _lookUp = [NSMutableDictionary new];
        
        for (id item in array) {
            _lookUp[item] = [NSNull null];
            _cnt++;
        }
    }
    
    return self;
}

- (instancetype)initWithSet:(WSet *)set {
    
    if (self = [super init]) {
        
        _lookUp = [NSMutableDictionary new];
        [set.lookUp enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            _lookUp[key] = obj;
            _cnt++;
        }];
    }
    
    return self;
}

- (NSUInteger)count {
    return self.cnt;
}

- (BOOL)containsObject:(id)object {
    return self.lookUp[object] != nil;
}


@end




