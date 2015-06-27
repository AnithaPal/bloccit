class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  #scope :public, -> {where(public: true)}
  # scope :visible_to, -> (user) :publicly_viewable
  scope :visible_to, -> {user ? all : where(public: true)}
  scope :publicly_viewable, -> { user ? all : where(public: true) }
  scope :privately_viewable, -> { user ? all : where(public: false) }

end
