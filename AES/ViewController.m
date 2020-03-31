//
//  ViewController.m
//  AES
//
//  Created by 姚军辉 on 2020/3/31.
//  Copyright © 2020 姚军辉. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Tool.h"
#import "NSData+Tool.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (nonatomic, copy) NSString * inputStr;
@end

static NSString *kAESKey = @"jfdjk670qEH5lm3b";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSString *)inputStr
{
    return self.textField.text ? : @"";
}

- (IBAction)encryptAction:(UIButton *)sender {
    NSString *result = [self.inputStr aes_encryptWithKey:kAESKey iv:nil];
    NSLog(@"%@加密后结果===%@",self.inputStr,result);
    self.resultLabel.text = result;
}

- (IBAction)decryptAction:(UIButton *)sender {
    NSString *encryptStr = [self.inputStr aes_encryptWithKey:kAESKey iv:nil];
    NSString *result = [encryptStr aes_decryptWithKey:kAESKey iv:nil];
    NSLog(@"%@解密后结果===%@",encryptStr,result);
    self.resultLabel.text = result;
}


@end
