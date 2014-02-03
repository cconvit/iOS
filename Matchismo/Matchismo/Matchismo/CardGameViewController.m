//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Carlos Convit on 2/3/14.
//  Copyright (c) 2014 Carlos Convit. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property(strong,nonatomic) PlayingCardDeck *playingCardDeck;
@property(nonatomic) int flipCount;
@end

@implementation CardGameViewController

-(void)viewDidLoad{

    self.playingCardDeck=[[PlayingCardDeck alloc] init];

}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if([sender.currentTitle length] )
    {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@""
                forState:UIControlStateNormal];
    }else{
        
        Card *card=[self.playingCardDeck drawRandomCard];
        if(!card){
            self.playingCardDeck=[[PlayingCardDeck alloc] init];
            card=[self.playingCardDeck drawRandomCard];
        }
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        [sender setTitle:[card contents]
                forState:UIControlStateNormal];
    }
    self.flipCount++;
    [self.flipsLabel setText:[NSString stringWithFormat:@"Flips: %d",self.flipCount]];
    
}


@end
