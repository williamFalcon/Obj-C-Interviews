#import "MergeSort.h"

@implementation MergeSort

+ (void) mergeSortArray:(int[])array size:(int)size{

    [MergeSort mergeSortArray:array size:size left:0 right:size-1];
}


+ (void)mergeSortArray:(int[])array size:(int)size left:(int)left right:(int)right {
    
    //base case
    if (left < right) {
        
        //find middle
        int middle = (left + (right - left)) / 2;
        
        //split left
        [MergeSort mergeSortArray:array size:size left:0 right:middle];
        
        //split right
        [MergeSort mergeSortArray:array size:size left:middle+1 right:right];
        
        //merge step
        [MergeSort mergeArray:array size:size leftStart:left rightStart:middle+1 rightEnd:right];
    }
}

+ (void)mergeArray:(int[])array size:(int)size leftStart:(int)leftStart rightStart:(int)rightStart rightEnd:(int)rightEnd {
    
    //leftEnd for left half
    int leftEnd = rightStart - 1;
    
    //size for results array
    int resultsSize = rightEnd - leftStart + 1;
    
    //init results array
    int results[resultsSize];
    
    //resultsIndex point to start of results array
    int resultsIndex = 0;
    
    //merge both halves
    while (leftStart <= leftEnd && rightStart <= rightEnd) {
        
        //grab both values (left, right)
        int left = array[leftStart];
        int right = array[rightStart];
        
        //if left < right, put in results at index
        if (left < right) {
            results[resultsIndex++] = array[leftStart++];
        }else {
            results[resultsIndex++] = array[rightStart++];
        }
    }
    
    //merge remaining on left
    while (leftStart <= leftEnd) {
        results[resultsIndex++] = array[leftStart++];
    }
    
    //merge remaining on right
    while (rightStart <= rightEnd) {
        results[resultsIndex++] = array[rightStart++];
    }
    
    //copy all values from results into inputArray
    for (int i = 0; i < resultsSize ; i++) {
        array[i] = results[i];
    }
}

@end








