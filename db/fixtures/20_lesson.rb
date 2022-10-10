2.times do |_n|
  Lesson.seed do |s|
    s.title = 'あなたのお悩み改善'
    s.price = Faker::Number.number(digits: 4)
    s.category = rand(1..7)
    s.time = Faker::Number.number(digits: 2)
    s.content = '「どうすればいいかわからない」そんなあなたのお悩みに合わせたプランを提案します'
    s.trainer_id = 1
  end
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = 'ダイエット相談'
    s.price = Faker::Number.number(digits: 4)
    s.category = rand(1..7)
    s.time = Faker::Number.number(digits: 2)
    s.content = 'ダイエットしたい方へ。体質に合わせた計画を。'
    s.trainer_id = 2
  end
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = '健康促進'
    s.price = Faker::Number.number(digits: 4)
    s.category = rand(1..7)
    s.time = Faker::Number.number(digits: 2)
    s.content = '毎日を健康的に過ごしたいかたへ'
    s.trainer_id = 3
  end
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = '姿勢改善'
    s.price = Faker::Number.number(digits: 4)
    s.category = 'pilates'
    s.time = Faker::Number.number(digits: 2)
    s.content = 'ピラティスで姿勢を改善しよう！'
    s.trainer_id = 4
  end
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = 'ぽっこりお腹を解消'
    s.price = Faker::Number.number(digits: 4)
    s.category = rand(1..7)
    s.time = Faker::Number.number(digits: 2)
    s.content = '気になるぽっこりお腹・・・。解消してみせましょう！'
    s.trainer_id = 5
  end
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = '減量プログラム'
    s.price = Faker::Number.number(digits: 4)
    s.category = rand(1..7)
    s.time = Faker::Number.number(digits: 2)
    s.content = '体重を減らしたいかたにおすすめ。どうやったら減量できるか教えます'
    s.trainer_id = 6
  end
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = 'サーキットトレーニング'
    s.price = Faker::Number.number(digits: 4)
    s.category = 'aerobic_exercise'
    s.time = Faker::Number.number(digits: 2)
    s.content = '異なる種目・種類の運動を繰り返して脂肪燃焼しよう！'
    s.trainer_id = 7
  end
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = 'あなたのお悩みを聞きます'
    s.price = Faker::Number.number(digits: 4)
    s.category = 'counseling'
    s.time = Faker::Number.number(digits: 2)
    s.content = '「どうすればいいかわからない」そんなあなたのお悩みに合わせたプランを提案します'
    s.trainer_id = 8
  end
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = 'ヨガで美姿勢'
    s.price = Faker::Number.number(digits: 4)
    s.category = 'yoga'
    s.time = Faker::Number.number(digits: 2)
    s.content = '美姿勢を手に入れよう！姿勢がいいと綺麗に見える！'
    s.trainer_id = 9
  end
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = 'ダイエットしたいあなたへ'
    s.price = Faker::Number.number(digits: 4)
    s.category = rand(1..7)
    s.time = Faker::Number.number(digits: 2)
    s.content = 'あなたに合ったダイエット方法を提案します'
    s.trainer_id = 10
  end
end

Lesson.seed do |s|
  s.title = '食事管理'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'meal_management'
  s.time = Faker::Number.number(digits: 2)
  s.content = '何事もまずは食事から。食生活を大切にすることで健康が手に入る。'
  s.trainer_id = 11
end

Lesson.seed do |s|
  s.title = '体幹トレーニング'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'pilates'
  s.time = Faker::Number.number(digits: 2)
  s.content = '体幹を鍛えて、引き締まったボディを手に入れよう'
  s.trainer_id = 12
end

Lesson.seed do |s|
  s.title = '簡単ストレッチ'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'stretch'
  s.time = Faker::Number.number(digits: 2)
  s.content = '体の硬さにお悩みのあなたへ。体をほぐすことで怪我の防止にもつながります。'
  s.trainer_id = 13
end

Lesson.seed do |s|
  s.title = '初めての方におすすめ筋トレ'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'muscle'
  s.time = Faker::Number.number(digits: 2)
  s.content = '筋トレをやったことがない方におすすめ。初めての方でもできる筋トレ。'
  s.trainer_id = 13
end

Lesson.seed do |s|
  s.title = '楽しい有酸素運動'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'aerobic_exercise'
  s.time = Faker::Number.number(digits: 2)
  s.content = '辛い運動も音楽に合わせれば辛くない！？楽しい時間を過ごしませんか？'
  s.trainer_id = 14
