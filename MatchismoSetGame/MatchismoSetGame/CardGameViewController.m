//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property(strong,nonatomic) Deck *deck;
@property(strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameMode;
@property (weak, nonatomic) IBOutlet UILabel *lastPlayLabel;
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

- (IBAction)touchCardButton:(UIButton *)sender {
    
    self.gameMode.enabled=NO;
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
    self.lastPlayLabel.text=self.game.lastPlay;
}

-(NSString *)titleForCard:(Card *)card{

    return card.isChosen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card{

    return card.isChosen ? [UIImage imageNamed:@"cardfront"] : [UIImage imageNamed:@"cardback"];

}
- (IBAction)createNewGameForMachismo:(UIButton *)sender {
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Warning" message: @"Are you want to create a new game?" delegate:self  cancelButtonTitle:@"Cancel" otherButtonTitles:@"YES",nil];
    [alert show];

    
    }

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"He press Cancel");
    }
    else {
        self.game=nil;
        self.deck=nil;
        self.scoreLabel.text=@"Score: 0";
        self.gameMode.enabled=YES;
        self.lastPlayLabel.text=@"";
        
        for(UIButton *cardButton in self.cardButtons){
            
            [cardButton setTitle:@"" forState:UIControlStateNormal];
            [cardButton setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
            cardButton.enabled=YES;
            
        }
        
        
    }
}




@end
