import  { IDynamicItem } from './DynamicItem';
import  DynamicDetailComment  from './DynamicDetailComment';
import  User  from './User';


const waterFlowData: IDynamicItem[] = [
  {
    "id": '1',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g00830rdc32381e0048jp4ulje2aiubnri20?imageView2/2/w/1080/format/webp",
    "title": "title1",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g00830rdc32381e0048jp4ulje2aiubnri20?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  },
  {
    "id": '2',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rmcij992e0048jp4ulje2aiq2a941g?imageView2/2/w/1080/format/webp",
    "title": "title2",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rmcij992e0048jp4ulje2aiq2a941g?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  },
  {
    "id": '3',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rl5ko5vik0048jp4ulje2airahe8fo?imageView2/2/w/1080/format/webp",
    "title": "title3",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rl5ko5vik0048jp4ulje2airahe8fo?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  },
  {
    "id": '4',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g00830rigsop91u0048jp4ulje2aiuh7ap4g?imageView2/2/w/1080/format/webp",
    "title": "title4",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g00830rigsop91u0048jp4ulje2aiuh7ap4g?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  },
  {
    "id": '5',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp",
    "title": "title5",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  },
  {
    "id": '6',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rhh568ui2005ndbrh5097b42gp5sr0?imageView2/2/w/1080/format/webp",
    "title": "title6",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rhh568ui2005ndbrh5097b42gp5sr0?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  },
  {
    "id": '7',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g00830rk9ebvtig005ndbrh5097b4pk92rp0?imageView2/2/w/1080/format/webp",
    "title": "title7",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g00830rk9ebvtig005ndbrh5097b4pk92rp0?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  },
  {
    "id": '8',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp",
    "title": "title8",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rmnv3r22g005ndbrh5097b4hqfklao?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  },
  {
    "id": '9',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rlesntqie005ndbrh5097b4b92nu20?imageView2/2/w/1080/format/webp",
    "title": "title9",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g2sg30rlesntqie005ndbrh5097b4b92nu20?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  },
  {
    "id": '10',
    "imageUrl": "https://sns-img-hw.xhscdn.com/1040g00830rk9ebvtig005ndbrh5097b4pk92rp0?imageView2/2/w/1080/format/webp",
    "title": "title10",
    "username": "John Doe",
    "avatarUrl": "https://sns-img-hw.xhscdn.com/1040g00830rk9ebvtig005ndbrh5097b4pk92rp0?imageView2/2/w/1080/format/webp",
    "likeCount": 0,
    "isLiked": 0
  }
];



const dynamicDetailData = {
  "id": '1',
  "imageUrlList": ["https://sns-img-hw.xhscdn.com/1040g00830rdc32381e0048jp4ulje2aiubnri20?imageView2/2/w/1080/format/webp","https://sns-img-hw.xhscdn.com/1040g2sg30rmcij992e0048jp4ulje2aiq2a941g?imageView2/2/w/1080/format/webp","https://sns-img-hw.xhscdn.com/1040g2sg30rl5ko5vik0048jp4ulje2airahe8fo?imageView2/2/w/1080/format/webp"],
  "title": "Sample Title",
  "author": "John Doe",
  "avatar": "https://example.com/avatar.jpg",
  "content": "This is a sample content for testing purposes.",
  "postDate": "2024-06-04T10:32:33Z",
  "commentCount": 15,
  "likeCount": 120,
  "favoriteCount": 45,
  "typeId": "67890",
  "isLike": 1,
  "isFavorite": 0,
  "isFollow": 1
}

const dynamicDetailCommentData : DynamicDetailComment = {
  id: '1',
  dynamicId: "1",
  content: "这是一条评论这是一条评论这是一条评论这是一条评论这是一条评论这是一条评论这是一条评论这是一条评论这是一条评论这是一条评论这是一条评论这是一条评论",
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