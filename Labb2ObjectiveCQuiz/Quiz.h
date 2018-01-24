//
//  Quiz.h
//  Labb2ObjectiveCQuiz
//
//  Created by lösen är 0000 on 2018-01-20.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject
@property (nonatomic) int points;

-(instancetype)init;
-(void)chooseQuestion;
-(NSArray*)questionAndAnswer;
-(BOOL)isRightAnswer:(NSString*)string;
@end
