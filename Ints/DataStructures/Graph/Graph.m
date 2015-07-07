//
//  Graph.m
//  Ints
//
//  Created by William Falcon on 7/1/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import "Graph.h"
#import "User.h"
#import "Edge.h"

@interface Graph ()

@property (nonatomic, readwrite) NSMutableDictionary *adjacencyList;

@end

@implementation Graph

- (instancetype) init {
    if (self = [super init]) {
        _adjacencyList = [NSMutableDictionary new];
    }
    
    return self;
}

- (void)addUser:(User *)user {
    
    if (self.adjacencyList[user] == nil) {
        self.adjacencyList[user] = [NSMutableArray new];
    }
}

- (void)connectUser:(User *)user1 toUser:(User *)user2 strength:(NSUInteger)strength {
    
    //don't connect if either hasn't registered yet
    bool invalidUsers = (![[self.adjacencyList allKeys] containsObject:user1]) || ![[self.adjacencyList allKeys] containsObject:user2];
    if (!invalidUsers) {
        Edge *e = [Edge new];
        e.weight = strength;
        e.destination = user2;
        
        //pull out user's friends
        NSMutableArray *edges = self.adjacencyList[user1];
        //make sure link doesn't exist
        for (Edge *edge in edges) {
            if (edge.destination == user2) {
                return;
            }
        }
        
        [edges addObject:e];
        
        //put back in
        self.adjacencyList[user1] = edges;
        
    }else {
        NSLog(@"Link cannot be made because one of the users is not registered!");
    }
}


@end









