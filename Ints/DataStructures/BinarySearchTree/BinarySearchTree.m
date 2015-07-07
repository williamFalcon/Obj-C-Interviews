#import "BinarySearchTree.h"
#import "IntNode.h"
#import "Queue.h"

@interface BinarySearchTree ()

@property (nonatomic, readwrite)IntNode *root;
@end

@implementation BinarySearchTree

- (void)insert:(int) value {
	self.root = [self insert:value intoNode:self.root];
}


- (IntNode *)insert:(int) value intoNode:(IntNode *)node {
	
	//Base case
	if (! node) {
		node = [[IntNode alloc]initWithValue:value];
	}

	//<= case
	else if (value < node.value) {
		node.left = [self insert:value intoNode:node.left];
	}

	//> case
	else if (value > node.value) {
		node.right = [self insert:value intoNode:node.right];
	}

	return node;
}


- (NSString *)printByLevels {
	return [self printByLevels:self.root];
}

- (NSString *)printByLevels:(IntNode *)node {

	NSMutableString *result = [NSMutableString new];

	//1. push root into q
	Queue *q = [Queue new];
	[q enqueue:node];

	//3. while q not empty
	while(![q isEmpty]) {
		
		//4. pop q,
		IntNode *node = [q dequeue];

		//print
		NSString *newValue = [NSString stringWithFormat:@"%i", node.value];
		[result appendString:newValue];
		
		//insert children
		if (node.left) {
			[q enqueue:node.left];
		}

		if (node.right) {
			[q enqueue:node.right];
		}
	}

	return result;
}

- (IntNode *)maxNodeFromNode:(IntNode *)node {

	//given a null node
	if (!node) {
		return nil;
	}

	//base case, no right child, therefore we are the max
	if (!node.right) {
		return node;
	}

	//Go right
	return [self maxNodeFromNode:node.right];
}

- (IntNode *)minNodeFromNode:(IntNode *)node {

	//given null input
	if (!node) {
		return nil;
	}

	//base, we are the min
	if (!node.left) {
		return node;
	}

	//no min, so go left
	return [self minNodeFromNode:node.left];
}

- (void)deleteValue:(int)value {
	[self deleteValue:value fromNode:self.root parentNode:nil];
}

- (void)deleteValue:(int)value fromNode:(IntNode *)node parentNode:(IntNode *)parent {

	//Base case, we're nil, so do nothing
	if (!node) {
		return;
	}

	//we found the value, so delete
	if (value == node.value) {
		//root edge case
		if (node == self.root) {
			self.root = nil;
		}

		//if this node has no left or right child, just delete it
		if (parent.left == node) {
			if (!node.left && !node.right) {
				parent.left = nil;
				return;
			}

			//we have children, so apply child case
			[self deleteNodeWithChildren:node];
		}

		if (parent.right == node) {
			if (!node.left && !node.right) {
				parent.right = nil;	
				return;			
			}

			//we have children, apply child case
			[self deleteNodeWithChildren:node];
		}
	}

	//not found, search left
	if (value < node.value) {
		[self deleteValue:value fromNode:node.left parentNode:node];
	}

	//not found, search right
	if (value > node.value) {
		[self deleteValue:value fromNode:node.right parentNode:node];
	}
}

- (void)deleteNodeWithChildren:(IntNode *)nodeToDelete{

	// if has right,
	if (nodeToDelete.right) {
		IntNode *min = [self minNodeFromNode:nodeToDelete.right];
		nodeToDelete.value = min.value;
		
		//fix tree structure by shifting to right child
		if (min.right) {
			min = min.right;
		}
		return;
	}

	//No right, fix left
	//find max on left
	IntNode *max = [self maxNodeFromNode:nodeToDelete.left];
	nodeToDelete.value = max.value;

	if (max.left) {
		max = max.left;
	}
}

- (IntNode *)findValue:(int)value {
	return [self findValue:value fromNode:self.root];
}

- (IntNode *)findValue:(int) value fromNode:(IntNode *)node {

	//base case
	if (!node) {
		return nil;
	}

	//Value found?
	if (value == node.value) {
		return node;
	}

	//not found, search left
	if (value < node.value) {
		return [self findValue:value fromNode:node.left];
	}

	//not found left, search right
	if (value > node.value) {
		return [self findValue:value fromNode:node.right];
	}

	return nil;
}

@end
























