class SaizeCategory < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '単品' },
    { id: 2, name: 'お一人様サイズ' },
    { id: 3, name: '２〜３名様サイズ' },
    { id: 4, name: 'ファミリーサイズ' }
  ]
end
