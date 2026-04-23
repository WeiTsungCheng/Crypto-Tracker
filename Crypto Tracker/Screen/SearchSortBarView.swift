//
//  SearchSortBarView.swift
//  Crypto Tracker
//
//  Created by WEITSUNG on 23/04/2026.
//

import SwiftUI

struct SearchSortBarView: View {
    
    @Bindable var vm: CoinListViewModel
    init(vm: CoinListViewModel) {
        self.vm = vm
    }
    var body: some View {
        VStack(spacing: 12) {
            TextField("Search Coins", text: $vm.searchText)
            
            Picker("Sort By", selection: $vm.sortOption) {
                ForEach(CoinListViewModel.SortOption.allCases) { option in
                    Text(option.rawValue)
                        .tag(option)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        
        
        
    }
}

#Preview {
    SearchSortBarView(vm: CoinListViewModel(api: APIService()))
}
