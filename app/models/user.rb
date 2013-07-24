# coding: utf-8

class User < ActiveRecord::Base
  ## admin    : すべてのものを編集・削除可能
  ## author   : そのオブジェクトの作者、作ったものの編集・削除が可能
  ## viewer   : すべてのものを参照のみ
  ROLES = %w(admin author viewer)

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask || 0) & 2**ROLES.index(r)).zero?
    end
  end

  authenticates_with_sorcery!
  attr_accessible :username, :email, :password, :password_confirmation, :roles_mask

  validates_confirmation_of :password, on: :create
  validates_presence_of :password, on: :create
 
  validates_presence_of :username
  validates_uniqueness_of :username
  
end
