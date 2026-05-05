//
// ModSkinDSGaming.h
// ModSkinDSGM
//
// Created by DS Gaming on 08/02/2021
// Long live Vietnam
//
// djt me bon an cap khong ghi nguon
//

#import "ModSkinDSGaming.h"

@implementation ModSkinDSGM

UIAlertController *alertCtrl;
UIAlertController *dialogCtrl;
NSFileManager *fileManager = [NSFileManager defaultManager];
NSString *documentDir = [NSSearchPathForDirectoriesInDomains(
    NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
bool check_Mod = false;

+ (void)ActiveModDSGM {

  dialogCtrl =
      [UIAlertController alertControllerWithTitle:@"Link Download Data"
                                          message:@"Vui Lòng Nhập Link Mod Skin"
                                   preferredStyle:UIAlertControllerStyleAlert];
  [dialogCtrl addTextFieldWithConfigurationHandler:^(UITextField *Text) {
    Text.placeholder = @"Enter Link ...";
  }];
  [dialogCtrl addAction:[UIAlertAction actionWithTitle:@"Hủy"
                                                 style:UIAlertActionStyleCancel
                                               handler:nil]];
  [dialogCtrl addAction:
                  [UIAlertAction
                      actionWithTitle:@"OK"
                                style:UIAlertActionStyleDefault
                              handler:
                                  ^(UIAlertAction *_Nonnull action) {
                                    UITextField *inputFieldDSGM =
                                        dialogCtrl.textFields.firstObject;
                                    NSString *inputTextDSGM =
                                        inputFieldDSGM.text;
                                    NSString *convertedLinkDSGM = [inputTextDSGM
                                        stringByReplacingOccurrencesOfString:
                                            @"file/d/"
                                                                  withString:
                                                                      @"uc?"
                                                                      @"export="
                                                                      @"downloa"
                                                                      @"d&id="];
                                    convertedLinkDSGM = [convertedLinkDSGM
                                        stringByReplacingOccurrencesOfString:
                                            @"/view?usp=drivesdk"
                                                                  withString:
                                                                      @""];
                                    NSString *dataPathDSGM = [documentDir
                                        stringByAppendingPathComponent:@"/"];
                                    NSString *backupPathDSGM = [documentDir
                                        stringByAppendingPathComponent:
                                            @"/Resources.backup"];
                                    NSString *old_file_DSGM = [documentDir
                                        stringByAppendingPathComponent:
                                            @"/Resources"];

                                    if ([inputTextDSGM isEqualToString:@""]) {

                                      alertCtrl = [UIAlertController
                                          alertControllerWithTitle:@"Warring"
                                                           message:
                                                               @"Vui lòng nhập "
                                                               @" "
                                                               @"Link "
                                                               @"tải Mod Skin"
                                                    preferredStyle:
                                                        UIAlertControllerStyleAlert];
                                      [alertCtrl
                                          addAction:
                                              [UIAlertAction
                                                  actionWithTitle:@"Đóng"
                                                            style:
                                                                UIAlertActionStyleDefault
                                                          handler:nil]];
                                      [[UIApplication sharedApplication]
                                              .keyWindow.rootViewController
                                          presentViewController:alertCtrl
                                                       animated:YES
                                                     completion:nil];
                                    } else {
                                      if ([fileManager
                                              fileExistsAtPath:old_file_DSGM]) {
                                        if (![fileManager fileExistsAtPath:
                                                              backupPathDSGM]) {
                                          alertCtrl = [UIAlertController
                                              alertControllerWithTitle:
                                                  @"Creating"
                                                               message:
                                                                   @"Đang Tạo "
                                                                   @"File "
                                                                   @"Backup "
                                                                   @"... "
                                                        preferredStyle:
                                                            UIAlertControllerStyleAlert];
                                          [[UIApplication sharedApplication]
                                                  .keyWindow.rootViewController
                                              presentViewController:alertCtrl
                                                           animated:YES
                                                         completion:nil];
                                          timer(2) {
                                            [alertCtrl
                                                dismissViewControllerAnimated:
                                                    YES
                                                                   completion:
                                                                       nil];
                                          });

                                          NSError *backupError;
                                          if (![fileManager
                                                  copyItemAtPath:
                                                      [dataPathDSGM
                                                          stringByAppendingPathComponent:
                                                              @"/Resources"]
                                                          toPath:backupPathDSGM
                                                           error:&
                                                                 backupError]) {
                                            alertCtrl = [UIAlertController
                                                alertControllerWithTitle:
                                                    @"Error"
                                                                 message:
                                                                     @"Không "
                                                                     @"Thể Tạo "
                                                                     @"File "
                                                                     @"Backup "
                                                                     @"Do Thư "
                                                                     @"Mục "
                                                                     @"Gốc "
                                                                     @"Không "
                                                                     @"Tồn Tại "
                                                                     @"Hoặc "
                                                                     @"Lỗi "
                                                                     @"Không "
                                                                     @"Xác Định"
                                                          preferredStyle:
                                                              UIAlertControllerStyleAlert];
                                            [alertCtrl
                                                addAction:
                                                    [UIAlertAction
                                                        actionWithTitle:@"Đóng"
                                                                  style:
                                                                      UIAlertActionStyleDefault
                                                                handler:nil]];
                                            [[UIApplication sharedApplication]
                                                    .keyWindow
                                                    .rootViewController
                                                presentViewController:alertCtrl
                                                             animated:YES
                                                           completion:nil];
                                          } else {
                                            check_Mod = true;
                                          }
                                        } else {
                                          check_Mod = true;
                                        }
                                      } else {
                                        alertCtrl = [UIAlertController
                                            alertControllerWithTitle:@"Error"
                                                             message:
                                                                 @"Không Thể "
                                                                 @"Tạo File "
                                                                 @"Backup "
                                                                 @"Do Thư Mục "
                                                                 @"Gốc "
                                                                 @"Không Tồn "
                                                                 @"Tại Hoặc "
                                                                 @"Lỗi Khác"
                                                      preferredStyle:
                                                          UIAlertControllerStyleAlert];
                                        [alertCtrl
                                            addAction:
                                                [UIAlertAction
                                                    actionWithTitle:@"Đóng"
                                                              style:
                                                                  UIAlertActionStyleDefault
                                                            handler:nil]];
                                        [[UIApplication sharedApplication]
                                                .keyWindow.rootViewController
                                            presentViewController:alertCtrl
                                                         animated:YES
                                                       completion:nil];
                                      }
                                      if (check_Mod == true) {
                                        timer(1.5) {
                                          alertCtrl = [UIAlertController
                                              alertControllerWithTitle:
                                                  @"Loading"
                                                               message:
                                                                   @"Đang Tải "
                                                                   @"Data Mod "
                                                                   @"Skin\nVui "
                                                                   @"Lòng Chờ "
                                                                   @"Trong "
                                                                   @"Giây Lát "
                                                                   @"..."
                                                        preferredStyle:
                                                            UIAlertControllerStyleAlert];
                                          [[UIApplication sharedApplication]
                                                  .keyWindow.rootViewController
                                              presentViewController:alertCtrl
                                                           animated:YES
                                                         completion:nil];
                                          timer(3) {
                                            [alertCtrl
                                                dismissViewControllerAnimated:
                                                    YES
                                                                   completion:
                                                                       nil];
                                          });
                                        });
                                        NSString *downloadUrlDSGM = [NSString
                                            stringWithFormat:@"%@",
                                                             convertedLinkDSGM];
                                        NSURLRequest *requestdsgm =
                                            [NSURLRequest
                                                requestWithURL:
                                                    [NSURL
                                                        URLWithString:
                                                            downloadUrlDSGM]];

                                        [NSURLConnection sendAsynchronousRequest:
                                                             requestdsgm
                                                                           queue:
                                                                               [NSOperationQueue
                                                                                   currentQueue]
                                                               completionHandler:
                                                                   ^(
                                                                       NSURLResponse
                                                                           *response,
                                                                       NSData *
                                                                           data,
                                                                       NSError *
                                                                           error) {
                                                                     if (error) {
                                                                       alertCtrl = [UIAlertController
                                                                           alertControllerWithTitle:
                                                                               @"Lỗi Máy Chủ"
                                                                                            message:
                                                                                                @"Tải Data "
                                                                                                @"Thất Bại"
                                                                                     preferredStyle:
                                                                                         UIAlertControllerStyleAlert];
                                                                       [alertCtrl
                                                                           addAction:
                                                                               [UIAlertAction
                                                                                   actionWithTitle:
                                                                                       @"Đóng"
                                                                                             style:
                                                                                                 UIAlertActionStyleDefault
                                                                                           handler:^(
                                                                                               UIAlertAction
                                                                                                   *_Nonnull action) {
                                                                                             check_Mod =
                                                                                                 false;
                                                                                           }]];
                                                                       [[UIApplication
                                                                            sharedApplication]
                                                                               .keyWindow
                                                                               .rootViewController
                                                                           presentViewController:
                                                                               alertCtrl
                                                                                        animated:
                                                                                            YES
                                                                                      completion:
                                                                                          nil];
                                                                     } else {
                                                                       NSString *tempZipPath =
                                                                           [documentDir
                                                                               stringByAppendingPathComponent:
                                                                                   @"Mod Skin.zip"];
                                                                       [data
                                                                           writeToFile:
                                                                               tempZipPath
                                                                            atomically:
                                                                                YES];
                                                                       BOOL success = [SSZipArchive
                                                                           unzipFileAtPath:
                                                                               tempZipPath
                                                                             toDestination:
                                                                                 dataPathDSGM];
                                                                       [fileManager
                                                                           removeItemAtPath:
                                                                               tempZipPath
                                                                                      error:
                                                                                          nil];
                                                                       if (success) {
                                                                         alertCtrl = [UIAlertController
                                                                             alertControllerWithTitle:
                                                                                 @"Successfully"
                                                                                              message:
                                                                                                  @"Mod "
                                                                                                  @"Skin "
                                                                                                  @"Thành "
                                                                                                  @"Công!"
                                                                                       preferredStyle:
                                                                                           UIAlertControllerStyleAlert];
                                                                         [alertCtrl
                                                                             addAction:
                                                                                 [UIAlertAction
                                                                                     actionWithTitle:
                                                                                         @"OK"
                                                                                               style:
                                                                                                   UIAlertActionStyleDefault
                                                                                             handler:^(
                                                                                                 UIAlertAction
                                                                                                     *_Nonnull action) {
                                                                                               check_Mod =
                                                                                                   false;
                                                                                             }]];
                                                                         [[UIApplication
                                                                              sharedApplication]
                                                                                 .keyWindow
                                                                                 .rootViewController
                                                                             presentViewController:
                                                                                 alertCtrl
                                                                                          animated:
                                                                                              YES
                                                                                        completion:
                                                                                            nil];
                                                                       } else {
                                                                         alertCtrl = [UIAlertController
                                                                             alertControllerWithTitle:
                                                                                 @"Error"
                                                                                              message:
                                                                                                  @"Giải "
                                                                                                  @"Nén "
                                                                                                  @"Tệp Zip "
                                                                                                  @"Thất "
                                                                                                  @"Bại\nVui"
                                                                                                  @" "
                                                                                                  @"Lòng "
                                                                                                  @"Tạo "
                                                                                                  @"Tệp Zip "
                                                                                                  @"Như "
                                                                                                  @"Hướng "
                                                                                                  @"Dẫn"
                                                                                       preferredStyle:
                                                                                           UIAlertControllerStyleAlert];
                                                                         [alertCtrl
                                                                             addAction:
                                                                                 [UIAlertAction
                                                                                     actionWithTitle:
                                                                                         @"Đóng"
                                                                                               style:
                                                                                                   UIAlertActionStyleDefault
                                                                                             handler:^(
                                                                                                 UIAlertAction
                                                                                                     *_Nonnull action) {
                                                                                               check_Mod =
                                                                                                   false;
                                                                                             }]];
                                                                         [[UIApplication
                                                                              sharedApplication]
                                                                                 .keyWindow
                                                                                 .rootViewController
                                                                             presentViewController:
                                                                                 alertCtrl
                                                                                          animated:
                                                                                              YES
                                                                                        completion:
                                                                                            nil];
                                                                       }
                                                                     }
                                                                   }];
                                      }
                                    }
                                  }]];
  [[UIApplication sharedApplication].keyWindow.rootViewController
      presentViewController:dialogCtrl
                   animated:YES
                 completion:nil];
}

