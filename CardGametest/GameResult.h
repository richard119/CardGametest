//
//  GameResult.h
//  CardGametest
//
//  Created by Richard on 13-6-17.
//  Copyright (c) 2013年 Richard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameResult : NSObject

@property (readonly,nonatomic) NSDate *start;
@property (readonly,nonatomic) NSDate *end;
@property (readonly,nonatomic) NSTimeInterval duration;

@property (nonatomic) int score;

+ (NSArray *) allGameResult; //of GameResult
@end
