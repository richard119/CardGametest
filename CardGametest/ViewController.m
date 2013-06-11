//
//  ViewController.m
//  CardGametest
//
//  Created by Richard on 13-6-10.
//  Copyright (c) 2013年 Richard. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipcount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) Deck *deck;
@property (strong,nonatomic) CardMatchingGame *game;
@end

@implementation ViewController

- (Deck *)deck{
    if(!_deck) _deck = [[PlayingCardDeck alloc] init];
    return _deck;
}

- (void)setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.deck drawRandomCard];
        [cardButton setTitle:card.contents  forState:UIControlStateSelected];
    }
}

- (void)setFlipcount:(int)flipcount{
    _flipcount = flipcount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipcount];
}

- (IBAction)flipCard:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.flipcount++;
}

@end
