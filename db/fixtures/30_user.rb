User.seed do |s|
  s.name = '清水 結衣'
  s.name_kana = 'シミズ ユイ'
  s.avatar = Rails.root.join('db/fixtures/files/user.jpg').open
  s.email = 'test@example.com'
  s.gender = rand(1..2)
  s.password = 'password'
  s.password_confirmation = 'password'
end
