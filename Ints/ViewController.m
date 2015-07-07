//
//  ViewController.m
//  Ints
//
//  Created by William Falcon on 5/27/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import "ViewController.h"
#import "BinarySearchTree.h"
#import "IntNode.h"
#import "WSet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    IntNode *a = [IntNode new];
    a.value = 5;
    
    IntNode *b = [IntNode new];
    b.value = 50;
    
    IntNode *c = [IntNode new];
    c.value = 15;
    
    WSet *set = [[WSet alloc]initWithArray:@[a, b, c]];
    NSUInteger count = [set count];
    
    WSet *setB = [[WSet alloc]initWithSet:set];
    NSUInteger co = [setB count];
    

    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
