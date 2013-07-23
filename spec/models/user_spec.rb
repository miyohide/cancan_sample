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

  context 'roles is "admin"' do
    subject { u = User.new; u.roles = ["admin"]; u.roles }
    it { should eq ["admin"] }
  end

  context 'roles are "admin" and "viewer"' do
    subject { u = User.new; u.roles = ["admin", "viewer"]; u.roles }
    it { should eq ["admin", "viewer"] }
  end
end
