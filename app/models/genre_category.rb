class GenreCategory < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'サラダ' },
    { id: 2, name: 'スープ' },
    { id: 3, name: '前菜' },
    { id: 4, name: 'パスタ' },
    { id: 5, name: 'パン・米料理' },
    { id: 6, name: 'ピザ' },
    { id: 7, name: '肉料理' },
    { id: 8, name: 'デザート' },
    { id: 9, name: 'ドリンク' },
    { id: 10, name: '期間限定' }
  ]
end
