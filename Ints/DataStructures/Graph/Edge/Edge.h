//
//  Edge.h
//  Ints
//
//  Created by William Falcon on 7/1/15.
//  Copyright (c) 2015 William Falcon. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vertex;
@interface Edge : NSObject

@property(nonatomic, strong) id destination;
@property(nonatomic) NSInteger weight;
@property(nonatomic) NSInteger minDistance;

@end
