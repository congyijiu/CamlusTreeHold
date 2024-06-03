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

  image_url: string;

  title: string;

  author: string;

  avatar: string;

}

/**
 * Water flow item.
 */
export default class DynamicItem implements IDynamicItem {

  id: string;
  image_url: string;
  title: string;
  author: string;
  avatar: string;

  constructor(props: DynamicItem) {
    this.id = props.id;
    this.image_url = props.image_url;
    this.title = props.title;
    this.author = props.author;
    this.avatar = props.avatar;
  }
}