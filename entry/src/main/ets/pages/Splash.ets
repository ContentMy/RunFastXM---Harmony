import { CommonConstants } from '../common/constants/CommonConstants';
import MemorandumImgTable from '../common/database/tables/MemorandumImgTable';
import MemorandumTable from '../common/database/tables/MemorandumTable';
import RemindTable from '../common/database/tables/RemindTable';
import TargetCheckInTable from '../common/database/tables/TargetCheckInTable';
import TargetTable from '../common/database/tables/TargetTable';
import { routerManager } from '../common/utils/RouterManager';
import { BusinessError } from '@kit.BasicServicesKit';
import { logger } from '../common/utils/logger';

@Entry
@Component
@Preview
struct Guide {
  private timeOutId: number = 0;
  //TODO:暂时这里充当初始化的手段，因为在Ability中调用不到Table类，后续解决
  private targetTable:TargetTable = TargetTable.getInstance(()=>{})
  private targetImgTable: TargetCheckInTable = TargetCheckInTable.getInstance(()=>{})
  private remindTable:RemindTable = RemindTable.getInstance(()=>{})
  private memorandumTable:MemorandumTable = MemorandumTable.getInstance(()=>{})
  private memorandumImgTable:MemorandumImgTable = MemorandumImgTable.getInstance(()=>{})

  aboutToAppear() {//在此回调中添加定时器，2s后进入下一个页面
    this.timeOutId = setTimeout(() => {
      routerManager.replacePage(CommonConstants.GUIDE_PAGE_PATH,()=>{
        logger.debug(CommonConstants.RUN_FAST_XM_DB_TAG,'跳转成功')
      },(error:BusinessError)=>{
        logger.debug(CommonConstants.RUN_FAST_XM_DB_TAG,'跳转失败' + error)
      })
    }, 2000);
  }

  aboutToDisappear() {//在此回调中销毁定时器
    clearTimeout(this.timeOutId);
  }



  build() {
    Column(){
      Blank()
      Row(){
        Image($r('app.media.icon'))
          .width(50).height(50)
        Text($r('app.string.app_name'))
          .margin(10)
          .fontSize(20)
          .fontWeight(FontWeight.Bolder)
      }.margin(10)
    }.width('100%').height('100%')
  }
}