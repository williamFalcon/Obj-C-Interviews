//
//  Random.m
//  Ints
//
//  Created by William Falcon on 6/28/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import "Random.h"

@implementation Random


+ (bool)doesArray:(int[])array ofSize:(int)size containSubArrayThatAddsToValue:(int)value{
    
    int sum,i,j;
    
    for (i = 0; i< size; i++) {
        sum = array[i];
        
        for (j = i+1; j <= size; j++) {
            
            if (sum == value) {
                return true;
            }
            
            if (sum > value || j == size) {
                break;
            }

            sum += array[j];
        }
    }
    
    return false;
    
}

@end
