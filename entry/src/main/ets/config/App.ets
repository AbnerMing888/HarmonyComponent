/**
 *AUTHOR:AbnerMing
 *DATE:2025/12/26
 *INTRODUCE:
 */
import { AppLog } from "@abner/app_log";
import { AbilityStage } from "@kit.AbilityKit";

export class App extends AbilityStage {
  onCreate(): void {
    AppLog.getAppLog().init({
      closeLog: false
    })
  }
}