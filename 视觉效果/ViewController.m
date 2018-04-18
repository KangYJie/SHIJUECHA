//
//  ViewController.m
//  视觉效果
//
//  Created by djzx on 2018/4/8.
//  Copyright © 2018年 djzx. All rights reserved.
//

#import "ViewController.h"
#import "KYJTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    if ([[NSThread currentThread] isMainThread]) {
//        NSLog(@"主线程===");
//    }
//    [NSThread currentThread].name = @"主线程";
////    休眠
//    [NSThread sleepForTimeInterval:3];
//    NSLog(@"%@",[NSThread currentThread].name);
//
////    dispatch_get_main_queue();
//
#pragma  mark     GCD 队列组 dispath_group
//    //    并发
//    dispatch_queue_t queue = dispatch_queue_create("测试队列组", DISPATCH_QUEUE_CONCURRENT);
//    dispatch_group_t group = dispatch_group_create();
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"我是队列1");
//    });
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"我是队列2");
//
//    });
//
//    dispatch_group_notify(group, queue, ^{
//        NSLog(@"整组任务完成");
//
//    });
    
//    dispatch_queue_t queuetest = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
//    dispatch_async(queuetest, ^{
////        gcd 遍历
//        dispatch_apply(100000, queuetest, ^(size_t index) {
//            NSLog(@"任务==%zu", index);
//
//        });
//
//    });
//
//    for (int i=0; i<100000; i++) {
//        NSLog(@"%d",i);
//    }
#pragma  mark -线程栅栏 dispatch-barrier
//    线程栅栏 dispatch-barrier
//    dispatch_queue_t queue = dispatch_queue_create("测试队列组", DISPATCH_QUEUE_CONCURRENT);
//    for (int i=0; i<4; i++) {
//        dispatch_async(queue, ^{
//            sleep(3);
//            NSLog(@"任务结束%d",i);
//        });
//    }
//    NSLog(@"代码经过栅栏");
//    dispatch_barrier_sync(queue, ^{
//        sleep(3);
//        NSLog(@"栅栏over");
//
//    });
//    NSLog(@"代码通过栅栏");
//
//    for (int i=4; i<8; i++) {
//        dispatch_async(queue, ^{
//            sleep(3);
//            NSLog(@"任务结束%d",i);
//        });
//    }
//    
//    NSLog(@"代码结束");
    

    [self createTabview];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)createTabview{
    self.KYJtabview.delegate = self;
    self.KYJtabview.dataSource =self;
    
}

#pragma mark - tabviewdelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 11;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //需要在xib设置identifier
    [tableView registerNib:[UINib nibWithNibName:@"KYJTableViewCell"bundle:[NSBundle mainBundle]]forCellReuseIdentifier:@"KYJTableViewCell"];
    KYJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KYJTableViewCell"];
    cell.cellImv.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",indexPath.row+1]];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 300;
}
#pragma mark - scollview delegata
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    获取当前屏幕上可见cell
    
    NSArray *VisibleCells = [self.KYJtabview visibleCells];
    
    for (KYJTableViewCell * cell in VisibleCells) {
        //可见视图设置->背景图片y值
        [cell cellOnTableView:self.KYJtabview didScrollView:self.view];
    }
    
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