end

Lesson.seed do |s|
  s.title = '筋肉増量'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'muscle'
  s.time = Faker::Number.number(digits: 2)
  s.content = '筋肉をつけたい方におすすめ。筋トレでむきむきに'
  s.trainer_id = 15
end

Lesson.seed do |s|
  s.title = '健康促進'
  s.price = Faker::Number.number(digits: 4)
  s.category = rand(1..7)
  s.time = Faker::Number.number(digits: 2)
  s.content = '毎日を健康的に過ごしたいかたへ'
  s.trainer_id = 16
end

Lesson.seed do |s|
  s.title = '朝ヨガ'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'yoga'
  s.time = Faker::Number.number(digits: 2)
  s.content = '毎朝の習慣に。ヨガで自律神経のバランスを整えます'
  s.trainer_id = 17
end

Lesson.seed do |s|
  s.title = 'ストレッチで柔軟性のある体へ'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'stretch'
  s.time = Faker::Number.number(digits: 2)
  s.content = '体の硬さにお悩みのあなたへ。体をほぐすことで怪我の防止にもつながります。'
  s.trainer_id = 18
end

Lesson.seed do |s|
  s.title = 'まずは食事から'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'meal_management'
  s.time = Faker::Number.number(digits: 2)
  s.content = '毎日口にするものに気をつけることで内側から健康的な体へ'
  s.trainer_id = 19
end

Lesson.seed do |s|
  s.title = 'ピラティスで骨盤矯正'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'pilates'
  s.time = Faker::Number.number(digits: 2)
  s.content = 'ピラティスで骨盤の歪みを改善しましょう。骨盤改善は内臓の位置やぽっこりお腹の解消につながります。'
  s.trainer_id = 20
end

Lesson.seed do |s|
  s.title = 'ヨガでリラックス'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'yoga'
  s.time = Faker::Number.number(digits: 2)
  s.content = 'ヨガで自律神経のバランスを整えます'
  s.trainer_id = 21
end

Lesson.seed do |s|
  s.title = '脂肪燃焼 痩せやすい体づくりへ'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'aerobic_exercise'
  s.time = Faker::Number.number(digits: 2)
  s.content = '有酸素運動で痩せやすい体を目指します'
  s.trainer_id = 22
end

Lesson.seed do |s|
  s.title = 'ダイエットしたいあなたへ'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'counseling'
  s.time = Faker::Number.number(digits: 2)
  s.content = 'あなたに合ったダイエット方法を提案します'
  s.trainer_id = 23
end

Lesson.seed do |s|
  s.title = '自重トレーニング'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'muscle'
  s.time = Faker::Number.number(digits: 2)
  s.content = '器具を使わず、自分の体重だけで筋トレを行います。'
  s.trainer_id = 24
end

2.times do |_n|
  Lesson.seed do |s|
    s.title = 'あなたに合わせたボディメイク'
    s.price = Faker::Number.number(digits: 4)
    s.category = rand(1..7)
    s.time = Faker::Number.number(digits: 2)
    s.content = 'ボディメイクしたいあなたにおすすめの方法を教えます'
    s.trainer_id = 25
  end
end

Lesson.seed do |s|
  s.title = '姿勢改善ヨガ'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'yoga'
  s.time = Faker::Number.number(digits: 2)
  s.content = '姿勢改善することで様々な身体的機能の向上が期待できます。'
  s.trainer_id = 26
end

Lesson.seed do |s|
  s.title = '初めてのヨガ'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'yoga'
  s.time = Faker::Number.number(digits: 2)
  s.content = '初めての方でもできるヨガです。'
  s.trainer_id = 27
end

Lesson.seed do |s|
  s.title = '器具を使わない有酸素運動'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'aerobic_exercise'
  s.time = Faker::Number.number(digits: 2)
  s.content = '器具がなくてもお家でできる有酸素運動を一緒にやりましょう！'
  s.trainer_id = 27
end

Lesson.seed do |s|
  s.title = '楽しく筋トレ'
  s.price = Faker::Number.number(digits: 4)
  s.category = 'muscle'
  s.time = Faker::Number.number(digits: 2)
  s.content = '器具を使わずに家でできる筋トレを教えます'
  s.trainer_id = 28
end
