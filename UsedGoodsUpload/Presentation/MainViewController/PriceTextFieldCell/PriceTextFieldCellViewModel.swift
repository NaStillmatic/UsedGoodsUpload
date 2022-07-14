//
//  PriceTextFieldCellViewModel.swift
//  UsedGoodsUpload
//
//  Created by HwangByungJo  on 2022/07/13.
//

import RxSwift
import RxCocoa

struct PriceTextFieldCellViewModel {
  
  // ViewModel -> View
  let showFreeSharedButton: Signal<Bool>
  let resetPrice: Signal<Void>
  
  // View -> ViewModel
  let priceValue = PublishRelay<String?>()
  let freeShareButtonTapped = PublishRelay<Void>()
  
  init() {
    self.showFreeSharedButton = Observable
      .merge (
        priceValue.map { $0 ?? "" == "0" },
        freeShareButtonTapped.map { _ in false }
      )
      .asSignal(onErrorJustReturn: false)
    
    self.resetPrice = freeShareButtonTapped
      .asSignal(onErrorSignalWith: .empty())    
  }
  
  
}
