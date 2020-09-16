class Speed < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '10〜15分でご用意できます' },
    { id: 2, name: '15〜30分でご用意できます' },
    { id: 3, name: '30〜60分でご用意できます' },
    { id: 4, name: '1時間前までのご予約でご用意できます' },
    { id: 5, name: '数に限りがございます。お電話で事前に問い合わせください' }
  ]
end
