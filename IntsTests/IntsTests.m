//
//  IntsTests.m
//  IntsTests
//
//  Created by William Falcon on 5/27/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LinkedList.h"
#import "Queue.h"
#import "Stack.h"
#import "Node.h"
#import "MergeSort.h"
#import "BubbleSort.h"
#import "BinarySearchTree.h"
#import "IntNode.h"
#import "BinarySearch.h"
#import "Quicksort.h"
#import "Random.h"
#import "TwoStackQueue.h"
#import "Graph.h"
#import "User.h"
#import "SelectionSort.h"

@interface IntsTests : XCTestCase

@end

@implementation IntsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSelectionSort {
    
    int a[] = {};
    int b[] = {1};
    int c[] = {2,1};
    int d[] = {1,2,3};
    int e[] = {3,2,1};
    
    int acopy[] = {};
    int bcopy[] = {1};
    int ccopy[] = {1,2};
    int dcopy[] = {1,2,3};
    int ecopy[] = {1,2,3};
    
    [SelectionSort selectionSortArray:a size:0];
    [SelectionSort selectionSortArray:b size:1];
    [SelectionSort selectionSortArray:c size:2];
    [SelectionSort selectionSortArray:d size:3];
    [SelectionSort selectionSortArray:e size:3];
    
    XCTAssert([self array:a equalsArray:acopy size:0]);
    XCTAssert([self array:b equalsArray:bcopy size:1]);
    XCTAssert([self array:c equalsArray:ccopy size:2]);
    XCTAssert([self array:d equalsArray:dcopy size:3]);
    XCTAssert([self array:e equalsArray:ecopy size:3]);
    
}

- (void)testGraph {
    
    User *a = [User new];
    a.firstName = @"first User";
    a.lastName = @"first User last";
    
    User *b = [User new];
    b.firstName = @"second User";
    b.lastName = @"second User last";
    
    Graph *g = [Graph new];
    [g addUser:a];
    XCTAssert(g.adjacencyList.count == 1);
    
    [g addUser:b];
    XCTAssert(g.adjacencyList.count == 2);
    
    [g connectUser:a toUser:b strength:30];
    NSMutableArray *connections = g.adjacencyList[a];
    XCTAssert(connections.count == 1);
    
    //connect user c
    User *c = [User new];
    c.firstName = @"third User";
    c.lastName = @"third User last";
    [g addUser:c];
    [g addUser:a];
    XCTAssert(g.adjacencyList.count == 3);

    //connect user a to c
    [g connectUser:a toUser:c strength:80];
    connections = g.adjacencyList[a];
    XCTAssert(connections.count == 2);
    
    User *d = c;
    d.firstName = @"YOLO";
}

- (void)testTwoStackQ {

    TwoStackQueue *q = [TwoStackQueue new];
    [q enqueueValue:@"a"];
    [q enqueueValue:@"b"];
    [q enqueueValue:@"c"];
    
    NSString *a = [q dequeue];
    XCTAssert([a isEqualToString:@"a"]);
    
    a = [q dequeue];
    XCTAssert([a isEqualToString:@"b"]);
    
    [q enqueueValue:@"f"];

    a = [q dequeue];
    XCTAssert([a isEqualToString:@"c"]);
    
    a = [q dequeue];
    XCTAssert([a isEqualToString:@"f"]);
}


- (void)testSumArrayFinder {
    
    int a[] = {};
    int b[] = {1};
    int c[] = {2,1};
    int d[] = {1,2,3};
    int e[] = {1,3,4,6,9}; //test 9   test 10   test 1
    
    XCTAssert(![Random doesArray:b ofSize:1 containSubArrayThatAddsToValue:0]);
    XCTAssert([Random doesArray:b ofSize:1 containSubArrayThatAddsToValue:1]);
    
    XCTAssert([Random doesArray:c ofSize:2 containSubArrayThatAddsToValue:1]);

    XCTAssert(![Random doesArray:d ofSize:3 containSubArrayThatAddsToValue:20]);
    
    XCTAssert([Random doesArray:d ofSize:3 containSubArrayThatAddsToValue:3]);


    XCTAssert([Random doesArray:e ofSize:5 containSubArrayThatAddsToValue:10]);
    XCTAssert([Random doesArray:e ofSize:5 containSubArrayThatAddsToValue:15]);
    XCTAssert([Random doesArray:e ofSize:5 containSubArrayThatAddsToValue:13]);
    XCTAssert(![Random doesArray:e ofSize:5 containSubArrayThatAddsToValue:0]);
    XCTAssert(![Random doesArray:e ofSize:5 containSubArrayThatAddsToValue:5]);

}

