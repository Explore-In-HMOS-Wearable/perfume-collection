import { vibrator } from '@kit.SensorServiceKit';
import { BusinessError } from '@kit.BasicServicesKit';

export class HapticService {
  /**
   * Trigger a success haptic feedback.
   * Used when adding to favorites.
   */
  static success(): void {
    try {
      vibrator.isSupportEffect('haptic.notice.success', (err: BusinessError, state: boolean) => {
        if (!err && state) {
          try {
            vibrator.startVibration({
              type: 'preset',
              effectId: 'haptic.notice.success',
              count: 1
            }, {
              usage: 'touch'
            });
          } catch (e) {
            HapticService.fallback(100);
          }
        } else {
          HapticService.fallback(100);
        }
      });
    } catch (err) {
      HapticService.fallback(100);
    }
  }

  /**
   * Trigger a soft haptic feedback.
   * Used when removing from favorites.
   */
  static soft(): void {
    try {
      vibrator.isSupportEffect('haptic.effect.soft', (err: BusinessError, state: boolean) => {
        if (!err && state) {
          try {
            vibrator.startVibration({
              type: 'preset',
              effectId: 'haptic.effect.soft',
              count: 1
            }, {
              usage: 'touch'
            });
          } catch (e) {
            HapticService.fallback(50);
          }
        } else {
          HapticService.fallback(50);
        }
      });
    } catch (err) {
      HapticService.fallback(50);
    }
  }

  /**
   * Fallback: simple time-based vibration.
   */
  private static fallback(duration: number): void {
    try {
      vibrator.startVibration({
        type: 'time',
        duration: duration
      }, {
        usage: 'touch'
      });
    } catch (err) {
      let e: BusinessError = err as BusinessError;
      console.error(`Haptic fallback failed: ${e.code}, ${e.message}`);
    }
  }
}
