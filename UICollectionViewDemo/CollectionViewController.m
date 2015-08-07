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
#import "CollectionReusableView.h"

#define ScreenW [UIScreen mainScreen].bounds.size.width

NSString *const ID = @"cell";
NSString *const HeaderID = @"reusableView";

@interface CollectionViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>{
    
    NSMutableArray *_array;
}

@end

@implementation CollectionViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置每一个各自的大小
    flow.itemSize = CGSizeMake(ScreenW/2-10, 109);
    
    // 水平方向上的间距
    flow.minimumInteritemSpacing = 10;
    
    // 垂直方向上的间距
    flow.minimumLineSpacing = 10;
    
    flow.headerReferenceSize = CGSizeMake(ScreenW, 200);

    flow.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
    
    return [self initWithCollectionViewLayout:flow];
}

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
    UINib *headerNib = [UINib nibWithNibName:[CollectionReusableView xib] bundle:nil];
    
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:ID];
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];
    self.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
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

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:
                                   UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID forIndexPath:indexPath];
    return header;
}

#pragma mark - UICollectionView Delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    CollectionModel *model = _array[indexPath.row];
    NSLog(@"你点击了%@",model.name);
}

@end
