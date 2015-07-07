
@import UIKit;
@class Node;

@interface LinkedList : NSObject

//Adds to the list
- (void)append:(id)object;

//Removes from the list
- (Node *)deleteObject:(id)object;

@end
