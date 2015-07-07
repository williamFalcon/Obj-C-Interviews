//
//  Random.h
//  Ints
//
//  Created by William Falcon on 6/28/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Random : NSObject

+ (bool)doesArray:(int[])array ofSize:(int)size containSubArrayThatAddsToValue:(int)value;
@end
