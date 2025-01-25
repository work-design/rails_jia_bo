module Print
  module Ext::Organ
    extend ActiveSupport::Concern

    included do
      has_one :receipt_printer, -> { where(aim: 'receipt') }, class_name: 'Print::Device'
      has_one :produce_printer, -> { where(aim: 'produce') }, class_name: 'Print::Device'

      has_many :devices, class_name: 'Print::Device'
    end

  end
end
