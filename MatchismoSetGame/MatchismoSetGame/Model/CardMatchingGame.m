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
@property(nonatomic,readwrite)NSString *lastPlay;
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
            self.lastPlay=[NSString stringWithFormat:@"Unchosen card %@",card.contents];
            [self.choosenCards removeObject:card];
            
        }else{
            //match against other choosen cards
            [self.choosenCards removeAllObjects];
            [self.choosenCards addObject:card];
            card.chosen=YES;
            self.lastPlay=[NSString stringWithFormat:@"%@",card.contents];
            for(Card *othercard in self.cards){
            
                if(othercard.isChosen && !othercard.matched && othercard!= card){
                    
                    [self.choosenCards addObject:othercard];
                    
                    
                    if((self.gameMode==0 && [self.choosenCards count] == 2) || (self.gameMode==1 && [self.choosenCards count] == 3)){
                        
                       int matchScore=[card match:self.choosenCards];
                       if(matchScore){
                         self.score+=matchScore+MATCH_BONUS;
                         card.matched=YES;
                         //othercard.matched=YES;
                           self.lastPlay=[NSString stringWithFormat:@"Matched"];

                           for(Card *othercard_x  in self.choosenCards){
                               othercard_x.matched=YES;
                               
                               self.lastPlay=[NSString stringWithFormat:@"%@ %@",self.lastPlay,othercard_x.contents];
                           }
                           self.lastPlay=[NSString stringWithFormat:@"%@ for %d points.",self.lastPlay,matchScore];
                           
                        }else{
                          self.score -=MISMATCH_PENALTY;
                          //othercard.chosen=NO;
                          self.lastPlay=@"";
                            
                            for(Card *othercard_x  in self.choosenCards){
                                if(othercard_x != card)othercard_x.chosen=NO;
                                self.lastPlay=[NSString stringWithFormat:@"%@ %@",self.lastPlay,othercard_x.contents];
                            }
                            self.lastPlay=[NSString stringWithFormat:@"%@ Don´t match! %d points penalty!",self.lastPlay,MISMATCH_PENALTY];
                            
                        
                         }
                        [self.choosenCards removeAllObjects];
                    }
                    
                    
                    

                    
                
                }
            }
           
        }
        
        self.score-=COST_TO_CHOSE;
        
    
    }
    
    
}


@end
