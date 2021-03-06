class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role, optional: true
  belongs_to :location
  before_save :assign_role

  enum area_of_responsibility: { not: 'not', salon: 'salon', city: 'city', area_all: 'area_all' }

  def assign_role
    self.role = Role.find_by var_name: 'regular' if role.nil?
  end

  def super_admin?
    role.var_name == 'super_admin'
  end

  def admin?
    role.var_name == 'admin'
  end

  def salon_manager?
    role.var_name == 'salon_manager'
  end

  def regular?
    role.var_name == 'regular'
  end

end

