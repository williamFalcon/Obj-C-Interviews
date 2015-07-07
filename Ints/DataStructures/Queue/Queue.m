#import "Queue.h"
#import "Node.h"


@implementation Queue

- (void)enqueue:(id)object {
    //set head
    Node *newNode = [Node new];
    newNode.data = object;
    
    //empty q
    if (!self.head) {
        self.head = self.tail = newNode;
        return;
    }
    
    //has q, put at tail
    self.tail.next = newNode;
    self.tail = newNode;
}

- (id)dequeue {

    //grab head
    //move head = head.next
    Node *node = self.head;
    self.head = self.head.next;
    
    return node.data;
}

- (bool)isEmpty {
    return !self.head;
}

@end