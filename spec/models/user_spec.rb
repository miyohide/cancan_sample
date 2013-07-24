# coding: utf-8

require 'spec_helper'

describe User do
  context 'Validations' do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  context 'Validations when create' do
    subject { User.new }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
  end

  context 'Validations when update' do
    ## TODO ここの処理を綺麗に書けないかな？
    before do
      @user = User.new(username: 'test',
                       password: 'pass001',
                       password_confirmation: 'pass001')
      @user.save; @user.reload
      @user.username = 'edit_test'
    end
    it { @user.should_not validate_presence_of(:password) }
    it { @user.should_not validate_confirmation_of(:password) }
  end

  context 'roles is "admin"' do
    subject { u = User.new; u.roles = ["admin"]; u.roles }
    it { should eq ["admin"] }
  end

  context 'roles are "admin" and "viewer"' do
    subject { u = User.new; u.roles = ["admin", "viewer"]; u.roles }
    it { should eq ["admin", "viewer"] }
  end
end

