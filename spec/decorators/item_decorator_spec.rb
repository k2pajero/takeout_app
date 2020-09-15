# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ItemDecorator do
  let(:item) { Item.new.extend ItemDecorator }
  subject { item }
  it { should be_a Item }
end
