//
//  CTMediator+CTMediatorActions.h
//  weiKit
//
//  Created by 赵申侃 on 2018/9/26.
//  Copyright © 2018 zsk. All rights reserved.
//

#import "CTMediator.h"


@interface CTMediator (CTMediatorActions)

- (UIViewController *)FactoryViewController:(NSString *)ViewController WithParams:(NSDictionary *)params;

- (void )FactoryAlertViewControllerWithTitle:(NSString *)title message:(NSString *)message Canceltitle:(NSString *)cancelTitle okTitle:(NSString *)okTitle style:(UIAlertControllerStyle )alertStyle  CancelAction:(void(^)(NSDictionary *info))cancelAction OkAction:(void(^)(NSDictionary *info))okAction;

- (void)FactoryOpenCameraWithTakePhotoAction:(void(^)(NSDictionary *info))takePhotoAction SelectPhotoAction:(void(^)(NSDictionary *info))selectPhotoAction;

- (UICollectionViewCell *)FactoryCollectionViewCellWithIdentifier:(NSString *)identifier CollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath params:(NSDictionary *)params;

@end

