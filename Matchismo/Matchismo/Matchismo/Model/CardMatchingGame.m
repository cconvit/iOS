//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property(nonatomic,readwrite)NSInteger score;
@property(nonatomic,strong)NSMutableArray *cards;//of card
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{

    if(!_cards)_cards=[[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck{

    self=[super init];
    
    if(self){
        for(int i=0;i<count;i++){
            Card *card=[deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self=nil;
                break;
            }
        }
        
    }
    
    return self;

}

-(instancetype)init{

    return nil;
}

-(Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY=2;
static const int MATCH_BONUS=4;
static const int COST_TO_CHOSE=1;

-(void)chooseCardAtIndex:(NSUInteger)index{

    Card *card=[self.cards objectAtIndex:index];
    
    if(!card.isMatched){
    
        if(card.isChosen){
            card.chosen=NO;
        }else{
            //match against other choosen cards
            for(Card *othercard in self.cards){
            
                if(othercard.isChosen && !othercard.matched){
                    int matchScore=[card match:@[othercard]];
                    if(matchScore){
                        self.score+=matchScore+MATCH_BONUS;
                        card.matched=YES;
                        othercard.matched=YES;
                    }else{
                        self.score -=MISMATCH_PENALTY;
                        othercard.chosen=NO;
                        
                    }
                }
            }
        }
        
        self.score-=COST_TO_CHOSE;
        card.chosen=YES;
    
    }
    
    
}


@end
