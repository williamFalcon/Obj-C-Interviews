#import "Stack.h"
#import "Node.h"

@interface Stack()
@property(nonatomic, strong) Node *head;
@property(nonatomic, readwrite) NSUInteger count;
@end

@implementation Stack

- (void)push:(id)object {
    Node *newNode = [[Node alloc]initWithData:object];
    newNode.next = self.head;
    self.head = newNode;
    self.count++;
}

- (id)pop {

    if (self.head != nil) {
        Node *popped = self.head;
        self.head = popped.next;
        self.count--;
        return popped.data;
    }
    return nil;
}

- (id)peek {
    
    return self.head.data;
}

@end