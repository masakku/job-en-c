class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '農業・林業' },
    { id: 3, name: '漁業' },
    { id: 4, name: '建設' },
    { id: 5, name: '製造' },
    { id: 6, name: '電気・ガス・熱供給・水道' },
    { id: 7, name: '情報通信' },
    { id: 8, name: '運輸業・郵便' },
    { id: 9, name: '卸売業・小売' },
    { id: 10, name: '金融業・保険' },
    { id: 11, name: '不動産・物品賃貸' },
    { id: 12, name: '学術研究・専門・技術サービス' },
    { id: 13, name: '宿泊・飲食サービス' },
    { id: 14, name: '生活関連サービス・娯楽' },
    { id: 15, name: '教育・学術支援' },
    { id: 16, name: '医療・福祉' },
    { id: 17, name: '複合サービス' },
    { id: 18, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :matters
end
