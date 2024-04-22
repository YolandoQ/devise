class Order < ApplicationRecord
  belongs_to :computer_build

  validates :cpf, presence: true, cpf: true, length: { is: 11 }

  def normalize_cpf
    cpf.gsub!(/\D/, '') if cpf.present?
  end
end
