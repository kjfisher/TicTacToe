//
//  ViewController.m
//  TicTacToe
//
//  Created by Kristen L. Fisher on 5/15/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *myLabelOne;
@property (weak, nonatomic) IBOutlet UILabel *myLabelTwo;
@property (weak, nonatomic) IBOutlet UILabel *myLabelThree;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFour;
@property (weak, nonatomic) IBOutlet UILabel *myLabelFive;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSix;
@property (weak, nonatomic) IBOutlet UILabel *myLabelSeven;
@property (weak, nonatomic) IBOutlet UILabel *myLabelEight;
@property (weak, nonatomic) IBOutlet UILabel *myLabelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property UITapGestureRecognizer *recognizer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.whichPlayerLabel.text = @"X";


}

-(UILabel *)findLabelUsingPoint: (CGPoint) point
{

    if (CGRectContainsPoint(self.myLabelOne.frame, point))
    {
        return self.myLabelOne;
    }
    if (CGRectContainsPoint(self.myLabelTwo.frame, point))
    {
        return self.myLabelTwo;
    }
    if (CGRectContainsPoint(self.myLabelThree.frame, point))
    {
         return self.myLabelThree;
    }
    if (CGRectContainsPoint(self.myLabelFour.frame, point))
    {
         return self.myLabelFour;
    }
    if (CGRectContainsPoint(self.myLabelFive.frame, point))
    {
         return self.myLabelFive;
    }
    if (CGRectContainsPoint(self.myLabelSix.frame, point))
    {
         return self.myLabelSix;
    }
    if (CGRectContainsPoint(self.myLabelSeven.frame, point))
    {
         return self.myLabelSeven;
    }
    if (CGRectContainsPoint(self.myLabelEight.frame, point))
    {
         return self.myLabelEight;
    }
    if (CGRectContainsPoint(self.myLabelNine.frame, point))
    {
         return self.myLabelNine;
    }
    return nil;
}

- (IBAction)onLabelTapped:(id)sender
{
        UITapGestureRecognizer *recognizer = (UITapGestureRecognizer *)sender;

        CGPoint userTap;
        userTap = [recognizer locationInView:self.view];

        if (recognizer.state == UIGestureRecognizerStateEnded)
        {
            UILabel *tapped = [self findLabelUsingPoint:userTap];

            if ([tapped.text isEqualToString:@""] && [self.whichPlayerLabel.text isEqualToString:@"X"])
            {
                tapped.text = @"X";
                tapped.textColor = [UIColor blueColor];
                self.whichPlayerLabel.text = @"O";
            }

            if ([tapped.text isEqualToString:@""] && [self.whichPlayerLabel.text isEqual: @"O"])
            {
                tapped.text = @"O";
                tapped.textColor = [UIColor redColor];
                self.whichPlayerLabel.text = @"X";
            }

            NSString *winnerName = [self whoWon];
            NSLog(@"The winner is %@", winnerName);

            if (winnerName != nil) {
                NSString *messageString = [NSString stringWithFormat:@"%@ Won", winnerName];
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:messageString
                                                                message:@"Way to go!"
                                                               delegate:self
                                                      cancelButtonTitle:@"Play Again?"
                                                      otherButtonTitles:nil];
                [alert show];
            }
        }
}

