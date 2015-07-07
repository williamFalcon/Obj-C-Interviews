/*
Quicksort:
	Quicksort Function:
		1. terminate when left >= right. (Index went over)
		2. Partition array, get an index back
		3. quicksort left
		4. quicksort right

	Partition:
		1. find midindex
		2. pivot is item at midindex
		3. move pivot to beginning of array (swap with first item)
		4. create two i (left side of subarray +1),j (right edge of sub array) pointers
		5. Move i,j into each other from opposite sides
			a. Move i left -> right (while i <= j && array[i] <= pivot)
			b. Move j right <- left (while i<= j && array[i] > pivot)
			c. swap i,j items if i<j
		6. put pivot back in original spot
		7. return i-1 as the new partition index
*/

#import "Quicksort.h"

@implementation Quicksort

+ (void)quicksortArray:(int [])array size:(int)size {
    
    [Quicksort quicksortArray:array left:0 right:size-1];
}

+(void)quicksortArray:(int[])array left:(int)left right:(int)right {
    
    if (left < right) {
        int partition = [Quicksort partitionArray:array left:left right:right];
        
        [Quicksort quicksortArray:array left:left right:partition - 1];
        [Quicksort quicksortArray:array left:partition+1 right:right];
    }
}

+ (int) partitionArray:(int[])array left:(int)left right:(int)right {
    
    //find pivot
    int middleIdx = (left + (right - left)) / 2;
    int pivot = array[middleIdx];
    
    [Quicksort array:array exchangeObjectAtIndex:middleIdx withObjectAtIndex:left];
    
    int i = left +1;
    int j = right;
    
    while (i <= j) {
        
        while (i<=j && array[i] <= pivot) {
            i++;
        }
        
        while (i<=j && array[j] > pivot) {
            j--;
        }
        
        if (i<j) {
            [Quicksort array:array exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
    }
    
    [Quicksort array:array exchangeObjectAtIndex:left withObjectAtIndex:i-1];
    return i-1;
}

+ (void)array:(int [])array exchangeObjectAtIndex:(NSInteger)first withObjectAtIndex:(NSInteger)second {
    
    int a = array[first];
    int b = array[second];
    
    array[first] = b;
    array[second] = a;
}

@end



















