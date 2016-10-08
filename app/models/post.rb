# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer
#  sub_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :author_id, :sub_id, presence: true
  validates :author_id, scope: [:sub_id]

  belongs_to :author
  belongs_to :sub
end
