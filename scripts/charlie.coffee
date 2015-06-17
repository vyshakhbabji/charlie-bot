module.exports = (robot) ->
  robot.respond /help$/i, (msg) ->
    message = "charlie 生存確認\n"
    message += "pain 痛い話をします\n"
    message += "sushi|寿司｜すし 寿司を握ってくれます\n"
    message += "select(.+) charlieが選んでくれます(選択肢の区切りは)\n"

    msg.send message

  robot.respond /charlie$/i, (msg) ->
    msg.send "斉藤サイクル:bicyclist:"

  robot.respond /pain/i, (msg) ->
    pains = ['階段から落ちて手首を切る',
             'おしりにマイナスドライバーがささる',
             '左足人差し指の爪が剥がれる',
             '気づいたら右手の中指が折れてました']
    pain = msg.random pains
    msg.send pain

  robot.respond /(sushi|寿司｜すし)/i, (msg) ->
    msg.send "あいよっ！おまち！:sushi:"

  robot.hear /select(.+)/, (msg) ->
    items = msg.match[1].split(/[　・、,\s]+/)
    item = msg.random items
    msg.reply "#{item}がいいんじゃないかな"