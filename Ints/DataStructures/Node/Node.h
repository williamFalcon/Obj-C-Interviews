@import UIKit;

@interface Node:NSObject

@property(nonatomic, strong) Node *next;
@property(nonatomic, strong) id data;

- (instancetype)initWithData:(id)data;

@end