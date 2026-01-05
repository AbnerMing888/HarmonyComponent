/**
 *AUTHOR:AbnerMing
 *DATE:2025/9/11
 *INTRODUCE:
 */
import { common, ConfigurationConstant } from "@kit.AbilityKit"
import { updateManager } from "@kit.StoreKit"
import deviceInfo from "@ohos.deviceInfo"

export class WindowUtils {
  static windowBottomNavHeight: number = 0
  static windowTopNavHeight: number = 0
  static windowColorMode?: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT
  static showConfig?: boolean = false

  /**
   * 检查是否有更新，使用Promise方式异步返回结果
   */
  static async checkAppUpdate(ctx: Context) {
    try {
      let context = ctx as common.UIAbilityContext
      let checkResult = await updateManager.checkAppUpdate(context)
      //检查结果
      if (checkResult.updateAvailable == updateManager.UpdateAvailableCode.LATER_VERSION_EXIST) {
        //存在新的版本
        updateManager.showUpdateDialog(context)
      }
    } catch (e) {

    }
  }

  /**
   *AUTHOR:AbnerMing
   *INTRODUCE:设备id
   */
  static getDeviceId(): string {
    return deviceInfo.ODID
  }
}