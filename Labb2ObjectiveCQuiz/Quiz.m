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
@end

@implementation Quiz
-(instancetype)init{
    self = [super init];
    self.questions = @[
                       @[@"När använder man antibiotika?", @"Mot bakterier", @"Mot virus", @"Mot cancer", @"Mot parasiter", @"Mot bakterier"],
                       @[@"Vad heter USA:s vicepresident?", @"Mike Pence", @"Joe Bidén", @"Stefan Lövfen", @"Göran Hägglund", @"Mike Pence"],
                       @[@"Vilket organ är störst?", @"Lever", @"Njure", @"Hjärta", @"Mjälte", @"Lever"],
                       @[@"Var produceras kortisol?", @"Thymus", @"Pankreas", @"Binjuren", @"Tyroidea", @"Binjure"]];
    return self;
}

-(void)chooseQuestion{
    self.questionNr = arc4random_uniform(self.questions.count);
}

-(NSArray*)questionAndAnswer{
    return self.questions[_questionNr];
}

-(BOOL)isRightAnswer:(NSString*)string{
    return [string isEqualToString:self.questions[self.questionNr][5]];
}
@end
