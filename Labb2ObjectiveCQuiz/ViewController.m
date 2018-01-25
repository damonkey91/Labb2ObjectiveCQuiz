//
//  ViewController.m
//  Labb2ObjectiveCQuiz
//
//  Created by lösen är 0000 on 2018-01-20.
//  Copyright © 2018 lösen är 0000. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *questionTextView;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (nonatomic) Quiz *quiz;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) UIButton *tmpButton;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
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
    [self disableOrEnableButtons:NO];
    UIButton *button = sender;
    self.nextButton.hidden = NO;
    if ([self.quiz isRightAnswer:button.titleLabel.text]) {
        button.backgroundColor = [UIColor greenColor];
    }else
        button.backgroundColor = [UIColor redColor];
    self.tmpButton = button;
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.quiz.points];
    
}

- (IBAction)next:(id)sender {
    if ([self.quiz endGame]) {
        TableViewController *tableView = [self.storyboard instantiateViewControllerWithIdentifier:@"TableIdentifier"];
       tableView.quiz = self.quiz;
        [self.navigationController pushViewController:tableView animated:YES];
    }
    self.tmpButton.backgroundColor = [UIColor whiteColor];
    [self disableOrEnableButtons:YES];
    [self.quiz chooseQuestion];
    [self insertText];
    self.nextButton.hidden = YES;
    
}

-(void)insertText{
    NSArray *array = [self.quiz questionAndAnswer];
    self.questionTextView.text = array[0];
    [self.button1 setTitle:array[1] forState:UIControlStateNormal];
    [self.button2 setTitle:array[2] forState:UIControlStateNormal];
    [self.button3 setTitle:array[3] forState:UIControlStateNormal];
    [self.button4 setTitle:array[4] forState:UIControlStateNormal];
}

-(void)disableOrEnableButtons:(BOOL)choise{
    self.button1.enabled = choise;
    self.button2.enabled = choise;
    self.button3.enabled = choise;
    self.button4.enabled = choise;
}

@end
