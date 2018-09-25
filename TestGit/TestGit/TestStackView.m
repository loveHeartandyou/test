//
//  TestStackView.m
//  TestGit
//
//  Created by apple on 2018/8/30.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TestStackView.h"

@interface TestStackView ()

@property (nonatomic, strong) UIStackView *stackView;

@end

@implementation TestStackView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

#pragma mark - 加载子视图
- (void)setupSubViews {
    self.stackView = [[UIStackView alloc] initWithFrame:self.bounds];
    [self addSubview:self.stackView];
    
    UIView *firstView = [[UIView alloc] init];
    firstView.backgroundColor = [UIColor redColor];
    [self.stackView addArrangedSubview:firstView];
    
    UIView *secondView = [[UIView alloc] init];
    secondView.backgroundColor = [UIColor orangeColor];
    [self.stackView addArrangedSubview:secondView];
    
    self.stackView.spacing = 10;
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.distribution = UIStackViewDistributionFillEqually;
    self.stackView.alignment = UIStackViewAlignmentFill;
    NSLog(@"%@", firstView);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
