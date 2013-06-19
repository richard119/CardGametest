//
//  GameResultViewController.m
//  CardGametest
//
//  Created by Richard on 13-6-15.
//  Copyright (c) 2013年 Richard. All rights reserved.
//

#import "GameResultViewController.h"
#import "GameResult.h"

@interface GameResultViewController ()
@property (weak, nonatomic) IBOutlet UITextView *display;
@end

@implementation GameResultViewController

-(void)updateUI{
    NSString *displayText = @"";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    for (GameResult *result in [GameResult allGameResult]) {
        displayText = [displayText stringByAppendingFormat:@"Score: %d (%@, %1.2gs) \n", result.score,[dateFormatter stringFromDate:result.end], result.duration];
    }
    self.display.text = displayText;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateUI];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self setup];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void) setup{
    // initialization that can not wait until viewDidload
}

-(void)awakeFromNib{
    [self setup];
}



@end
