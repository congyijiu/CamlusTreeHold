export interface IDynamicPage {

  // id: string;
  //
  // typeName: string;
  //
  // description: string;
  //
  // isDefault: string;
  //
  // status: string;
  //
  // sortOrder: number;
  //
  // creationDate: number;
  pageIndex: number;
  pageSize: number;
  userId: number;

}

/**
 * Water flow item.
 */
export default class DynamicPage implements IDynamicPage {
  userId: number;
  pageSize: number;
  pageIndex: number;

  constructor(userId: number, pageSize: number, pageIndex: number) {
    this.userId = userId;
    this.pageSize = pageSize;
    this.pageIndex = pageIndex;
  }

}