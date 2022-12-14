class Condo < ApplicationRecord
  belongs_to :uf
  belongs_to :user
  has_many :apartaments

  accepts_nested_attributes_for :user

  validates :name, :address, :city, :uf, presence: true
  validates :name, uniqueness: { scope: [:address, :city], message: "Endereço duplicado" }

  scope :his_condo, ->(id) { where(id: id) }
end