- (NSString *)whoWon
{
        // #1: 1 2 3
        if ([self.myLabelOne.text isEqual: @"X" ] && [self.myLabelTwo.text isEqual: @"X"] && [self.myLabelThree.text isEqual: @"X" ])
        {
            NSLog(@"X is the winner");
            return @"X";

        }
        if ([self.myLabelOne.text isEqual: @"O" ] && [self.myLabelTwo.text isEqual: @"O"] && [self.myLabelThree.text isEqual: @"O" ])
        {
            NSLog(@"O is the winner");
            return @"O";
        }

        //#2: 4 5 6
        if ([self.myLabelFour.text isEqual: @"X" ] && [self.myLabelFive.text isEqual: @"X"] && [self.myLabelSix.text isEqual: @"X" ])
        {
            NSLog(@"X is the winner");
            return @"X";

        }
        if ([self.myLabelFour.text isEqual: @"O" ] && [self.myLabelFive.text isEqual: @"O"] && [self.myLabelSix.text isEqual: @"O" ])
        {
            NSLog(@"O is the winner");
            return @"O";
        }

        //#3: 7 8 9
        if ([self.myLabelSeven.text isEqual: @"X" ] && [self.myLabelEight.text isEqual: @"X"] && [self.myLabelNine.text isEqual: @"X" ])
        {
            NSLog(@"X is the winner");
            return @"X";
        }
        if ([self.myLabelSeven.text isEqual: @"O" ] && [self.myLabelEight.text isEqual: @"O"] && [self.myLabelNine.text isEqual: @"O" ])
        {
            NSLog(@"O is the winner");
            return @"O";
        }

        //#4: 1 5 9
        if ([self.myLabelOne.text isEqual: @"X" ] && [self.myLabelFive.text isEqual: @"X"] && [self.myLabelNine.text isEqual: @"X" ])
        {
            NSLog(@"X is the winner");
            return @"X";
        }

        if ([self.myLabelOne.text isEqual: @"O" ] && [self.myLabelFive.text isEqual: @"O"] && [self.myLabelNine.text isEqual: @"O" ])
        {
            NSLog(@"O is the winner");
            return @"O";
        }

        //#5: 3 5 7
        if ([self.myLabelThree.text isEqual: @"X" ] && [self.myLabelFive.text isEqual: @"X"] && [self.myLabelSeven.text isEqual: @"X" ])
        {
            NSLog(@"X is the winner");
            return @"X";
        }
        if ([self.myLabelThree.text isEqual: @"O" ] && [self.myLabelFive.text isEqual: @"O"] && [self.myLabelSeven.text isEqual: @"O" ])
        {
            NSLog(@"O is the winner");
            return @"O";
        }

        //#6: 2 5 8
        if ([self.myLabelTwo.text isEqual: @"X" ] && [self.myLabelFive.text isEqual: @"X"] && [self.myLabelEight.text isEqual: @"X" ])
        {
            NSLog(@"X is the winner");
            return @"X";
        }
        if ([self.myLabelTwo.text isEqual: @"O" ] && [self.myLabelFive.text isEqual: @"O"] && [self.myLabelEight.text isEqual: @"O" ])
        {
            NSLog(@"O is the winner");
            return @"O";
        }

        //#6: 3 6 9
        if ([self.myLabelThree.text isEqual: @"X" ] && [self.myLabelSix.text isEqual: @"X"] && [self.myLabelNine.text isEqual: @"X" ])
        {
            NSLog(@"X is the winner");
            return @"X";
        }
        if ([self.myLabelThree.text isEqual: @"O" ] && [self.myLabelSix.text isEqual: @"O"] && [self.myLabelNine.text isEqual: @"O" ])
        {
            NSLog(@"O is the winner");
            return @"O";
        }

        //#8: 1 4 7
        if ([self.myLabelOne.text isEqual: @"X" ] && [self.myLabelFour.text isEqual: @"X"] && [self.myLabelSeven.text isEqual: @"X" ])
        {
            NSLog(@"X is the winner");
            return @"X";
        }
        if ([self.myLabelOne.text isEqual: @"O" ] && [self.myLabelFour.text isEqual: @"O"] && [self.myLabelSeven.text isEqual: @"O" ])
        {
            NSLog(@"O is the winner");
            return @"O";
        }
        return nil;
}

//assign @"" to all player labels
//asign X to "whichPlayerLabel"

-(void)resetBoard{
    self.myLabelOne.text = @"";
    self.myLabelTwo.text = @"";
    self.myLabelThree.text = @"";
    self.myLabelFour.text = @"";
    self.myLabelFive.text = @"";
    self.myLabelSix.text = @"";
    self.myLabelSeven.text = @"";
    self.myLabelEight.text = @"";
    self.whichPlayerLabel.text = @"X";
}
// method to call resetBoard when dismiss button on Alert View is pressed
// call resetBoard

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self resetBoard];
}

@end