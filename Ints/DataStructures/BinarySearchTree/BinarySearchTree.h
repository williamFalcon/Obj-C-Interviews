@import Foundation;
@class IntNode;

@interface BinarySearchTree:NSObject

@property(readonly) IntNode *root;

- (void)insert:(int) value;
- (IntNode *)findValue:(int)value;
- (void)deleteValue:(int)value;
- (NSString *)printByLevels;
- (IntNode *)maxNodeFromNode:(IntNode *)node;
- (IntNode *)minNodeFromNode:(IntNode *)node;

@end