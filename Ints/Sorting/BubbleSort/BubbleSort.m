#import "BubbleSort.h"

@implementation BubbleSort

+ (void) bubbleSortArray:(int[])array size:(int)size {

    bool changed = true;
    
    while (changed) {
        changed = false;
        
        for (int i=0; i< size-1; i++) {
            int front = array[i+1];
            int back = array[i];
            
            if (front < back) {
                array[i] = front;
                array[i+1] = back;
                changed = true;
            }
        }
    }
}



@end