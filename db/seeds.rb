# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# BarberShop_development=# insert into locations (city, branch_name, location, created_at, updated_at) values ('Самара', 'BarberShop Кирова', 'Ул. Кирова, д. 201', '2021-02-23 15:59', '2021-02-23 15:59');
# User.create!([
# { email: '', username: 'super_admin', password: '', role_id: '' },
# { email: '', username: 'super_admin', password: '', role_id: '' },
# { email: '', username: 'super_admin', password: '', role_id: '' },
# { email: '', username: 'super_admin', password: '', role_id: '' },
# ])

Location.create!([
{ city: 'Самара', branch_name: 'BarberShop Ново-Садовая', location: 'Ул. Ново-Садовая, д. 178б' },
{ city: 'Самара', branch_name: 'BarberShop Самарская', location: 'Ул. Самарская, д. 76' },
{ city: 'Самара', branch_name: 'BarberShop Мичурина', location: 'Ул. Мичурина, д. 172' },
{ city: 'Самара', branch_name: 'BarberShop Кирова', location: 'Ул. Кирова, д. 201' }
])
Service.create!([
{ name: 'Стрижка мужская', price: '1800', description: 'Подбор стиля, стрижка, мытье головы и укладка.' },
{ name: 'Стрижка детская (до 12)', price: '1200', description: 'С 3х до 12 лет включительно. Подбор стиля, стрижка, мытье головы и укладка.' },
{ name: 'Моделирование бороды', price: '1200', description: 'Придание формы машинкой, триммером, распаривание, придание формы опасной бритвой со сменными лезвиями, уход за бородой.' },
{ name: 'Стрижка под машину', price: '900', description: '---------' },
{ name: 'Мытье и укладка волос', price: '700', description: 'За короткое время подготовим Вас к любому мероприятию. Мастера придадут форму волосам с использованием профессиональный средств для укладки, разработанных специально для мужчин. Услуга длится не более 15 минут.' }
])

Hairdresser.create!([
{ name: 'Майк', position: 'Барбер', description: '7 лет' },
{ name: 'Джон', position: 'Барбер', description: '3 года' },
{ name: 'Анна', position: 'Леди-Барбер', description: '5 лет' }
])

Role.create!([
{ var_name: 'regular', name: 'Обычный', description: 'Доступен просмотр и создание объектов везде, кроме панели администратора' },
{ var_name: 'salon_manager', name: 'Менеджер салона парикмахерской', description: 'Доступны все CRUD действия с онлайн записями, в области
  своего салона. Не имеет возможности создавать пользователей и соответсвенно назначать им роли. Обладает доступом для просмотра всех
  или конкретного пользователя. Может добавлять новых парикмахеров и их услуги, в рамках своего салона.' },
{ var_name: 'admin', name: 'Аминистратор', description: 'Является главным ответственным за группу парикмахерких в городе / области.
  Может производить все операции CRUD в рамках своей зоны ответственности. Не может создавать пользователей с ролями выше или равной своей' },
{ var_name: 'super_admin', name: 'Генеральный директор / Супер-Админ', description: 'Доступны все операции CRUD, для всех ресурсов' }
])
