import { CommonConstants } from '../common/constants/CommonConstants'
import { logger } from '../common/utils/logger'
import { routerManager } from '../common/utils/RouterManager'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
@Preview
struct Guide {
  @State showStep:number = 1

  build() {
    Stack() {
      /*step one*/
      Column() {
        Image($r('app.media.ui_main_guide_remind'))
          .width(200)
          .height(200)
          .margin({top:100})
        Text($r('app.string.guide_remind_desc'))
          .margin({top:80})
          .fontColor($r('app.color.colorGreen'))
          .fontSize(20)
          .letterSpacing(10)
        Text($r('app.string.guide_remind_content_desc'))
          .margin({top:20})
          .fontColor($r('app.color.colorGray'))
          .textAlign(TextAlign.Center)
          .lineHeight(30)
        Blank().layoutWeight(1)
        Image($r('app.media.ui_main_guide_turn_right'))
          .width(60)
          .height(60)
          .margin({bottom:100})
          .onClick(()=>{
            //step one miss，step two show
            this.showStep = 2
          })
      }
      .width('100%')
      .visibility(this.showStep == 1 ? Visibility.Visible : Visibility.None)

      /*step two*/
      Column() {
        Image($r('app.media.ui_main_guide_target'))
          .width(200)
          .height(200)
          .margin({top:100})
        Text($r('app.string.guide_target_desc'))
          .margin({top:80})
          .fontColor($r('app.color.colorGreen'))
          .fontSize(20)
          .letterSpacing(10)
        Text($r('app.string.guide_target_content_desc'))
          .margin({top:20})
          .fontColor($r('app.color.colorGray'))
          .textAlign(TextAlign.Center)
          .lineHeight(30)
        Blank().layoutWeight(1)
        Image($r('app.media.ui_main_guide_turn_right'))
          .width(60)
          .height(60)
          .margin({bottom:100})
          .onClick(()=>{
            //step two miss，step three show
            this.showStep = 3
          })
      }
      .width('100%')
      .visibility(this.showStep == 2 ? Visibility.Visible : Visibility.None)

      /*step three*/
      Column() {
        Image($r('app.media.ui_main_guide_memorandum'))
          .width(200)
          .height(200)
          .margin({top:100})
        Text($r('app.string.guide_memorandum_desc'))
          .margin({top:80})
          .fontColor($r('app.color.colorGreen'))
          .fontSize(20)
          .letterSpacing(10)
        Text($r('app.string.guide_memorandum_content_desc'))
          .margin({top:20})
          .fontColor($r('app.color.colorGray'))
          .textAlign(TextAlign.Center)
          .lineHeight(30)
        Blank().layoutWeight(1)
        Button($r('app.string.guide_start_desc'),{type:ButtonType.Normal,stateEffect:true})
          .width(100)
          .height(60)
          .backgroundColor($r('app.color.colorGreen'))
          .margin({bottom:100})
          .borderRadius(10)
          .onClick(()=>{
            //to Index
            routerManager.replacePage(CommonConstants.MAIN_PAGE_PATH,()=>{
              logger.debug(CommonConstants.RUN_FAST_XM_DB_TAG,'跳转成功')
            },(error:BusinessError)=>{
              logger.debug(CommonConstants.RUN_FAST_XM_DB_TAG,'跳转失败' + error)
            })
          })
      }
      .width('100%')
      .visibility(this.showStep == 3 ? Visibility.Visible : Visibility.None)
    }
    .height('100%')
  }
}