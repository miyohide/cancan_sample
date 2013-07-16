# coding: utf-8

require 'spec_helper'

describe User do
  context 'Validations' do
    it { should validate_presence_of(:username) }
  end

  context 'Validations when create' do
    subject { User.new }
    it { should validate_presence_of(:password) }
  end

  ## TODO updateの時に失敗するようなテストを書きたい

end
