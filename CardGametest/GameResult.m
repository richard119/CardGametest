//
//  GameResult.m
//  CardGametest
//
//  Created by Richard on 13-6-17.
//  Copyright (c) 2013年 Richard. All rights reserved.
//

#import "GameResult.h"

@interface GameResult()
@property (readwrite,nonatomic) NSDate *start;
@property (readwrite,nonatomic) NSDate *end;
@end

@implementation GameResult

#define ALL_RESULTS_KEY @"GameResult_all"
#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"

+ (NSArray *)allGameResult{
    NSMutableArray *allGameResults = [[NSMutableArray alloc] init];
    
    for (id plist in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues]) {
        GameResult *result = [[GameResult alloc] initFromPropertyList:plist];
        [allGameResults addObject:result];
    }
    
    return allGameResults;
}

-(id)initFromPropertyList:(id)plist{
    self = [self init];
    if (self) {
        if ([plist isKindOfClass:[NSDictionary class]]) {
            NSDictionary *resultDict = (NSDictionary *)plist;
            _start = resultDict[START_KEY];
            _end = resultDict[END_KEY];
            _score = [resultDict[SCORE_KEY] intValue];
            if(!_start || !_end) self = nil;
        }
    }
    
    return self;
}

-(void)synchronize{
    NSMutableDictionary *mutableGameResultDefault = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if(!mutableGameResultDefault) mutableGameResultDefault = [[NSMutableDictionary alloc] init];
    mutableGameResultDefault[[self.start description]] = [self asPropertyList];
    [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultDefault forKey:ALL_RESULTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(id)asPropertyList{
    return @{START_KEY: self.start, END_KEY:self.end,SCORE_KEY:@(self.score)};
}


-(id)init{
    self = [super init];
    if (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

- (NSTimeInterval)duration{
    return [self.end timeIntervalSinceDate:self.start];
}

-(void)setScore:(int)score{
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
}

@end
