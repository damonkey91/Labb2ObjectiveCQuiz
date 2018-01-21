//
//  ViewController.m
//  Labb2ObjectiveCQuiz
//
//  Created by lösen är 0000 on 2018-01-20.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *questionTextView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (nonatomic) Quiz *quiz;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.quiz = [[Quiz alloc]init];
    [self insertText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)answered:(id)sender {
    UIButton *button = sender;
    NSLog(button.titleLabel.text);
    if ([self.quiz isRightAnswer:button.titleLabel.text]) {
        
    }
    
}

- (IBAction)next:(id)sender {
    [self.quiz chooseQuestion];
    [self insertText];
}

-(void)insertText{
    NSArray *array = [self.quiz questionAndAnswer];
    self.questionTextView.text = array[0];
    [self.button1 setTitle:array[1] forState:UIControlStateNormal];
    [self.button2 setTitle:array[2] forState:UIControlStateNormal];
    [self.button3 setTitle:array[3] forState:UIControlStateNormal];
    [self.button4 setTitle:array[4] forState:UIControlStateNormal];
}

@end
