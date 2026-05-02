export class PreferencesService {
  private static instance: PreferencesService | null = null;
  private ids: string[] = [];

  private constructor() {}

  static getInstance(): PreferencesService {
    if (!PreferencesService.instance) {
      PreferencesService.instance = new PreferencesService();
    }
    return PreferencesService.instance;
  }

  init(): void {}

  getFavoriteIds(): string[] {
    return this.ids.slice();
  }

  isFavorite(perfumeId: string): boolean {
    return this.ids.indexOf(perfumeId) !== -1;
  }

  addFavorite(perfumeId: string): void {
    if (this.ids.indexOf(perfumeId) === -1) {
      this.ids.push(perfumeId);
    }
  }

  removeFavorite(perfumeId: string): void {
    let index = this.ids.indexOf(perfumeId);
    if (index !== -1) {
      this.ids.splice(index, 1);
    }
  }

  toggleFavorite(perfumeId: string): boolean {
    if (this.isFavorite(perfumeId)) {
      this.removeFavorite(perfumeId);
      return false;
    } else {
      this.addFavorite(perfumeId);
      return true;
    }
  }
}
