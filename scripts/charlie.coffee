module.exports = (robot) ->
  robot.respond /help$/i, (msg) ->
    message = "charlie-bot charlie 生存確認\n"
    message += "charlie-bot あいさつ系 おはようとかなら返せます\n"
    message += "charlie-bot pain 痛い話をします\n"
    message += "charlie-bot (sushi|寿司|すし) 寿司を握ってくれます\n"
    message += "charlie-bot select(.+) charlieが選んでくれます(選択肢の区切りは[　・、,\s]からどうぞ)\n"
    message += "charlie-bot (janken|じゃんけん|ジャンケン)(グー|チョキ|パー) charlieとじゃんけんができます\n"
    msg.send message

  robot.respond /charlie$/i, (msg) ->
    msg.send "斉藤サイクル:bicyclist:"

  robot.respond /(おはよう|おはよー|こんにちは|こんばんは|Hi|hello|お疲れ様|おつ|おつかれさま)/i, (msg) ->
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
    hand = msg.match[2]
    message = "empty"
    if 0 <= hand.search(/グー/)
      message = "パー\n"
    if 0 <= hand.search(/チョキ/)
      message = "グー\n"
    if 0 <= hand.search(/パー/)
      message = "チョキ\n"

    if message != "empty"
      message = "じゃんけん " + message + "charlieの勝ち!ヾ(*´∀`*)ﾉ ｷｬｯｷｬｯ ヾ(*´∀`*)ﾉ "
    if message == "empty"
      message = "janken グー または janken チョキ または janken パーで呼んでみてね"
    msg.reply "#{message}"