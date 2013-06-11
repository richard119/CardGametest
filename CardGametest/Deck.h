//
//  Desk.h
//  CardGametest
//
//  Created by Richard on 13-6-10.
//  Copyright (c) 2013年 Richard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

@property (nonatomic) int numberOfCardsInDeck;

-(void)addCard:(Card *)card atTop:(BOOL)atTop;

-(Card *)drawRandomCard;

@end
