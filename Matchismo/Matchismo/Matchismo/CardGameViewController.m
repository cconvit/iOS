//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property(strong,nonatomic) Deck *deck;
@property(strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController

-(void)viewDidLoad{

}

-(Deck *)deck{
    if(!_deck)_deck=[self createDeck];
    
    return _deck;
}

-(Deck *)createDeck{
  return [[PlayingCardDeck alloc] init];
}

-(CardMatchingGame *)game{
 
    if(!_game)_game=[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck];
    
    return _game;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    NSUInteger chosenButtonIndex=[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(void)updateUI{

    for(UIButton *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex=[self.cardButtons indexOfObject:cardButton];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled=!card.matched;
        self.scoreLabel.text=[NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
        
    }
}

-(NSString *)titleForCard:(Card *)card{

    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{

    return card.isChosen ? [UIImage imageNamed:@"cardfront"] : [UIImage imageNamed:@"cardback"];

}

@end
