//
//  ViewController.m
//  渐变效果
//
//  Created by subaozi on 16/7/28.
//  Copyright © 2016年 subaozi. All rights reserved.
//

#import "ViewController.h"
#import "GPViewController.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"呵呵";
//    self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [self.navigationController.navigationBar setTitleTextAttributes:attrs];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(left)];
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(right)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    //导航栏item字体颜色
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.backBarButtonItem = backItem;
    
    //导航栏透明与导航栏底部分割线，如果有图片高为64的话，直接设置图片就可以了，除此之外还可以用代码，这边的例子全部用代码背景色转图片来设置，先设置整个view的背景色为
    self.view.backgroundColor = [UIColor greenColor];//如果透明看到的就是绿色。然后在分别设置
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]]];//这样就是透明的了
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:(self.tableView.contentOffset.y + 69) / 64]] forBarMetrics:UIBarMetricsDefault];
}

//这边用的imageWithBgColor方法
-(UIImage *)imageWithBgColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

-(void)back{
    
}



-(void)left{
    
}

-(void)right{
    
    GPViewController *vc = [[GPViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}



//IOS导航栏颜色渐变与常用属性
//导航栏背景色设置:
//self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
//导航栏标题颜色字体大小
//NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//attrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
//attrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
//[self.navigationController.navigationBar setTitleTextAttributes:attrs];
//导航栏左右item
//UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(left)];
//self.navigationItem.leftBarButtonItem = leftItem;
//UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(right)];
//self.navigationItem.rightBarButtonItem = rightItem;

//导航栏item字体颜色
//self.navigationController.navigationBar.tintColor = [UIColor redColor];如果要不同item不同颜色，那么item要带一个自定义按钮，在设置按钮属性
//当前控制器的下一个控制的返回item去掉文字只保留箭头
//UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(back)];
//self.navigationItem.backBarButtonItem = backItem;
//导航栏透明与导航栏底部分割线，如果有图片高为64的话，直接设置图片就可以了，除此之外还可以用代码，这边的例子全部用代码背景色转图片来设置，先设置整个view的背景色为
//self.view.backgroundColor = [UIColor greenColor];如果透明看到的就是绿色。然后在分别设置
//[self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]] forBarMetrics:UIBarMetricsDefault];
//[self.navigationController.navigationBar setShadowImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]]];这样就是透明的了
//如果要监听滚动而使导航栏颜色渐变，那么可以在scrollView的代理方法中添加这样的代码
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    [self.navigationController.navigationBar setBackgroundImage:[self imageWithBgColor:[UIColor colorWithRed:1 green:0 blue:0 alpha:self.tableView.contentOffset.y / 100]] forBarMetrics:UIBarMetricsDefault];
//}
//这边用的imageWithBgColor方法
//-(UIImage *)imageWithBgColor:(UIColor *)color {
//    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return image;
//}
//最后大致的效果点左边是默认颜色，点右边透明，滚动渐变，就在这记下这些了，希望有可以帮助到的地方~~







-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    cell.textLabel.text = @"哈哈";
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
