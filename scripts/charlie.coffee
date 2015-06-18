module.exports = (robot) ->
  robot.respond /help$/i, (msg) ->
    message = "charlie-bot charlie 生存確認\n"
    message += "あいさつ系 おはようとかならbot宛でなくても返します\n"
    message += "charlie-bot pain 痛い話をします\n"
    message += "charlie-bot (sushi|寿司|すし) 寿司を握ってくれます\n"
    message += "charlie-bot select(.+) charlieが選んでくれます(選択肢の区切りは[　・、,\s]からどうぞ)\n"
    message += "charlie-bot (janken|じゃんけん|ジャンケン)(グー|チョキ|パー) charlieとじゃんけんができます\n"
    msg.send message

  robot.respond /charlie$/i, (msg) ->
    msg.send "斉藤サイクル:bicyclist:"

  robot.hear /(おはよう|おはよー|こんにちは|こんばんは|Hi|hello|お疲れ様|おつ|おつかれさま)$/i, (msg) ->
    message = msg.match[1]
    msg.reply message

  robot.respond /pain/i, (msg) ->
    pains = ['階段から落ちて手首を切る',
             'おしりにマイナスドライバーがささる',
             '左足人差し指の爪が剥がれる',
             '原付でウィリーしてこける',
             '親知らずを抜く',
             '気づいたら右手の中指が折れてました']
    pain = msg.random pains
    msg.send pain

  robot.respond /(sushi|寿司|すし)/i, (msg) ->
    msg.send "あいよっ！おまち！:sushi:"

  robot.hear /select(.+)/, (msg) ->
    items = msg.match[1].split(/[　・、,\s]+/)
    item = msg.random items
    msg.reply "#{item}がいいんじゃないかな"

  robot.respond /(janken|じゃんけん|ジャンケン)(.+)/i, (msg) ->
    youHand = msg.match[2]
    hands = ['グー',
             'チョキ',
             'パー']
    charlieHandNumber = Math.floor(Math.random() * 3)
    charlieHand  = hands[charlieHandNumber]
    youHandNumber = -1
    if 0 <= youHand.search(/グー/)
      youHandNumber = 0
    if 0 <= youHand.search(/チョキ/)
      youHandNumber = 1
    if 0 <= youHand.search(/パー/)
      youHandNumber = 2

    if youHandNumber == -1
      message = "janken グー または janken チョキ または janken パーで呼んでみてね"
      msg.reply message

    message = "じゃんけん " + charlieHand + "\n"
    judge = ((charlieHandNumber - youHandNumber) + 3 ) % 3
    switch judge
      when 0
        message += "あいこ!(´・ω・`)"
      when 2
        message += "charlieの勝ち!ヾ(*´∀`*)ﾉ ｷｬｯｷｬｯ ヾ(*´∀`*)ﾉ "
      else
        message += "あなたの勝ち.｡･ﾟ･(ﾉД`)･ﾟ･｡"
    msg.reply "#{message}"