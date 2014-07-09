//
//  ViewController.m
//  Paird
//
//  Created by Robert Figueras on 7/8/14.
//
//

#import "ViewController.h"

@interface ViewController ()
@property NSMutableArray *contestants;
@property NSMutableArray *arrayOfPairs;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arrayOfPairs = [[NSMutableArray alloc]init];
    self.contestants = [[NSMutableArray alloc] initWithObjects:@"A",
                        @"B",
                        @"C",
                        @"D",
                        @"E",
                        @"F",
                        @"G",
                        @"H",
                        @"I",
                        @"J",
                        @"K",
                        nil];

    [self selectContestants:self.contestants];
}

- (void) selectContestants: (NSMutableArray *) contestants
{
    NSString *randomContestantOneString = [contestants objectAtIndex:(arc4random()%contestants.count)];
    NSDictionary *firstContestantDict = [[NSDictionary alloc] initWithObjectsAndKeys:randomContestantOneString,@"firstContestant", nil];
    [contestants removeObject:randomContestantOneString];

    NSString *randomContestantTwoString = [contestants objectAtIndex:(arc4random()%contestants.count)];
    NSDictionary *secondContestantDict = [[NSDictionary alloc] initWithObjectsAndKeys:randomContestantTwoString,@"secondContestant", nil];
    [contestants removeObject:randomContestantTwoString];

    NSArray *pairArray = [[NSArray alloc] initWithObjects:firstContestantDict, secondContestantDict, nil];
    [self.arrayOfPairs addObject:pairArray];

    if (contestants.count>1)
    {
        [self selectContestants:contestants];
    }
    else
    {
        NSLog(@"self.arrayOfPairs: %@", self.arrayOfPairs);
    }
}



@end
