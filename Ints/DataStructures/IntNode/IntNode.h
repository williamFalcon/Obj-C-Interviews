@import Foundation;

@interface IntNode : NSObject <NSCopying>

#pragma mark - Properties
@property(nonatomic, strong) IntNode *left;
@property(nonatomic, strong) IntNode *right;
@property(nonatomic) int value;

#pragma mark - Custom inits
- (instancetype)initWithValue:(int)value;

@end