- (void)testQuicksort {
    
    int a[] = {};
    int b[] = {1};
    int c[] = {2,1};
    int d[] = {1,2,3};
    int e[] = {3,2,1};
    
    int acopy[] = {};
    int bcopy[] = {1};
    int ccopy[] = {1,2};
    int dcopy[] = {1,2,3};
    int ecopy[] = {1,2,3};
    
    [Quicksort quicksortArray:a size:0];
    [Quicksort quicksortArray:a size:0];
    [Quicksort quicksortArray:b size:1];
    [Quicksort quicksortArray:c size:2];
    [Quicksort quicksortArray:d size:3];
    [Quicksort quicksortArray:e size:3];
    
    XCTAssert([self array:a equalsArray:acopy size:0]);
    XCTAssert([self array:b equalsArray:bcopy size:1]);
    XCTAssert([self array:c equalsArray:ccopy size:2]);
    XCTAssert([self array:d equalsArray:dcopy size:3]);
    XCTAssert([self array:e equalsArray:ecopy size:3]);
    
}

- (void)testDuplicateFindBinarySearch {
    
    int a[] = {};
    int b[] = {1};
    int c[] = {1,2};
    int d[] = {1,2,2};
    int e[] = {1,2,3,4,5,5,6,7,8,9};
    int f[] = {1,1,1,2,3,4,5,5,6,7,8,9};
    int g[] = {1,1,1,2,3,4,5,5,6,7,9,9};

    //test a
    XCTAssert(![BinarySearch containsDuplicateValue:0 inArray:a arraySize:0]);
    
    //test b
    XCTAssert(![BinarySearch containsDuplicateValue:1 inArray:b arraySize:1]);
    
    //test c
    XCTAssert(![BinarySearch containsDuplicateValue:1 inArray:c arraySize:2]);
    
    //test d
    XCTAssert([BinarySearch containsDuplicateValue:2 inArray:d arraySize:3]);
    
    //test e
    XCTAssert([BinarySearch containsDuplicateValue:5 inArray:e arraySize:10]);
    
    //test f
    XCTAssert([BinarySearch containsDuplicateValue:1 inArray:f arraySize:12]);
    
    //test g
    XCTAssert([BinarySearch containsDuplicateValue:9 inArray:g arraySize:12]);
    
    //test g
    XCTAssert(![BinarySearch containsDuplicateValue:7 inArray:g arraySize:12]);
    
    //test g
    XCTAssert(![BinarySearch containsDuplicateValue:2 inArray:g arraySize:12]);
}

- (void)testBinarySearch {
    int a[] = {};
    int b[] = {1};
    int c[] = {1,2};
    int d[] = {1,2,3};
    int e[] = {1,1,2,3};
    
    //test a
    int idx = [BinarySearch findItem:2 inArray:a arraySize:0];
    XCTAssert(idx == -1);
    
    //test b
    idx = [BinarySearch findItem:1 inArray:b arraySize:1];
    XCTAssert(idx == 0);
    
    //test c
    idx = [BinarySearch findItem:2 inArray:c arraySize:2];
    XCTAssert(idx == 1);
    
    //test d
    idx = [BinarySearch findItem:3 inArray:d arraySize:3];
    XCTAssert(idx == 2);
    
    //test e
    idx = [BinarySearch findItem:1 inArray:e arraySize:4];
    XCTAssert(idx == 0 || idx == 1);
}

