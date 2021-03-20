class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {'Пользователь' => 0,
              'Менеджер салона' => 1,
              'Администратор' => 2,
              'Супер-Админ' => 3 }
end

