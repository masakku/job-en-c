class Scheduled < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '週1日以下' },
    { id: 3, name: '週２日' },
    { id: 4, name: '週３日' },
    { id: 5, name: '週４日' },
    { id: 6, name: '週４日以上' },
    { id: 7, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :matters
end