- (void)testBinarySearchTreeMin {
    
    BinarySearchTree *tree = [BinarySearchTree new];
    [tree insert:5];
    [tree insert:0];
    [tree insert:-4];
    [tree insert:15];
    [tree insert:25];
    [tree insert:9];
    [tree insert:7];
    
    IntNode *min = [tree minNodeFromNode:tree.root];
    XCTAssert(min.value == -4);
}

- (void)testBinarySearchTreeMax {
    
    BinarySearchTree *tree = [BinarySearchTree new];
    [tree insert:5];
    [tree insert:0];
    [tree insert:-4];
    [tree insert:15];
    [tree insert:25];
    [tree insert:9];
    [tree insert:7];
    
    IntNode *max = [tree maxNodeFromNode:tree.root];
    XCTAssert(max.value == 25);
}

- (void)testBinarySearchTreeDelete {
    
    BinarySearchTree *tree = [BinarySearchTree new];
    [tree deleteValue:2];
    
    //test empty delete
    XCTAssert(tree.root == nil);
    
    //test not found delete
    [tree insert:4];
    [tree deleteValue:5];
    XCTAssert(tree.root.value == 4);
    
    //test root delete
    [tree deleteValue:4];
    XCTAssert(!tree.root);
    
    [tree insert:10];
    [tree insert:15];
    [tree deleteValue:15];
    XCTAssert(tree.root.right == nil);
    
    [tree insert:15];
    [tree insert:13];
    [tree deleteValue:13];
    XCTAssert(tree.root.right.left == nil);

    [tree insert:13];
    [tree deleteValue:15];
    XCTAssert(tree.root.value == 10);
    XCTAssert(tree.root.right.value == 13);
    
    [tree insert:20];
    [tree insert:17];
    [tree insert:25];
    [tree insert:19];
    [tree deleteValue:17];
    XCTAssert(tree.root.right.right.value == 20);
    XCTAssert(tree.root.right.right.left.value == 19);
}

- (void)testBinarySearchTreeFind {
    
    BinarySearchTree *tree = [BinarySearchTree new];
    IntNode *result;
    
    //test empty
    result = [tree findValue:4];
    XCTAssert(result == nil);
    
    //test not found, nil
    [tree insert:6];
    result = [tree findValue:4];
    XCTAssert(result == nil);
    
    //test found simple
    result = [tree findValue:6];
    XCTAssert(result.value = 6);
    
    //complicate a bit
    [tree insert:10];
    [tree insert:8];
    [tree insert:9];
    
    result = [tree findValue:9];
    XCTAssert(result.value = 9);
}


- (void)testBinarySearchTreeInsert {
    
    BinarySearchTree *tree = [BinarySearchTree new];
    
    [tree insert:5];
    XCTAssert(tree.root.value == 5);
    
    [tree insert:3];
    XCTAssert(tree.root.left.value == 3);
    
    [tree insert:4];
    XCTAssert(tree.root.left.right.value == 4);
    
    [tree insert:2];
    XCTAssert(tree.root.left.left.value == 2);
    
    [tree insert:8];
    XCTAssert(tree.root.right.value == 8);
    
    [tree insert:6];
    XCTAssert(tree.root.right.left.value == 6);
    
    [tree insert:7];
    XCTAssert(tree.root.right.left.right.value == 7);
    
    [tree insert:10];
    XCTAssert(tree.root.right.right.value == 10);
    
    [tree insert:10];
    XCTAssert(tree.root.right.right.value == 10);
}

- (void)testStack {
    
    NSString *first = @"a";
    NSString *second = @"b";
    NSString *third = @"c";
    
    //Test push
    Stack *stack = [Stack new];
    [stack push:first];
    XCTAssert([[stack peek]isEqualToString:first]);
    
    [stack push:second];
    XCTAssert([[stack peek]isEqualToString:second]);
    
    [stack push:third];
    XCTAssert([[stack peek]isEqualToString:third]);
    
    //Test pop
    XCTAssert([[stack pop] isEqualToString:third]);
    XCTAssert([[stack pop] isEqualToString:second]);
    XCTAssert([[stack pop] isEqualToString:first]);
    XCTAssert([stack pop] == nil);
}

