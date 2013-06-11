//
//  PlayingCard.h
//  CardGametest
//
//  Created by Richard on 13-6-10.
//  Copyright (c) 2013年 Richard. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;

@end
