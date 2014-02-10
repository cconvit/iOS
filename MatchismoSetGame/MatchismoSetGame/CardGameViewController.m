//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "CardGameViewController.h"


@interface CardGameViewController ()


@end

@implementation CardGameViewController

-(void)viewDidLoad{

}

-(Deck *)deck{
    if(!_deck)_deck=[self createDeck];
    
    return _deck;
}

//Abstract
-(Deck *)createDeck{
    return nil;
}

-(CardMatchingGame *)game{
 
    if(!_game)_game=[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:self.deck gameMode:self.gameMode.selectedSegmentIndex];
    
    
    return _game;
}







@end