- (void)testMergeSort {
    
    int a[] = {};
    int b[] = {1};
    int c[] = {2,1};
    int d[] = {1,2,3};
    int e[] = {3,2,1};
    
    int acopy[] = {};
    int bcopy[] = {1};
    int ccopy[] = {1,2};
    int dcopy[] = {1,2,3};
    int ecopy[] = {1,2,3};

    [MergeSort mergeSortArray:a size:0];
    [MergeSort mergeSortArray:b size:1];
    [MergeSort mergeSortArray:c size:2];
    [MergeSort mergeSortArray:d size:3];
    [MergeSort mergeSortArray:e size:3];

    XCTAssert([self array:a equalsArray:acopy size:0]);
    XCTAssert([self array:b equalsArray:bcopy size:1]);
    XCTAssert([self array:c equalsArray:ccopy size:2]);
    XCTAssert([self array:d equalsArray:dcopy size:3]);
    XCTAssert([self array:e equalsArray:ecopy size:3]);
    
}

- (void)testBubbleSort {
    
    int a[] = {};
    int b[] = {1};
    int c[] = {2,1};
    int d[] = {1,2,3};
    int e[] = {3,2,1};
    
    int acopy[] = {};
    int bcopy[] = {1};
    int ccopy[] = {1,2};
    int dcopy[] = {1,2,3};
    int ecopy[] = {1,2,3};
    
    [BubbleSort bubbleSortArray:a size:0];
    [BubbleSort bubbleSortArray:b size:1];
    [BubbleSort bubbleSortArray:c size:2];
    [BubbleSort bubbleSortArray:d size:3];
    [BubbleSort bubbleSortArray:e size:3];
    
    XCTAssert([self array:a equalsArray:acopy size:0]);
    XCTAssert([self array:b equalsArray:bcopy size:1]);
    XCTAssert([self array:c equalsArray:ccopy size:2]);
    XCTAssert([self array:d equalsArray:dcopy size:3]);
    XCTAssert([self array:e equalsArray:ecopy size:3]);
    
}

- (BOOL) array:(int [])a equalsArray:(int[])b size:(int)size {
    
    for (int i = 0; i< size; i++) {
        int itemA = a[i];
        int itemB = b[i];
        if (itemA != itemB) {
            return false;
        }
    }
    
    return true;
}

- (void)testQ {
    Queue *q = [[Queue alloc]init];
    [q enqueue:@"a"];
    
    XCTAssert([q.tail.data isEqualToString:@"a"]);
    XCTAssert([q.head.data isEqualToString:@"a"]);

    [q enqueue:@"b"];
    XCTAssert([q.tail.data isEqualToString:@"b"]);
    XCTAssert([q.head.data isEqualToString:@"a"]);

    [q enqueue:@"c"];
    
    NSString *a = [q dequeue];
    XCTAssert([a isEqualToString:@"a"]);
    
    a = [q dequeue];
    XCTAssert([a isEqualToString:@"b"]);
    
    a = [q dequeue];
    XCTAssert([a isEqualToString:@"c"]);
    
    a = [q dequeue];
    XCTAssert(!a);
}

- (void)testLinkedList {
    NSString *first = @"a";
    NSString *second = @"b";
    NSString *third = @"c";
    
    LinkedList *list = [LinkedList new];
    [list append:first];
    [list append:second];
    [list append:third];
    
    Node *removed = [list deleteObject:second];
    XCTAssert([removed.data isEqualToString:second], @"Pass");
    
    removed = [list deleteObject:@"a"];
    XCTAssert([removed.data isEqualToString:first]);
    
    removed = [list deleteObject:@"d"];
    XCTAssert(removed.data == nil);
    
    removed = [list deleteObject:@"c"];
    XCTAssert([removed.data isEqualToString:third]);
}

@end
