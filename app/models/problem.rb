class Problem < ApplicationRecord
  # association
  belongs_to :user
  has_many :answers, dependent: :destroy
  has_one :feed_content, as: :content, dependent: :destroy
  
  # validation
  validates_presence_of :user_id, :text
  validates :text, {length: {maximum: 100}}
  
  # callback
  after_create :create_feed_content

  private
  def create_feed_content
    self.feed_content = FeedContent.create(updated_at: updated_at)
  end
end
