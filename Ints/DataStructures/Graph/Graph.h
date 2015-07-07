//
//  Graph.h
//  Ints
//
//  Created by William Falcon on 7/1/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface Graph : NSObject

@property (nonatomic, readonly) NSMutableDictionary *adjacencyList;

//add user
- (void)addUser:(User *)user;

//add connection to user (with weight)
- (void)connectUser:(User *)user1 toUser:(User *)user2 strength:(NSUInteger)strength;

//see if two people are friends
- (void)isUser:(User *)user friendsWithUser:(User *)user2;

//see how close they are
//returns an array of friends that show the connection from one user to another
- (NSArray *)connectionPathBetweenUser:(User *)a andUser:(User *)b;

//bfs
- (void)printFriendsInCircles;

//dfs
- (void)printFriendsInOrder;

@end
