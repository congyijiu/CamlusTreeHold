/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export interface IDynamicItem {

  id: string;

  imageUrl: string;

  title: string;

  username: string;

  avatarUrl: string;

  likeCount: number;

  isLike: number;

}

/**
 * Water flow item.
 */
export default class DynamicItem implements IDynamicItem {

  id: string;
  imageUrl: string;
  title: string;
  username: string;
  avatarUrl: string;
  likeCount: number;
  isLike: number;

  constructor(props: DynamicItem) {
    this.id = props.id;
    this.imageUrl = props.imageUrl;
    this.title = props.title;
    this.username = props.username;
    this.avatarUrl = props.avatarUrl;
    this.likeCount = props.likeCount;
    this.isLike = props.isLike;
  }
}