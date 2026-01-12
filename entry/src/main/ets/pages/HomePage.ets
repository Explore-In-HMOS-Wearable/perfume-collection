import { dummyPerfume, Perfume } from '../model/PerfumeModel';
import {cryptoFramework} from '@kit.CryptoArchitectureKit';

@Builder
export function HomePageBuilder() {
  HomePage()
}

@Entry
@Component
struct HomePage {
  @State selectedPerfume: Perfume | null = null;
  @Consume('mainStack') pathStack: NavPathStack;

  build() {
    NavDestination() {

      Column() {
        Row() {
          Button('Perfume of the Day')
            .height(50)
            .margin(2)
            .width('100%')
            .backgroundColor('#ff8c7b2f')
            .onClick(() => {
              const randomIndex = Math.floor(secureRandomNumber() * dummyPerfume.length);
              this.selectedPerfume = dummyPerfume[randomIndex];
              this.pathStack.pushPath({
                name: 'PerfumeOfTheDayPage',
                param:
                {
                  name: this.selectedPerfume.name,
                  image: this.selectedPerfume.image,
                  category: this.selectedPerfume.category,
                  description: this.selectedPerfume.description
                } as Perfume
              })
            })
        }
        .borderRadius(50)
        .width('80%')
        .margin({ bottom: 2 })

        Row() {
          Button('Perfumes')
            .height(50)
            .margin(2)
            .width('100%')
            .backgroundColor('#ff8c7b2f')
        }
        .borderRadius(50)
        .width('80%')
        .margin({ bottom: 2 })
        .onClick(() => {
          this.pathStack.pushPathByName('ChooseGenderPage', null)
        })

        Row() {
          Button('Favorites')
            .height(50)
            .margin(2)
            .width('100%')
            .backgroundColor('#ff8c7b2f')
        }
        .borderRadius(50)
        .width('80%')
        .onClick(() => {
          this.pathStack.pushPathByName('FavoritesPage', null)
        })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#ffd4c890')

    }
    .hideBackButton(true)
  }
}

/**
 * Generates a secure random number between 0 (inclusive) and 1 (exclusive)
 * using synchronous crypto operations.
 * @returns A random number between 0 and 1
 */
export function secureRandomNumber(): number {
  const rand = cryptoFramework.createRandom();
  const len = 8; // 8 bytes (64 bits)
  const randData = rand.generateRandomSync(len);
  const bytes = randData.data;
  let bigIntValue = BigInt(0);
  // Combine all 64 bits into a BigInt
  for (let i = 0; i < 8; i++) {
    bigIntValue = (bigIntValue << BigInt(8)) | BigInt(bytes[i]);
  }
  // Take the upper 53 bits for full floating-point precision
  const maxSafeValue = BigInt(1) << BigInt(53); // 2^53
  const normalizedValue = Number(bigIntValue >> BigInt(11)) / Number(maxSafeValue);
  return normalizedValue;
}