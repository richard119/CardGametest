//
//  Desk.m
//  CardGametest
//
//  Created by Richard on 13-6-10.
//  Copyright (c) 2013年 Richard. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (int)numberOfCardsInDeck
{
    return [self.cards count];
}

- (NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(void)addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }else {
        [self.cards addObject:card];
    }
}

-(Card *)drawRandomCard{
    Card *randomCard = nil;
    
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return randomCard;
}


@end
