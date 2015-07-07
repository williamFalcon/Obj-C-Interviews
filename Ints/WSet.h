//
//  WSet.h
//  Ints
//
//  Created by William Falcon on 6/29/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WSet : NSObject

@property (nonatomic, readonly) NSMutableDictionary *lookUp;

-(instancetype)initWithArray:(NSArray *)array;
- (instancetype)initWithSet:(WSet *)set;
- (BOOL) containsObject:(id)object;
- (NSUInteger)count;

@end