+ (void)RemoveModDSGM {

  NSString *dataPathDSGM = [documentDir stringByAppendingPathComponent:@"/"];
  NSString *backupPathDSGM =
      [documentDir stringByAppendingPathComponent:@"/Resources.backup"];

  if ([fileManager fileExistsAtPath:backupPathDSGM]) {
    NSError *deleteErrorDSGM;
    if ([fileManager
            removeItemAtPath:[dataPathDSGM
                                 stringByAppendingPathComponent:@"/Resources"]
                       error:&deleteErrorDSGM]) {
      NSError *renameErrorDSGM;
      if ([fileManager
              moveItemAtPath:backupPathDSGM
                      toPath:[dataPathDSGM
                                 stringByAppendingPathComponent:@"/Resources"]
                       error:&renameErrorDSGM]) {
        alertCtrl = [UIAlertController
            alertControllerWithTitle:@"Successfully"
                             message:@"Dữ Liệu Đã Được Khôi Phục!"
                      preferredStyle:UIAlertControllerStyleAlert];
        [alertCtrl
            addAction:[UIAlertAction actionWithTitle:@"OK"
                                               style:UIAlertActionStyleDefault
                                             handler:nil]];
        [[UIApplication sharedApplication].keyWindow.rootViewController
            presentViewController:alertCtrl
                         animated:YES
                       completion:nil];
      } else {
        alertCtrl = [UIAlertController
            alertControllerWithTitle:@"Error"
                             message:@"File Backup Không Hợp Lệ Hoặc Lỗi Không "
                                     @"Xác Định"
                      preferredStyle:UIAlertControllerStyleAlert];
        [alertCtrl
            addAction:[UIAlertAction actionWithTitle:@"Đóng"
                                               style:UIAlertActionStyleDefault
                                             handler:nil]];
        [[UIApplication sharedApplication].keyWindow.rootViewController
            presentViewController:alertCtrl
                         animated:YES
                       completion:nil];
      }
    } else {
      alertCtrl = [UIAlertController
          alertControllerWithTitle:@"Error"
                           message:@"Không Thể Khôi Phục Dữ Liệu Do Thư Mục / "
                                   @"File Không Tồn Tại"
                    preferredStyle:UIAlertControllerStyleAlert];
      [alertCtrl
          addAction:[UIAlertAction actionWithTitle:@"Đóng"
                                             style:UIAlertActionStyleDefault
                                           handler:nil]];
      [[UIApplication sharedApplication].keyWindow.rootViewController
          presentViewController:alertCtrl
                       animated:YES
                     completion:nil];
    }
  } else {
    alertCtrl = [UIAlertController
        alertControllerWithTitle:@"Error"
                         message:
                             @"Không Có File Backup Hoặc Hiện Đã Là Data Gốc"
                  preferredStyle:UIAlertControllerStyleAlert];
    [alertCtrl
        addAction:[UIAlertAction actionWithTitle:@"Đóng"
                                           style:UIAlertActionStyleDefault
                                         handler:nil]];
    [[UIApplication sharedApplication].keyWindow.rootViewController
        presentViewController:alertCtrl
                     animated:YES
                   completion:nil];
  }
}

@end