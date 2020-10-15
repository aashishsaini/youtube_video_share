require 'rails_helper'

RSpec.describe Video, type: :model do
  it { is_expected.to validate_presence_of(:link) }
  it { should belong_to :user }
end
