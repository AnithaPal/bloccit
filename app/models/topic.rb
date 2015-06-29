class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  #scope :public, -> {where(public: true)}
  # scope :visible_to, -> (user) :publicly_viewable
  scope :visible_to, -> (user) {user ? all : publicly_viewable}
  scope :publicly_viewable, -> { where(public: true) }
  scope :privately_viewable, -> { where(public: false) }

end
