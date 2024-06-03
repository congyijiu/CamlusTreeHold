import  { IDynamicItem } from './DynamicItem';
import  DynamicDetailComment  from './DynamicDetailComment';
import  User  from './User';



const waterFlowData: IDynamicItem[] = [
  {
    "id": '1',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g00830rdc32381e0048jp4ulje2aiubnri20?imageView2/2/w/1080/format/webp",
    "title": "title1",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g00830rdc32381e0048jp4ulje2aiubnri20?imageView2/2/w/1080/format/webp"
  },
  {
    "id": '2',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g2sg30rmcij992e0048jp4ulje2aiq2a941g?imageView2/2/w/1080/format/webp",
    "title": "title2",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g2sg30rmcij992e0048jp4ulje2aiq2a941g?imageView2/2/w/1080/format/webp"
  },
  {
    "id": '3',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g2sg30rl5ko5vik0048jp4ulje2airahe8fo?imageView2/2/w/1080/format/webp",
    "title": "title3",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g2sg30rl5ko5vik0048jp4ulje2airahe8fo?imageView2/2/w/1080/format/webp"
  },
  {
    "id": '4',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g00830rigsop91u0048jp4ulje2aiuh7ap4g?imageView2/2/w/1080/format/webp",
    "title": "title4",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g00830rigsop91u0048jp4ulje2aiuh7ap4g?imageView2/2/w/1080/format/webp"
  },
  {
    "id": '5',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp",
    "title": "title5",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp"
  },
  {
    "id": '6',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g2sg30rhh568ui2005ndbrh5097b42gp5sr0?imageView2/2/w/1080/format/webp",
    "title": "title6",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g2sg30rhh568ui2005ndbrh5097b42gp5sr0?imageView2/2/w/1080/format/webp"
  },
  {
    "id": '7',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g00830rk9ebvtig005ndbrh5097b4pk92rp0?imageView2/2/w/1080/format/webp",
    "title": "title7",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g00830rk9ebvtig005ndbrh5097b4pk92rp0?imageView2/2/w/1080/format/webp"
  },
  {
    "id": '8',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp",
    "title": "title8",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp"
  },
  {
    "id": '9',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g2sg30rlesntqie005ndbrh5097b4b92nu20?imageView2/2/w/1080/format/webp",
    "title": "title9",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g2sg30rlesntqie005ndbrh5097b4b92nu20?imageView2/2/w/1080/format/webp"
  },
  {
    "id": '10',
    "image_url": "https://sns-img-hw.xhscdn.com/1040g00830rk9ebvtig005ndbrh5097b4pk92rp0?imageView2/2/w/1080/format/webp",
    "title": "title10",
    "author": "John Doe",
    "avatar": "https://sns-img-hw.xhscdn.com/1040g00830rk9ebvtig005ndbrh5097b4pk92rp0?imageView2/2/w/1080/format/webp"
  }

];

const dynamicDetailData = {
  "id": '1',
  "image_url": ["https://sns-img-hw.xhscdn.com/1040g00830rdc32381e0048jp4ulje2aiubnri20?imageView2/2/w/1080/format/webp","https://sns-img-hw.xhscdn.com/1040g2sg30rmcij992e0048jp4ulje2aiq2a941g?imageView2/2/w/1080/format/webp","https://sns-img-hw.xhscdn.com/1040g2sg30rl5ko5vik0048jp4ulje2airahe8fo?imageView2/2/w/1080/format/webp"],
  "title": "这是一个标题这是一个标题这是一个标题这",
  "author": "John Doe",
  "avatar": "https://sns-img-hw.xhscdn.com/1040g00830rdc32381e0048jp4ulje2aiubnri20?imageView2/2/w/1080/format/webp",
  "content": "这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话这是一段话",
  "createTime": "2020-12-12 12:12:12"
}

const dynamicDetailCommentData : DynamicDetailComment = {
  id: '1',
  dynamicId: "1",
  content: "这是一条评论",
  createTime: "2020-12-12 12:12:12",
  updateTime: "2020-12-12 12:12:12",
  likeCount: 10,
  replyCount: 10,
  user: {
    id: '1',
    username: "John Doe",
    avatarUrl: "https://sns-img-hw.xhscdn.com/1040g00830rdc32381e0048jp4ulje2aiubnri20?imageView2/2/w/1080/format/webp",
    age:1,
    email:"",
    phoneNumber:''
  }
}



export {waterFlowData,dynamicDetailData,dynamicDetailCommentData};