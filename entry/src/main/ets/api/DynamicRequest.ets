import axios, { AxiosError, AxiosResponse } from '@ohos/axios'

import { baseUrl,testtoken } from '../common/common'
import  DynamicItem  from '../viewmodel/DynamicItem'
import  DynamicDetail  from '../viewmodel/DynamicDetail'
import  DynamicDetailCommentPageVo  from '../viewmodel/DynamicDetailCommentPageVo'



export class DynamicRequest {
  static async getDynamicItem(dynamicdto: any): Promise<DynamicItem[]> {
    let dynamicItem:DynamicItem[] = []
    await axios.post(
      `${baseUrl}/dynamic/page`,
      {
        pageIndex: dynamicdto.pageIndex,
        pageSize: dynamicdto.pageSize,
        type: dynamicdto.type,
        keyWord: dynamicdto.keyWord,
        userId: dynamicdto.userId
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': testtoken
        }
      }

    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        dynamicItem = res.data.data.records
        console.log('getDynamicItem', JSON.stringify(dynamicItem))
      }else {
        console.log('getDynamicItem', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getDynamicItem', err.message)
    })
    return dynamicItem
  }

  static async getDynamicDetail(dynamicId: string): Promise<DynamicDetail> {
    let dynamicDetail:DynamicDetail
    await axios.post(
      `${baseUrl}/dynamic/detail/${dynamicId}`,
      {
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': testtoken
        }
      }

    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        dynamicDetail = res.data.data
        console.log('getDynamicItem', JSON.stringify(dynamicDetail))
      }else {
        console.log('getDynamicItem', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getDynamicItem', err.message)
    })

    return dynamicDetail
  }

  static async getDynamicDetailComments(dynamicCommentsDto: any): Promise<DynamicDetailCommentPageVo> {
    let dynamicCommentPage:DynamicDetailCommentPageVo
    await axios.post(
      `${baseUrl}/dynamic-comments/page`,
      {
        "pageIndex": dynamicCommentsDto.pageIndex,
        "pageSize": dynamicCommentsDto.pageSize,
        "dynamicId": dynamicCommentsDto.dynamicId,
        "topCommentId": dynamicCommentsDto.topCommentId,
        "type": dynamicCommentsDto.type
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': testtoken
        }
      }

    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        dynamicCommentPage = res.data.data
        // console.log('getDynamicDetailComments', JSON.stringify(dynamicCommentPage))
      }else {
        console.log('getDynamicDetailComments', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getDynamicDetailComments', err.message)
    })

    return dynamicCommentPage
  }
}
