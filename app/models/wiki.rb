class Wiki < ActiveRecord::Base
  belongs_to :user

 has_many :collaborations
 has_many :users, :through => :collaborations

  validates :body, presence: true
  scope :visible_to, -> (user) { user ? all : where(public: true)}

  def self.created_by(user)
    where(user_id: user)
  end

end
