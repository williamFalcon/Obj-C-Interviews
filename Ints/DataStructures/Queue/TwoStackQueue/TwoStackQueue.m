//
//  TwoStackQueue.m
//  Ints
//
//  Created by William Falcon on 7/1/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import "TwoStackQueue.h"
#import "Stack.h"

@interface TwoStackQueue()

@property(nonatomic, strong) Stack *inStack;
@property(nonatomic, strong) Stack *outStack;

@end

@implementation TwoStackQueue


-(instancetype)init {
    
    if (self = [super init]) {
        _inStack = [Stack new];
        _outStack = [Stack new];
    }
    
    return self;
}

- (void)enqueueValue:(id)value {
    
    //push in stack
    [self.inStack push:value];
}

- (id)dequeue {
    
    //if outstack is empty
    //push all from instack to outstack
    if (self.outStack.count == 0) {
        while (self.inStack.count != 0 ) {
            [self.outStack push:[self.inStack pop]];
        }
    }

    return [self.outStack pop];
}


//enq push into in stack
@end
