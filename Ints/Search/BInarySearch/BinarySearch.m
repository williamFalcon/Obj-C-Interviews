#import "BinarySearch.h"

@implementation BinarySearch

+ (int)findItem:(int)value inArray:(int[])array arraySize:(int)size{
	
    return [BinarySearch binarySearchArray:array forItem:value low:0 high:size-1];
}

+ (int)binarySearchArray:(int[])array forItem:(int)item low:(int)low high:(int)high {
    
    //base case, not found
    if (low > high) {
        return -1;
    }
    
    //find middle item
    int middleIndex = (low + high) / 2;
    int middleItem = array[middleIndex];
    
    //compare middle item
    //If found, return the index
    if (middleItem == item) {
        return middleIndex;
    }
    
    //Not found, search left if <
    else if (item < middleItem) {
        return [self binarySearchArray:array forItem:item low:0 high:middleItem - 1];
    }else {
        //search right
        return [self binarySearchArray:array forItem:item low:middleItem high:high];
    }
}
+ (BOOL)containsDuplicateValue:(int)value inArray:(int[])array arraySize:(int)size{
    
    return [BinarySearch containsDuplicateValue:value inArray:array left:0 right:size-1];
}

+ (BOOL)containsDuplicateValue:(int)value inArray:(int[])array left:(int)left right:(int)right {
    
    //Base
    if (left > right) {
        return false;
    }
    
    //get value to compare
    int midIndex = (left + right) / 2;
    int midValue = array[midIndex];
    
    //found item
    if (midValue == value) {
        
        if (!(midIndex - 1 < left)) {
            if (array[midIndex - 1] == value) {
                return true;
            }
        }
        
        if (!((midIndex + 1) > right)) {
            if (array[midIndex + 1] == value) {
                return true;
            }
        }
        return false;
    }
    
    //not found :(
    //search left
    else if (value < midValue) {
        return [BinarySearch containsDuplicateValue:value inArray:array left:left right:midIndex-1];
    }
    
    //search right
    else if (value > midValue) {
        return [BinarySearch containsDuplicateValue:value inArray:array left:midIndex+1 right:right];
    }
    
    return false;
}

@end