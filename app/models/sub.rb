# == Schema Information
#
# Table name: subs
#
#  id           :integer          not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sub < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: :User

  validates :title, :description, :moderator_id, presence: true

  def ensure_sub_ownership
    self.moderator_id = current_user.id
  end
end
