FactoryBot.define do
  password = Faker::Internet.password(min_length: 6, max_length:6)
  
  factory :user do
    nickname {"tato"}
    email {Faker::Internet.email}
    password { password }
    password_confirmation { password }
    last_name {"山田"}
    first_name {"太郎"}
    kana_last_name {"ヤマダ"}
    kana_first_name {"タロウ"}
    birthday {Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today)} 
  end
end


# Fakerを使いたいのはemail　と　password。ほかのカラムの値は好きな内容を直接{"tato"}のように記述してOK