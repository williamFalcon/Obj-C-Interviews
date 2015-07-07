
#import "LinkedList.h"
#import "Node.h"

@interface LinkedList()
@property(nonatomic, strong) Node *head;
@end

@implementation LinkedList

///Init with object
- (instancetype)initWithObject:(id)object {
	if (self = [super init]) {
		_head = [[Node alloc] initWithData:object];
	}
	return self;
}

///Adds a node to the object
- (void)append:(id)object {

	Node *newNode = [[Node alloc] initWithData:object];
	Node *tail = [self tail];
	if (!tail) {
		self.head = newNode;
	}else {
		tail.next = newNode;
	}
}

///Removes an object from the list
- (Node *)deleteObject:(id)object {

	//if head, delete head, change pointers
	if (self.head.data == object) {
		Node *deleted = self.head;
		self.head = self.head.next;
		return deleted;
	}

	//not head, find previous, point to next.next
	Node *parent = [self findParentOfNodeWithObject:object];
	if (parent) {
        Node *result = parent.next;
		
        //delete value
		parent.next = parent.next.next;
		return result;
	}

	//nothing deleted, return nil
	return nil;
}

///Finds node before node with input value
- (Node*)findParentOfNodeWithObject:(id)object {
	
	//searched item was at the head
	Node *parent = self.head;
	if (parent.data == object) {
		return parent;
	}

	//Attempt to find object in the list
	while (parent.next != nil) {

		//return parent if matches query
		if (parent.next.data == object) {
			return parent;
		}

		//advance to child
		parent = parent.next;
	}

	//object nor parent matched, return nil
	return nil;
}

///Finds the tail of the list
- (Node *)tail {
	Node *tail = self.head;
	while (tail.next) {
		tail = tail.next;
	}
	return tail;
}

@end