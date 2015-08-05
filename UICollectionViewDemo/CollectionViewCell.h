//
//  CollectionViewCell.h
//  UICollectionViewDemo
//
//  Created by hedawei on 15/8/5.
//  Copyright (c) 2015年 hedawei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CollectionModel;
@interface CollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) CollectionModel *model;
+ (NSString *)xib;

@end
