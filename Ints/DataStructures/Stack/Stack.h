@import UIKit;

@interface Stack:NSObject

@property(nonatomic, readonly) NSUInteger count;
- (void)push:(id)object;
- (id)pop;
- (id)peek;


@end