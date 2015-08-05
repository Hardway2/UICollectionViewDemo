//
//  CollectionViewCell.m
//  UICollectionViewDemo
//
//  Created by hedawei on 15/8/5.
//  Copyright (c) 2015年 hedawei. All rights reserved.
//

#import "CollectionViewCell.h"
#import "CollectionModel.h"

@interface CollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation CollectionViewCell

+ (NSString *)xib{

    return @"CollectionViewCell";
}

- (void)setModel:(CollectionModel *)model{

    _model = model;
    _imageView.image = [UIImage imageNamed:model.image];
    _label.text = model.name;
}

@end
