//
//  ViewController.m
//  TestGit
//
//  Created by apple on 2018/8/1.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "CustomConfig.h"
#import "TestStackView.h"

@interface ViewController ()<UISearchResultsUpdating, UISearchControllerDelegate>

@property (nonatomic, strong) UISearchController *searchController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testNotification];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 通知中心测试
- (void)testNotification {
    self.navigationItem.title = @"notify test";
    NSLog(@"--------");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationAction:) name:@"notifyTest" object:nil];
    NSLog(@"--------");
}

- (void)notificationAction:(NSNotification *)sender {
    
}

#pragma mark - setupTestStackView
- (void)setupTestStackView {
    TestStackView *view = [[TestStackView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    
    NSLog(@"%@", ((UIView *)[view.subviews firstObject].subviews));
}

#pragma mark - setupImageView
- (void)setupImageView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    UIImage *image = [self imageWithColor:[UIColor redColor] size:CGSizeMake(15, 15)];
    imageView.image = [self imgWithImg:image];
    imageView.contentMode = UIViewContentModeCenter;
    [self.view addSubview:imageView];
}

#pragma mark - 加载子控制器
- (void)setupChildControllers {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.delegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.searchBar.placeholder = @"搜索";
    [self.view addSubview:self.searchController.searchBar];
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.hidesNavigationBarDuringPresentation = YES;
    self.definesPresentationContext = YES;
}

- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)imgWithImg:(UIImage *)image {
    //1、开启上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    //2、设置裁剪区域
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    [path addClip];
    
    //3、绘制图片
    [image drawAtPoint:CGPointZero];
    
    //4、获取新图片
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //5、关闭上下文
    UIGraphicsEndImageContext();
    
    //6、返回新图片
    return newImage;
}

#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"%@", searchController.searchBar.text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
