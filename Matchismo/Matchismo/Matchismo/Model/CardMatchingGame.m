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
@property(nonatomic,strong)NSMutableArray *choosenCards;//of card
@property(nonatomic)NSInteger gameMode;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards{

    if(!_cards)_cards=[[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck gameMode:(NSInteger)gameMode{

    self=[super init];
    
    if(self){
        self.gameMode=gameMode;
        self.choosenCards=[[NSMutableArray alloc] init];
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
            [self.choosenCards removeAllObjects];
             [self.choosenCards addObject:card];
            for(Card *othercard in self.cards){
            
                if(othercard.isChosen && !othercard.matched){
                    
                    [self.choosenCards addObject:othercard];
                    
                    
                    if((((self.gameMode==0) && ([self.choosenCards count] == 2) ? true : false)) || (((self.gameMode==1) && ([self.choosenCards count] == 3) ? true : false))){
                        
                       int matchScore=[card match:self.choosenCards];
                       if(matchScore){
                         self.score+=matchScore+MATCH_BONUS;
                         card.matched=YES;
                         //othercard.matched=YES;
                           for(Card *othercard_x  in self.choosenCards){
                               othercard_x.matched=YES;
                           }
                        }else{
                          self.score -=MISMATCH_PENALTY;
                          othercard.chosen=NO;
                        
                         }
                        [self.choosenCards removeAllObjects];
                    }else{
                    
                        card.chosen=YES;
                    }
                }
            }
        }
        
        self.score-=COST_TO_CHOSE;
        card.chosen=YES;
    
    }
    
    
}


@end
