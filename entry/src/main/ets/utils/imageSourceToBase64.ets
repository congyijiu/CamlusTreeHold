import image from '@ohos.multimedia.image'
import util from '@ohos.util'
import { BusinessError } from '@ohos.base'
/**
 * 图片转base64格式
 *
 * @param format 待转化的图片类型（image/png、image/jpg、image/webp）
 * @param imageSource
 * @returns
 */
export function imageSourceToBase64(format: string, imageSource: image.ImageSource): Promise<string> {
  return new Promise((resolve, reject) => {
    image.createImagePacker().packing(imageSource, { format: format, quality: 100, bufferSize: 50 * 1024 * 1024 })
      .then((value: ArrayBuffer) => {
        let base64 = new util.Base64Helper
        let arrayStr = base64.encodeToStringSync(new Uint8Array(value))
        resolve(`data:${format};base64,${arrayStr}`)
      })
      .catch((err) => {
        reject(err)
      })
  })
}