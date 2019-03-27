//
//  CTMediator+CTMediatorActions.m
//  weiKit
//
//  Created by 赵申侃 on 2018/9/26.
//  Copyright © 2018 zsk. All rights reserved.
//  这是刚刚修改的asdad

#import "CTMediator+CTMediatorActions.h"

NSString * const kCTMediatorTargetFZ = @"SK";
NSString * const kCTMediatorTargetCommon = @"Common";
NSString * const kCTMediatorTargetCell = @"Cell";


@implementation CTMediator (CTMediatorActions)

- (UIViewController *)FactoryViewController:(NSString *)ViewController WithParams:(NSDictionary *)params
{
    UIViewController *viewController = [self performTarget:kCTMediatorTargetFZ action:ViewController params:params shouldCacheTarget:NO];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        // view controller 交付出去之后，可以由外界选择是push还是present
        return viewController;
    } else {
        // 这里处理异常场景，具体如何处理取决于产品
        return [[UIViewController alloc] init];
    }
}

- (void)FactoryAlertViewControllerWithTitle:(NSString *)title message:(NSString *)message Canceltitle:(NSString *)cancelTitle okTitle:(NSString *)okTitle style:(UIAlertControllerStyle )alertStyle CancelAction:(void(^)(NSDictionary *info))cancelAction OkAction:(void(^)(NSDictionary *info))okAction
{
    NSDictionary *params = @{@"title":title,@"message":message,@"cancelTitle":cancelTitle,@"okTitle":okTitle,@"style":[NSString stringWithFormat:@"%ld",(long)alertStyle],@"cancelAction":cancelAction,@"okAction":okAction};
    [self performTarget:kCTMediatorTargetCommon action:@"showAlert" params:params shouldCacheTarget:NO];
}

- (void)FactoryOpenCameraWithTakePhotoAction:(void(^)(NSDictionary *info))takePhotoAction SelectPhotoAction:(void(^)(NSDictionary *info))selectPhotoAction
{
    NSDictionary *params = @{@"takePhotoAction":takePhotoAction,@"selectPhotoAction":selectPhotoAction};
    [self performTarget:kCTMediatorTargetCommon action:@"showPhotoActionSheet" params:params shouldCacheTarget:NO];
}

- (UICollectionViewCell *)FactoryCollectionViewCellWithIdentifier:(NSString *)identifier CollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath params:(NSDictionary *)params
{
    NSDictionary *dic = @{@"identifier":identifier,
                          @"collectionView":collectionView,
                          @"indexPath":indexPath,
                          @"params":params,
                          };
    UICollectionViewCell *cell = [self performTarget:kCTMediatorTargetCell action:identifier params:dic shouldCacheTarget:NO];
    if ([cell isKindOfClass:[UICollectionViewCell class]]) {
        return cell;
    } else {
        return [[UICollectionViewCell alloc] init];
    }
}

@end
