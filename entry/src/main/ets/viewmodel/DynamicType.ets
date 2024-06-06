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

export interface IDynamicType {

  id: string;

  typeName: string;

  description: string;

  isDefault: string;

  status: string;

  sortOrder: number;

  creationDate: number;

}

/**
 * Water flow item.
 */
export default class DynamicType implements IDynamicType {

  id: string;

  typeName: string;

  description: string;

  isDefault: string;

  status: string;

  sortOrder: number;

  creationDate: number;

  constructor(props: DynamicType) {
    this.id = props.id;
    this.typeName = props.typeName;
    this.description = props.description;
    this.isDefault = props.isDefault;
    this.status = props.status;
    this.sortOrder = props.sortOrder;
    this.creationDate = props.creationDate;
  }
}