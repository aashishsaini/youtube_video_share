class Video < ApplicationRecord
  default_scope -> { order('created_at DESC') }
  belongs_to :user

  # validate youtube url so as to process the embeded attributes
  LINK_FORMAT = /\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/i
  validates :link, presence: true, format: LINK_FORMAT
end