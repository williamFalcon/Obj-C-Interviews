#import "Node.h"

@implementation Node

- (instancetype)initWithData:(id)data {
	if (self = [super init]) {
		_data = data;

	}

	return self;
}

@end