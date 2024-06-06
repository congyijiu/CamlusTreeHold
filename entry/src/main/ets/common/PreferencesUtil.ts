import preferences from '@ohos.data.preferences';


export class PreferencesUtil{


  static prefMap: Map<string, preferences.Preferences> = new Map()

  static token:string = ''

  static async loadPreference(context, name: string){
    try { // 加载preferences
      let pref = await preferences.getPreferences(context, name)
      this.prefMap.set(name, pref)
      console.log('testTag', `加载Preferences[${name}]成功`)
    } catch (e) {
      console.log('testTag', `加载Preferences[${name}]失败`, JSON.stringify(e))
    }
  }



  static async putPreferenceValue(name: string, key: string, value: preferences.ValueType){
    if (!this.prefMap.has(name)) {
      console.log('testTag', `Preferences[${name}]尚未初始化！`)
      return
    }
    try {
      let pref = this.prefMap.get(name)
      // 写入数据
      await pref.put(key, value)
      // 刷盘
      await pref.flush()
      console.log('testTag', `读取Preferences[${name}.${key} = ${value}]成功`)
    } catch (e) {
      console.log('testTag', `保存Preferences[${name}.${key} = ${value}]失败`, JSON.stringify(e))
    }
  }

  static async getPreferenceValue(name: string, key: string, defaultValue: preferences.ValueType){
    if (!this.prefMap.has(name)) {
      console.log('testTag', `Preferences[${name}]尚未初始化！`)
      return
    }
    try {
      let pref = this.prefMap.get(name)
      // 读数据
      let value = await pref.get(key, defaultValue)
      console.log('testTag', `读取Preferences[${name}.${key} = ${value}]成功`)
      return value
    } catch (e) {
      console.log('testTag', `读取Preferences[${name}.${key} ]失败`, JSON.stringify(e))
      return defaultValue
    }
  }

  static async deletePreferenceValue(name: string, key: string){
    if (!this.prefMap.has(name)) {
      console.log('testTag', `Preferences[${name}]尚未初始化！`)
      return
    }

    try {
      let pref = this.prefMap.get(name)
      // 删除数据
      await pref.delete(key)
      // 刷盘
      await pref.flush()
      console.log('testTag', `删除Preferences[${name}.${key}]成功`)

      // console.log('testTag', `保存Preferences[${name}.${key} = ${value}]成功`)
    } catch (e) {
      console.log('testTag', `删除Preferences[${name}.${key}]失败`, JSON.stringify(e))
    }
  }




  //获取用户token
  static async getUserToken(): Promise<string>{
    return await PreferencesUtil.getPreferenceValue('MyPreferences','token','') as unknown as string
  }


}

const preferencesUtil = new PreferencesUtil()

export default preferencesUtil as PreferencesUtil