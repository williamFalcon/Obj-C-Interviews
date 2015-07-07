@import UIKit;
@class Node;

@interface Queue:NSObject

@property(nonatomic, strong) Node *head;
@property(nonatomic, strong) Node *tail;

- (void)enqueue:(id)object;
- (id)dequeue;

- (bool)isEmpty;

@end