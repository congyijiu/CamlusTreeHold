import axios, { AxiosError, AxiosResponse } from '@ohos/axios'

import { baseUrl,testtoken } from '../common/common'
import  DynamicItem  from '../viewmodel/DynamicItem'
import  DynamicDetail  from '../viewmodel/DynamicDetail'
import  DynamicDetailCommentPageVo  from '../viewmodel/DynamicDetailCommentPageVo'
import DynamicType from '../viewmodel/DynamicType'

import PreferencesUtil from '../common/PreferencesUtil'


export class DynamicRequest {

  //获取动态列表
  static async getDynamicItem(dynamicdto: any): Promise<DynamicItem[]> {
    let dynamicItem:DynamicItem[] = []
    let token:string = ''

    await PreferencesUtil.getUserToken().then((value) => {
      token = value
      console.log('getUserToken', JSON.stringify(token))
    })

    await axios.post(
      `${baseUrl}/dynamic/page`,
      {
        pageIndex: dynamicdto.pageIndex,
        pageSize: dynamicdto.pageSize,
        type: dynamicdto.type,
        keyWord: dynamicdto.keyWord,
        userId: dynamicdto.userId,
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': token
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


  //获取动态详情
  static async getDynamicDetail(dynamicId: string): Promise<DynamicDetail> {
    let dynamicDetail:DynamicDetail
    let token:string = ''

    await PreferencesUtil.getUserToken().then((value) => {
      token = value
      console.log('getUserToken', JSON.stringify(token))
    })

    await axios.post(
      `${baseUrl}/dynamic/detail/${dynamicId}`,
      {
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': token
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


  //获取动态详情评论
  static async getDynamicDetailComments(dynamicCommentsDto: any): Promise<DynamicDetailCommentPageVo> {
    let token:string = ''

    await PreferencesUtil.getUserToken().then((value) => {
      token = value
      console.log('getUserToken', JSON.stringify(token))
    })

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
          'token': token
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


  //根据ID查询用户收藏的动态
  static async getUserFavoriteDynamicItemById(dynamicdto: any): Promise<DynamicItem[]> {
    let dynamicItem:DynamicItem[] = []
    let token:string = ''

    await PreferencesUtil.getUserToken().then((value) => {
      token = value
      console.log('getUserToken', JSON.stringify(token))
    })

    await axios.post(
      `${baseUrl}/dynamic/favorite/page`,
      {
        pageIndex: dynamicdto.pageIndex,
        pageSize: dynamicdto.pageSize,
        userId: dynamicdto.userId,
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': token
        }
      }

    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        dynamicItem = res.data.data.records
        console.log('getUserFavoriteDynamicItemById', JSON.stringify(dynamicItem))
      }else {
        console.log('getUserFavoriteDynamicItemById', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getUserFavoriteDynamicItemById', err.message)
    })
    return dynamicItem
  }



  static async addDynamicComment(dynamicCommentsAddDto: any): Promise<any> {
    let comment:any
    await axios.post(
      `${baseUrl}/dynamic-comments/add`,
      {
        "dynamicId": dynamicCommentsAddDto.dynamicId,
        "content": dynamicCommentsAddDto.content,
        "topCommentId": dynamicCommentsAddDto.topCommentId,
        "toCommentId": dynamicCommentsAddDto.toCommentId
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
        comment = res.data.data
        console.log('addDynamicComment', JSON.stringify(comment))
      }else {
        console.log('addDynamicComment', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('addDynamicComment', err.message)
    })

    return comment
  }

  static async getAllDynamicType(): Promise<DynamicType[]> {
    let dynamicTypeList:DynamicType[] = []
    await axios.post(
      `${baseUrl}/dynamicType/list`,
      {},
      {
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'token': testtoken
        }
      }
    ).then((res: AxiosResponse) => {
      if (res.status === 200) {
        dynamicTypeList = res.data.data
        console.log('getAllDynamicType', JSON.stringify(dynamicTypeList))
      }else {
        console.log('getAllDynamicType', res.data.errorMessage)
      }
    }).catch((err: AxiosError) => {
      console.log('getAllDynamicType', err.message)
    })

    return dynamicTypeList
  }
}
