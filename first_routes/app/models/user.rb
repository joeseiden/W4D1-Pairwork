# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contacts,
    dependent: :destroy

  has_many :contact_shares,
    dependent: :destroy

  has_many :comments, as: :commentable

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact
end
