import { dummyPerfume, Perfume } from '../model/PerfumeModel';
import { PreferencesService } from '../service/PreferencesService';
import { HapticService } from '../service/HapticService';

@Observed
export class PerfumeViewModel {
  private perfumeList: Array<Perfume> = dummyPerfume;
  private filteredList: Array<Perfume> = dummyPerfume;
  private searchQuery: string = '';
  private preferencesService: PreferencesService = PreferencesService.getInstance();

  getFilteredPerfumeList(): Array<Perfume> {
    return this.filteredList;
  }

  getSearchQuery(): string {
    return this.searchQuery;
  }

  setSearchQuery(query: string): void {
    this.searchQuery = query;
    this.applyFilters();
  }

  getFavoritePerfumes(): Array<Perfume> {
    let favoriteIds = this.preferencesService.getFavoriteIds();
    return this.perfumeList.filter(
      (perfume) => favoriteIds.indexOf(perfume.id) !== -1
    );
  }

  isFavorite(perfumeId: string): boolean {
    return this.preferencesService.isFavorite(perfumeId);
  }

  toggleFavorite(perfumeId: string): boolean {
    let newState = this.preferencesService.toggleFavorite(perfumeId);
    if (newState) {
      HapticService.success();
    } else {
      HapticService.soft();
    }
    return newState;
  }

  private applyFilters(): void {
    let result = this.perfumeList;
    if (this.searchQuery.trim() !== '') {
      const query = this.searchQuery.toLowerCase();
      result = result.filter(
        (perfume) =>
          perfume.name.toLowerCase().includes(query) ||
          perfume.category.toLowerCase().includes(query)
      );
    }
    this.filteredList = result;
  }
}
