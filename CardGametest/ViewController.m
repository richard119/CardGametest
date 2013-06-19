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
#import "GameResult.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic) int flipcount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong,nonatomic) GameResult *gameResult;
@property (strong,nonatomic) NSMutableArray *history;
@end

@implementation ViewController
@synthesize game = _game;
@synthesize gameResult = _gameResult;

- (void)setFlipcount:(int)flipcount{
    _flipcount = flipcount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipcount];
}

- (void)setCardButtons:(NSArray *)cardButtons{
    _cardButtons = cardButtons;
    [self updateUI];
    
}

- (NSMutableArray *)history{
    if (!_history) {
        _history = [[NSMutableArray alloc] init];
    }
    return _history;
}

-(CardMatchingGame *)game{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[[PlayingCardDeck alloc] init]] ;
    }
    
    return _game;
}


- (GameResult *)gameResult
{
        if (!_gameResult) _gameResult = [[GameResult alloc] init];

        return _gameResult;
}


-(void)updateUI{
    
    UIImage *cardBackImage = [UIImage imageNamed:@"cardback.png"];
    
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.3:1.0);
        
        if (!card.isFaceUp) {
            [cardButton setImage:cardBackImage forState:UIControlStateNormal];
        } else {
            [cardButton setImage:nil forState:UIControlStateNormal];
        }
    }
    
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Scores: %d", self.game.score];
    
}



- (IBAction)flipCard:(UIButton *)sender {
    
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipcount++;
    
    self.gameResult.score = self.game.score;
    
    [self updateUI];
}

- (IBAction)dealButtonPressed:(UIButton *)sender {
    self.game = nil;
//    self.flipCount = 0;
//    self.cardModeSelector.enabled = YES;
//    self.history = nil;
    self.gameResult = nil;
    [self updateUI];
}

@end
