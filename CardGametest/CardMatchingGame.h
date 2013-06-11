//
//  CardMatchingGame.h
//  CardGametest
//
//  Created by Richard on 13-6-11.
//  Copyright (c) 2013年 Richard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

@property (nonatomic) int score;
@property (readonly, nonatomic) NSString *descriptionOfLastFlip;

@property (nonatomic) int numberOfMatchingCards;

@property (nonatomic) int matchBonus;
@property (nonatomic) int mismatchPenalty;
@property (nonatomic) int flipCost;

@property (nonatomic) int numberOfCards;

@property (nonatomic) BOOL deckIsEmpty;

// designated initializer
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck;

- (Card *)cardAtIndex:(NSUInteger)index;
- (void)flipCardAtIndex:(NSUInteger)index;
- (void)removeCardAtIndex:(NSUInteger)index;
- (void)drawNewCard;

- (NSArray *)matchingCards;


@end
