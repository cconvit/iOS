//
//  SetCardGameViewController.m
//  MatchismoSetGame
//
//  Created by Carlos Convit on 2/10/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "SetCardGameViewController.h"
#import "SetCardDeck.h"
#import "SetCardView.h"
#import "SetCard.h"

@interface SetCardGameViewController ()

@end

@implementation SetCardGameViewController




-(Deck *)createDeck{
    
    return [[SetCardDeck alloc] init];
    
}
-(void)updateUI{
    
    for(SetCardView *cardButton in self.cardButtons){
        NSUInteger cardButtonIndex=[self.cardButtons indexOfObject:cardButton];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        SetCard *setCard=card.copy;
        
        [cardButton drawTriangles:setCard.number color:setCard.color fill:@""];
        
        self.scoreLabel.text=[NSString stringWithFormat:@"Score: %ld",(long)self.game.score];
        
    }
    self.lastPlayLabel.text=self.game.lastPlay;
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    [self updateUI];
}
@end
