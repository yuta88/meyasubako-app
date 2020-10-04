class Answer < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :answer
  has_one :feed_content, as: :content, dependent: :destroy
  
  # validation
  validates_presence_of :user_id, :text
  
  # callback
  after_create :create_feed_content
  after_update :update_feed_content
  
  private
  def create_feed_content
    self.feed_content = FeedContent.create(updated_at: updated_at)
  end
  
  def update_feed_content
    self.feed_content.update(updated_at: updated_at)
  end
end
