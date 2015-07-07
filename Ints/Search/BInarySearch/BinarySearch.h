@import Foundation;


@interface BinarySearch : NSObject

+ (int)findItem:(int)value inArray:(int[])array arraySize:(int)size;

+ (BOOL)containsDuplicateValue:(int)value inArray:(int[])array arraySize:(int)size;

@end