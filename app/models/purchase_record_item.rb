class PurchaseRecordItem < ApplicationRecord
  belongs_to :item
  belongs_to :purchase_record
end
