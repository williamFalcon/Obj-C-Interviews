//
//  SelectionSort.m
//  Ints
//
//  Created by William Falcon on 7/1/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import "SelectionSort.h"

@implementation SelectionSort

+ (void)selectionSortArray:(int [])array size:(int)size {
    
    for (int i = 0; i < size; i++) {
        
        int min = array[i];
        
        for (int j = i+1; j< size; j++) {
            int potentialMin = array[j];
            
            if (potentialMin < min) {
                min = potentialMin;
                array[j] = array[i];
                array[i] = min;
            }
        }
    }
}

@end
