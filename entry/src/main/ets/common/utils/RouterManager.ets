import { router } from '@kit.ArkUI';
class RouterManager{

  jumpPage(pageUrl:string,callback: Function,errorCallback:Function){
    router.pushUrl({
      url: pageUrl // 目标url
    }, router.RouterMode.Standard, (err) => {
      if (err) {
        errorCallback(err)
        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      callback()
      console.info('Invoke pushUrl succeeded.')
    })
  }

  jumpPageWithParams(pageUrl:string,pageParams:object,callback: Function,errorCallback:Function){
    router.pushUrl({
      url: pageUrl,// 目标url
      params: {
        data:pageParams//这个key，目前是统一处理了value，后续优化可以将key值也交给外层来处理
      }
    }, router.RouterMode.Standard, (err) => {
      if (err) {
        errorCallback()
        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      callback()
      console.info('Invoke pushUrl succeeded.')
    })
  }

  replacePage(pageUrl:string,callback: Function,errorCallback:Function){
    router.replaceUrl({
      url: pageUrl // 目标url
    }, router.RouterMode.Standard, (err) => {
      if (err) {
        errorCallback(err)
        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      callback()
      console.info('Invoke pushUrl succeeded.')
    })
  }

  replacePageWithParams(pageUrl:string,pageParams:object,callback: Function,errorCallback:Function){
    router.replaceUrl({
      url: pageUrl,// 目标url
      params: {
        data:pageParams//这个key，目前是统一处理了value，后续优化可以将key值也交给外层来处理
      }
    }, router.RouterMode.Standard, (err) => {
      if (err) {
        errorCallback()
        console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`);
        return;
      }
      callback()
      console.info('Invoke pushUrl succeeded.')
    })
  }
}

export const routerManager = new RouterManager()
