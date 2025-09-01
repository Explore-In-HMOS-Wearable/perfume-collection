import { dummyPerfume, Perfume } from '../model/PerfumeModel';

@Observed
export class PerfumeViewModel {
  private _restaurantList: Array<Perfume> = dummyPerfume;
  private _filteredPerfumeList: Array<Perfume> = dummyPerfume;
  private _searchQuery: string = '';

  getFilteredPlacesList(): Array<Perfume> {
    return this._filteredPerfumeList;
  }

  getSearchQuery(): string {
    return this._searchQuery;
  }

  setSearchQuery(query: string): void {
    this._searchQuery = query;
    this._applyFilters();
  }

  private _applyFilters(): void {
    let filteredList = this._restaurantList;
    if (this._searchQuery.trim() !== '') {
      const query = this._searchQuery.toLowerCase();
      filteredList = filteredList.filter(
        (perfume) => perfume.name.toLowerCase().includes(query) || perfume.category.toLowerCase().includes(query)
      );
    }
    this._filteredPerfumeList = filteredList;
  }
}

