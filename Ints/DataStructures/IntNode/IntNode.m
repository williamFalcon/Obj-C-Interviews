#import "IntNode.h"

@implementation IntNode

-(instancetype)initWithValue:(int)value {
	if (self = [super init]) {
		_value = value;
	}

	return self;
}

- (id)copyWithZone:(NSZone *)zone {
    
    IntNode *node = [[self class] allocWithZone:zone];
    if (node) {
        node.value = self.value;
        node.left = self.left;
        node.right = self.right;
    }
    
    return node;
}

@end