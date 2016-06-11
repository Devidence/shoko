require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { is_expected.to belong_to :mentor }
  it { is_expected.to belong_to :student }
  it { is_expected.to have_many :questions }
end
