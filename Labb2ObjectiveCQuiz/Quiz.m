//
//  Quiz.m
//  Labb2ObjectiveCQuiz
//
//  Created by lösen är 0000 on 2018-01-20.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import "Quiz.h"
@interface Quiz()
@property (nonatomic) NSArray *questions;
@property (nonatomic) int questionNr;
@property (nonatomic) NSMutableSet *usedQuestions;
@end

@implementation Quiz
-(instancetype)init{
    self = [super init];
    self.questions = @[
        @[@"När använder man antibiotika?", @"Mot bakterier", @"Mot virus", @"Mot cancer", @"Mot parasiter"],
        @[@"Vilket organ är störst?", @"Lever", @"Njure", @"Hjärta", @"Mjälte"],
        @[@"Var produceras kortison?", @"Binjuren", @"Pankreas", @"Thymus", @"Tyroidea"],
        @[@"Vilke är den kemiska benämningen för bly?", @"Pb", @"Hg", @"Ag", @"B"],
        @[@"Vilken är den kemiska benämningen för syre?", @"O", @"S", @"Si", @"Fe"],
        @[@"Naturliga pärlor bildas inte i musslor såvida det inte är...?", @"ett intrång", @"brist på mat", @"brist på syre", @"jordbävning"],
        @[@"Vilken är den kemiska benämningen för etanol(alkohol)?", @"C2H5OH", @"CH3OH", @"C3H7OH", @"C4H9OH"],
        @[@"Vilken grupp är en tiol?", @"R-SH", @"R-OH", @"R-NH2", @"R-COO-R"],
        @[@"Vilken är en ester?", @"R-COO-R", @"R-O-R", @"R-COOH", @"R-CHO"],
        @[@"Vilken är en keton?", @"R-(CO)-R", @"R-COOH", @"R-CHO", @"R-OH"],
        @[@"Vilken är en karboxylsyra?", @"R-COOH", @"R-O-R", @"R-CHO", @"R-NH2"],
        @[@"Vilken ändelse slutar akoholer på?", @"-ol", @"-on", @"-os", @"-al"],
        @[@"Vad står ATP för?", @"Adenosintrifosfat", @"Alanintrifosfat", @"Arginintrifosfat", @"Asparagintrifosfat"],
        @[@"Vilken är den rätta kopplingen mellan basparen i DNA?", @"A-T, C-G", @"A-R, C-G", @"A-G, C-T", @"T-G, A-C"]];
    [self chooseQuestion];
    self.usedQuestions = [[NSMutableSet alloc] init];
    return self;
}

-(void)chooseQuestion{
    NSNumber *number;
    do{
        number = [NSNumber numberWithInt:arc4random_uniform(self.questions.count)];
    }while([self.usedQuestions containsObject:number]);
    [self.usedQuestions addObject:number];
    self.questionNr = [number intValue];
}
-(NSArray*)questionAndAnswer{
    NSMutableArray *answersArray = [[NSMutableArray alloc] init];
    [answersArray addObject:self.questions[self.questionNr][0]];
    NSArray *numbers = [self randomNumbers];
    for (int i = 0; i < 4; i++) {
        int index = [numbers[i] intValue];
        [answersArray addObject: self.questions[self.questionNr][index]];
    }
    
    return answersArray;
}

-(NSArray*)randomNumbers{
    NSMutableArray *numbers = [[NSMutableArray alloc] init];
    while(numbers.count < 4) {
        NSNumber *random = [NSNumber numberWithInt:arc4random_uniform(4) + 1];
        if (![numbers containsObject:random]) {
            [numbers addObject:random];
        }
    }
    return numbers;
}

-(BOOL)isRightAnswer:(NSString*)string{
    BOOL answer = [string isEqualToString:self.questions[self.questionNr][1]];
    if (answer) {
        self.points++;
    }
    return answer;
}

-(BOOL)endGame{
    return self.usedQuestions.count == 4;
}
@end
