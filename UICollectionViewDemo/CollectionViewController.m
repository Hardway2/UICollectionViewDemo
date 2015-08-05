//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by hedawei on 15/8/5.
//  Copyright (c) 2015年 hedawei. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionModel.h"
#import "CollectionViewCell.h"

NSString *const ID = @"cell";

@interface CollectionViewController (){
    
    NSMutableArray *_array;
}

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //模拟数据
    _array = [NSMutableArray array];
    for (int i = 0; i < 100; i++) {
        CollectionModel *model = [[CollectionModel alloc] init];
        model.name = [NSString stringWithFormat:@"第%d个",i+1];
        model.image = @"美女";
        [_array addObject:model];
    }
    
    //注册
    UINib *nib = [UINib nibWithNibName:[CollectionViewCell xib] bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ID];
}

#pragma mark - UICollectionView DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _array.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.model = _array[indexPath.row];
    return cell;
}

#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    CollectionModel *model = _array[indexPath.row];
    NSLog(@"你点击了%@",model.name);
}

@end
